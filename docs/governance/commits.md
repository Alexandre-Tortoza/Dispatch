# Política de Conventional Commits

O Dispatch utiliza Conventional Commits para tornar o histórico legível, classificável e utilizável por automações futuras de changelog e release.

## Formato

```text
<type>(<scope>)!: <description>

<body>

<footer>
```

O `scope` e o indicador `!` são opcionais.

## Idioma

A primeira linha do commit é escrita em inglês.

O corpo e os footers descritivos do projeto são escritos em PT-BR, exceto palavras-chave exigidas por especificações ou ferramentas.

Exemplo:

```text
feat(order): add order creation

Implementa o fluxo inicial de criação e valida os dados obrigatórios.
```

## Tipos permitidos

- `feat`, nova funcionalidade.
- `fix`, correção de defeito.
- `refactor`, alteração estrutural sem mudança intencional de comportamento.
- `perf`, melhoria de desempenho.
- `test`, criação ou manutenção de testes.
- `docs`, documentação.
- `build`, sistema de build, dependências ou empacotamento.
- `ci`, automações de integração e entrega.
- `chore`, manutenção geral.
- `revert`, reversão de uma mudança.

`hotfix` é um tipo de branch, não um tipo adicional de commit. Uma correção urgente utiliza `fix`.

## Description

A `description` deve:

- estar em inglês;
- usar letras minúsculas no início, exceto nomes próprios ou identificadores;
- ser curta e objetiva;
- descrever a mudança em forma imperativa;
- não terminar com ponto;
- manter a primeira linha com no máximo 100 caracteres.

Exemplos:

```text
feat(order): add order creation
fix(inventory): prevent negative stock
docs(governance): document branch strategy
ci(github): validate pull request title
```

## Scope

O `scope` é opcional.

Quando utilizado, deve:

- representar uma área estável e reconhecível da mudança;
- usar lowercase;
- usar kebab-case quando possuir mais de uma palavra.

O projeto não mantém uma lista fechada de scopes antes que os limites reais da aplicação existam. Scopes de domínio devem surgir junto com módulos concretos.

## Corpo

O corpo é opcional para mudanças triviais e recomendado quando a primeira linha não contém contexto suficiente.

Quando presente, deve ser escrito em PT-BR e explicar motivação, decisão ou impacto relevante sem repetir o diff.

## Breaking changes

Breaking changes podem ser indicadas com `!`:

```text
feat(api)!: change shipment response contract
```

Quando houver breaking change, o commit deve explicar o impacto e a migração necessária em footer:

```text
BREAKING CHANGE: altera o contrato de resposta de remessas e exige atualização dos consumidores.
```

A palavra-chave `BREAKING CHANGE` permanece em inglês por fazer parte da especificação Conventional Commits.

## Referência a issues

O número da issue não é obrigatório em cada commit.

A rastreabilidade primária é:

```text
issue -> branch -> Pull Request
```

O número da issue já faz parte do nome da branch e deve estar associado ao Pull Request. Evitar repetir a mesma informação em todos os commits reduz ruído no histórico.

## Merge commits

Merge commits gerados pelo GitHub são commits estruturais e são exceção à sintaxe Conventional Commits.

A intenção semântica da integração deve estar representada no título do Pull Request, que segue a mesma estrutura de tipo e scope usada nos commits de desenvolvimento.

Validações futuras com commitlint devem ignorar merge commits gerados pela plataforma sem desabilitar a validação dos commits de desenvolvimento.

## Compatibilidade com automação

A política deve ser implementável posteriormente com commitlint ou ferramenta equivalente.

Configuração conceitual:

- validar tipos permitidos;
- limitar o header a 100 caracteres;
- validar casing do tipo e scope;
- validar a sintaxe Conventional Commits;
- ignorar merge commits estruturais;
- validar separadamente títulos de Pull Request.
