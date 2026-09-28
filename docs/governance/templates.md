# Templates de issues e Pull Requests

O Dispatch utiliza templates para garantir contexto mínimo sem transformar preenchimento manual em substituto para checks automatizados.

## Idioma

- Títulos de issues são escritos em inglês.
- Títulos de Pull Requests são escritos em inglês e seguem Conventional Commits.
- Descrições, contexto, critérios de aceite, validação e demais textos são escritos em PT-BR.
- Código, identificadores e termos exigidos por ferramentas permanecem em inglês.

## Issue Forms

Os formulários disponíveis são:

- `bug.yml`, para comportamentos incorretos ou inesperados.
- `feature.yml`, para novas capacidades orientadas por problema.
- `task.yml`, para trabalho técnico, operacional ou de manutenção.

Issues em branco ficam desabilitadas para manter um conjunto mínimo de informações.

Os formulários não aplicam labels automaticamente nesta etapa. Triagem e automação de labels pertencem a trabalho posterior.

## Pull Request

O template de Pull Request solicita:

- resumo;
- issue relacionada;
- alterações;
- validação;
- testes;
- impacto em documentação;
- breaking changes;
- checklist mínimo de conformidade.

O checklist deve conter apenas declarações que exigem confirmação do autor. Regras que podem ser verificadas mecanicamente devem migrar para CI ou rulesets quando essas automações forem implementadas.
