# Dispatch

O Dispatch é um projeto de portfólio voltado ao desenvolvimento de um sistema de logística com Laravel, criado para demonstrar práticas de engenharia de software backend em um cenário próximo de um produto real.

O projeto é desenvolvido de forma incremental. O objetivo não é apenas implementar funcionalidades logísticas, mas também tornar visível o processo de engenharia por meio de arquitetura, testes, documentação, observabilidade, segurança, CI/CD, versionamento e práticas de entrega.

## Status

O Dispatch está atualmente na fase de fundação do repositório e da infraestrutura de engenharia. O código da aplicação e as capacidades de domínio serão introduzidos nas próximas milestones.

## Direcionamento de engenharia

- Laravel como framework principal da aplicação.
- Monólito modular como estilo arquitetural inicial.
- Mudanças pequenas, revisáveis e entregues com frequência.
- Testes automatizados e quality gates introduzidos progressivamente.
- Governança explícita do repositório e decisões de engenharia documentadas.
- CI/CD projetado para permitir promoção rápida entre desenvolvimento, staging e produção.
- Observabilidade, segurança e documentação operacional adicionadas conforme o sistema evolui.
- Complexidade arquitetural introduzida apenas quando houver requisitos concretos que a justifiquem.

## Branches e ambientes

O repositório é organizado em torno de três branches permanentes:

- `dev`, branch de integração do desenvolvimento.
- `staging`, branch candidata para validação antes da produção.
- `main`, branch de produção e releases.

As regras detalhadas de promoção e merge são documentadas separadamente conforme a governança do repositório é estabelecida.

## Documentação

O índice da documentação está disponível em [`docs/README.md`](docs/README.md).

As políticas de contribuição e governança do repositório são introduzidas durante a milestone de fundação e serão referenciadas neste README conforme forem disponibilizadas.

## Licença

O Dispatch é distribuído sob a [GNU Affero General Public License v3.0](LICENSE).
