# Checks de governança

O Dispatch automatiza regras mecânicas de governança separadamente da CI de qualidade da aplicação.

## Objetivo

Os checks desta camada validam políticas do repositório antes de linting, análise estática, testes ou build da aplicação.

## Workflows

### Branch policy

Arquivo: `.github/workflows/branch-policy.yml`

Check estável:

```text
governance / branch-policy
```

Valida:

- branch temporária válida para `dev`;
- `dev -> staging`;
- `staging -> main`;
- `hotfix/<issue>-<slug> -> main`;
- sincronização de `main` para `staging` e `dev` após hotfix;
- branches do Dependabot apenas para `dev`.

### Commit policy

Arquivo: `.github/workflows/commit-policy.yml`

Check estável:

```text
governance / commit-policy
```

Valida os commits abrangidos pelo Pull Request:

- tipos permitidos;
- scope opcional em lowercase/kebab-case;
- header com até 100 caracteres;
- sintaxe Conventional Commits;
- descrição sem ponto final;
- footer `BREAKING CHANGE:` quando o header utiliza `!`;
- merge commits estruturais são ignorados.

### Pull Request title

Arquivo: `.github/workflows/pr-title.yml`

Check estável:

```text
governance / pr-title
```

Valida a mesma estrutura semântica usada pelos commits e limita o título a 100 caracteres.

### Release policy

Arquivo: `.github/workflows/release-policy.yml`

Check:

```text
governance / release-policy
```

Valida:

- tag no formato `vMAJOR.MINOR.PATCH`;
- resolução de lightweight ou annotated tag até um commit;
- commit da tag pertencente ao histórico de `main`.

Esse check ocorre no evento de tag e não faz parte do gate normal de Pull Request.

## Required status checks

Os três checks de Pull Request devem ser configurados como required status checks nos rulesets de `dev`, `staging` e `main`:

```text
governance / branch-policy
governance / commit-policy
governance / pr-title
```

A configuração desejada é mantida em `.github/rulesets/`.

## Permissões

Os workflows utilizam somente permissões de leitura necessárias ao próprio check.

Nenhuma credencial de produção, token administrativo ou action de terceiros é necessária.

## Diagnóstico

Quando um check falhar:

1. abrir o job correspondente;
2. ler a mensagem de violação emitida pelo workflow;
3. corrigir a branch, commit, título ou tag na origem;
4. executar novamente pelo evento normal.

Checks não devem ser contornados por bypass permanente.
