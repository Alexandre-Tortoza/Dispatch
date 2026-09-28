# Estratégia de branches e promoção

O Dispatch utiliza três branches permanentes para separar integração, validação e produção sem criar fluxos paralelos desnecessários.

## Branches permanentes

### `dev`

Branch de integração contínua do desenvolvimento.

Mudanças planejadas partem de branches temporárias criadas a partir de `dev` e retornam para `dev` por Pull Request.

### `staging`

Branch candidata a produção.

Recebe exclusivamente promoções vindas de `dev` e representa o estado que será validado no ambiente de staging.

### `main`

Branch de produção e releases.

Recebe exclusivamente promoções vindas de `staging` no fluxo normal e representa o estado aprovado para produção.

## Fluxo normal

```text
temporary branch
      ↓
     dev
      ↓
   staging
      ↓
     main
```

O objetivo é manter um caminho único de promoção. Mudanças não devem saltar etapas para acelerar uma entrega.

## Matriz de promoção

| Origem | Destino | Permitido |
| --- | --- | --- |
| branch temporária | `dev` | Sim |
| branch temporária | `staging` | Não |
| branch temporária | `main` | Não |
| `dev` | `staging` | Sim |
| `dev` | `main` | Não |
| `staging` | `main` | Sim |
| `main` | `dev` | Apenas sincronização de hotfix |
| `main` | `staging` | Apenas sincronização de hotfix |

## Promoções

Promoções entre branches permanentes acontecem por Pull Request.

Cada promoção deve representar uma unidade coerente de entrega. O projeto não depende de uma cadência de sprint para publicar mudanças e deve favorecer lotes pequenos quando houver evidência suficiente para promover.

O método de merge utilizado nas promoções é definido pela política de Pull Requests e merges.

## Hotfix

Um hotfix é uma exceção reservada para correções urgentes de produção.

Fluxo:

```text
main
 ↓
hotfix/<issue-number>-<slug>
 ↓
main
 ↓
staging
 ↓
dev
```

Regras:

- A branch de hotfix nasce de `main`.
- O hotfix entra em `main` por Pull Request.
- Após a correção em produção, a alteração deve ser sincronizada de volta para `staging` e `dev`.
- Hotfix não deve ser usado para contornar o fluxo normal de desenvolvimento.

## Branches protegidas

`dev`, `staging` e `main` são branches permanentes e devem receber mudanças por Pull Request.

A aplicação técnica de rulesets, checks obrigatórios e bloqueio de push direto será feita nas milestones específicas de CI/CD e proteção de repositório.

## Princípio operacional

A política busca permitir entregas pequenas e frequentes sem remover etapas de validação. A velocidade deve vir de automação, testes e observabilidade, não de bypass do fluxo de promoção.
