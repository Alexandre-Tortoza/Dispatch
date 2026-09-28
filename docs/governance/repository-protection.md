# Proteção do repositório

As branches permanentes do Dispatch devem transformar as políticas documentadas em restrições técnicas no GitHub.

## Branches protegidas

A proteção se aplica a:

- `dev`;
- `staging`;
- `main`.

A configuração desejada é versionada em `.github/rulesets/`.

## Regras comuns

Cada branch permanente deve:

- receber mudanças por Pull Request;
- bloquear exclusão;
- bloquear force push e demais atualizações non-fast-forward;
- exigir resolução de conversas;
- aceitar apenas **Merge Commit**;
- permanecer compatível com o cenário de mantenedor único.

Required reviews de CODEOWNERS não são habilitados enquanto não houver uma estrutura real de múltiplos mantenedores.

## Matriz de origem e destino

Rulesets nativos protegem a referência de destino, mas a matriz de promoção é uma política de relacionamento entre branches.

Por isso, o enforcement completo combina:

1. rulesets para proteger `dev`, `staging` e `main`;
2. checks de governança para validar `temporary -> dev`, `dev -> staging`, `staging -> main` e o fluxo excepcional de hotfix.

## Métodos de merge

O estado desejado do repositório é:

```text
Merge Commit  = enabled
Squash Merge  = disabled
Rebase Merge  = disabled
```

A política normativa permanece em `pull-requests.md`.

## Configuração reproduzível

O script `.github/scripts/apply-repository-governance.sh` aplica os rulesets versionados e normaliza as opções globais de merge.

O script é idempotente por nome de ruleset: quando a regra já existe, ela é atualizada; caso contrário, é criada.

A execução exige uma identidade com permissão administrativa sobre o repositório. Tokens de CI com permissões inferiores não devem receber privilégios administrativos apenas para automatizar esta etapa.

## Required status checks

Os checks de governança devem possuir nomes estáveis para serem adicionados posteriormente aos rulesets como required status checks.

Checks de qualidade da aplicação pertencem à milestone de Continuous Integration e só devem ser exigidos depois que existirem e estiverem estáveis.

## Verificação

Após aplicar a configuração, deve-se confirmar no GitHub que:

- as três branches possuem rulesets ativos;
- force push e exclusão estão bloqueados;
- Pull Request é obrigatório;
- somente Merge Commit é permitido;
- não existe required approval impossível para o mantenedor único;
- os rulesets correspondem aos arquivos versionados.
