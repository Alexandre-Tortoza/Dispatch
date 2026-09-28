# Convenção de nomes de branches

Branches temporárias devem indicar intenção e manter rastreabilidade com a issue que originou a mudança.

## Formato

```text
<type>/<issue-number>-<slug>
```

Exemplo:

```text
feat/42-create-order-endpoint
```

## Tipos permitidos

- `feat`, nova funcionalidade.
- `fix`, correção de defeito.
- `hotfix`, correção urgente originada de produção.
- `refactor`, alteração estrutural sem mudança intencional de comportamento.
- `perf`, melhoria de desempenho.
- `test`, criação ou manutenção de testes.
- `docs`, documentação.
- `build`, sistema de build, dependências ou empacotamento.
- `ci`, automações de integração e entrega.
- `chore`, manutenção que não se encaixa nas categorias anteriores.
- `revert`, reversão planejada de uma mudança.

Os nomes utilizam o mesmo vocabulário dos tipos adotados pela política de Conventional Commits sempre que houver equivalência.

## Número da issue

O número da issue é obrigatório para trabalho planejado.

Ele estabelece uma associação direta entre contexto, branch e Pull Request sem exigir que essa informação seja repetida em cada commit.

## Slug

O slug deve:

- usar apenas caracteres ASCII minúsculos e números;
- utilizar kebab-case;
- começar e terminar com caractere alfanumérico;
- descrever a intenção da mudança de forma curta.

## Regex

A especificação para branches temporárias é:

```regex
^(feat|fix|hotfix|refactor|perf|test|docs|build|ci|chore|revert)\/[1-9][0-9]*-[a-z0-9]+(?:-[a-z0-9]+)*$
```

Essa expressão será reutilizada posteriormente pela CI.

## Exemplos válidos

```text
feat/42-create-order-endpoint
fix/51-prevent-negative-stock
refactor/67-extract-allocation-strategy
ci/12-add-branch-policy
docs/4-define-branch-naming
```

## Exemplos inválidos

```text
feature/order
feature/42-create-order-endpoint
feat/order
feat/042-create-order-endpoint
Fix/51-prevent-negative-stock
docs/4_define_branch_naming
random-branch
```

## Branches permanentes

As branches permanentes não seguem a expressão de branches temporárias:

```text
dev
staging
main
```

## Exceções automatizadas

Branches criadas por ferramentas automatizadas podem possuir convenções próprias quando a ferramenta exigir.

Exceções devem ser adicionadas explicitamente à validação somente quando a automação correspondente for introduzida. O projeto não mantém exceções preventivas para ferramentas que ainda não utiliza.
