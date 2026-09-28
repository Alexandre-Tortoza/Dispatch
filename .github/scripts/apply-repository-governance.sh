#!/usr/bin/env bash

set -euo pipefail

repository="${1:-Alexandre-Tortoza/Dispatch}"
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ruleset_dir="${root_dir}/.github/rulesets"

for command_name in gh jq; do
    if ! command -v "${command_name}" >/dev/null 2>&1; then
        printf 'Required command not found: %s\n' "${command_name}" >&2
        exit 1
    fi
done

gh auth status >/dev/null

apply_ruleset() {
    local file="$1"
    local name
    local existing_id

    name="$(jq -r '.name' "${file}")"

    if [[ -z "${name}" || "${name}" == "null" ]]; then
        printf 'Ruleset file has no valid name: %s\n' "${file}" >&2
        exit 1
    fi

    existing_id="$(
        gh api "repos/${repository}/rulesets" --paginate             --jq ".[] | select(.name == \"${name}\") | .id"             | head -n 1
    )"

    if [[ -n "${existing_id}" ]]; then
        printf 'Updating ruleset %s (%s)\n' "${name}" "${existing_id}"
        gh api             --method PUT             "repos/${repository}/rulesets/${existing_id}"             --input "${file}"             >/dev/null
        return
    fi

    printf 'Creating ruleset %s\n' "${name}"
    gh api         --method POST         "repos/${repository}/rulesets"         --input "${file}"         >/dev/null
}

for ruleset_file in     "${ruleset_dir}/dev.json"     "${ruleset_dir}/staging.json"     "${ruleset_dir}/main.json"
do
    apply_ruleset "${ruleset_file}"
done

printf 'Normalizing repository merge settings\n'

gh api     --method PATCH     "repos/${repository}"     --input -     >/dev/null <<'JSON'
{
  "allow_merge_commit": true,
  "allow_squash_merge": false,
  "allow_rebase_merge": false,
  "delete_branch_on_merge": true
}
JSON

printf 'Repository governance settings applied to %s\n' "${repository}"
