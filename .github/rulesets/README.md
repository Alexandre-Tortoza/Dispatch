# Repository rulesets

Este diretório mantém a configuração desejada dos rulesets que protegem as branches permanentes do Dispatch.

Os arquivos são versionados para que as proteções administrativas não existam apenas como estado implícito na interface do GitHub.

## Rulesets

- `dev.json`, protege a branch de integração.
- `staging.json`, protege a branch candidata a produção.
- `main.json`, protege a branch de produção.

Os três rulesets:

- bloqueiam exclusão da branch;
- bloqueiam non-fast-forward e force push;
- exigem Pull Request;
- exigem resolução de conversas;
- não exigem aprovação humana enquanto houver mantenedor único;
- aceitam somente **Merge Commit** como método de merge.

Origem e destino dos Pull Requests são validados pelos checks de governança, porque rulesets de branch não representam por si só toda a matriz `temporary -> dev -> staging -> main`.

## Aplicação

Use:

```bash
.github/scripts/apply-repository-governance.sh Alexandre-Tortoza/Dispatch
```

O comando requer:

- GitHub CLI autenticado com permissão administrativa sobre o repositório;
- `jq`.

O script cria ou atualiza rulesets com o mesmo nome e também normaliza as opções globais de merge do repositório.
