# Governança do repositório

Este diretório reúne as políticas que definem como mudanças são propostas, implementadas, revisadas e promovidas no Dispatch.

O objetivo das políticas é reduzir ambiguidade e permitir automação progressiva. Regras que podem ser verificadas mecanicamente devem, quando viável, ser convertidas em checks do repositório em milestones posteriores.

## Políticas

As políticas são introduzidas de forma incremental, seguindo suas dependências:

1. [Estratégia de branches e promoção](branch-strategy.md).
2. Convenção de nomes de branches.
3. Conventional Commits.
4. Pull Requests e merges.
5. Templates de issues e Pull Requests.

Enquanto uma política específica ainda estiver em implementação, o [`CONTRIBUTING.md`](../../CONTRIBUTING.md) funciona como contrato geral de contribuição.

## Princípios

- Mudanças planejadas partem de uma issue.
- Entregas devem ser pequenas e coerentes.
- Políticas devem ser objetivas e verificáveis sempre que possível.
- Automação deve remover trabalho mecânico, não criar burocracia adicional.
- Documentação deve refletir decisões e capacidades existentes.
- Complexidade de processo deve ser introduzida apenas quando resolver um problema concreto.
