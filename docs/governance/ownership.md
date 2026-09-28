# Política de ownership

O Dispatch declara ownership explícito para tornar responsabilidades visíveis e preparar o repositório para colaboração futura sem introduzir aprovações artificiais.

## Estado atual

O repositório possui um mantenedor principal:

- `@Alexandre-Tortoza`

O arquivo `.github/CODEOWNERS` define esse mantenedor como owner padrão e reforça ownership explícito para áreas de governança, automação e infraestrutura.

## Finalidade

CODEOWNERS é usado para:

- tornar responsabilidade técnica explícita;
- sugerir reviewers adequados quando houver múltiplos mantenedores;
- identificar áreas sensíveis;
- facilitar evolução futura do modelo de revisão.

CODEOWNERS não substitui a política de Pull Requests, checks automatizados ou rulesets.

## Mantenedor único

Enquanto houver apenas um mantenedor:

- não deve existir required review que exija uma segunda pessoa inexistente;
- CODEOWNERS pode sugerir responsabilidade sem bloquear merge por autoaprovação impossível;
- checks mecânicos continuam sendo a principal forma de enforcement verificável.

## Áreas sensíveis

Ownership explícito é mantido para:

- `.github/`, incluindo workflows, templates, CODEOWNERS e configuração de dependências;
- `docs/governance/`;
- documentação de arquitetura;
- infraestrutura e containers quando esses diretórios existirem.

Novos caminhos sensíveis devem ser adicionados somente quando houver responsabilidade concreta a representar.

## Evolução para múltiplos mantenedores

Quando novos mantenedores forem adicionados:

1. ownership deve ser distribuído por responsabilidade real, não apenas por diretório;
2. times ou usuários devem possuir acesso compatível com as áreas atribuídas;
3. required reviews de CODEOWNERS só devem ser habilitados quando houver reviewers suficientes para não bloquear o fluxo;
4. alterações de ownership devem ser revisadas junto com rulesets e documentação de contribuição.

## Princípio

Ownership existe para esclarecer responsabilidade e direcionar revisão. Ele não deve criar cerimônia sem benefício operacional.
