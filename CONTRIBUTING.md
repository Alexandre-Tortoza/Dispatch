# Contribuindo com o Dispatch

O Dispatch utiliza um fluxo orientado a issues para que toda mudança planejada tenha contexto, critérios de aceite e rastreabilidade.

Este documento descreve o fluxo geral de contribuição. As políticas específicas do repositório ficam em [`docs/governance/`](docs/governance/README.md).

## Antes de iniciar

1. Selecione uma issue existente ou crie uma issue para a mudança planejada.
2. Confirme que a issue possui contexto, objetivo, requisitos e critérios de aceite suficientes para execução.
3. Verifique dependências e evite iniciar trabalho bloqueado por uma decisão ou entrega ainda pendente.
4. Mantenha a mudança limitada ao escopo da issue. Trabalho não relacionado deve ser separado.

## Fluxo de contribuição

O fluxo padrão é:

```text
issue
  ↓
branch temporária
  ↓
commits
  ↓
Pull Request
  ↓
checks automatizados
  ↓
review
  ↓
merge
  ↓
promoção
```

Mudanças de desenvolvimento partem de `dev` e retornam para `dev` por Pull Request. Promoções entre branches permanentes seguem a política de branches do projeto.

Hotfixes de produção são exceções ao fluxo normal e devem seguir a política específica de promoção e sincronização.

## Branches

Toda mudança planejada deve utilizar uma branch temporária associada a uma issue.

A convenção oficial de nomes e os caminhos permitidos entre branches são definidos nas políticas de governança. Não crie uma nova convenção local para um caso específico sem atualizar a política correspondente.

## Commits

Os commits devem utilizar Conventional Commits.

Os tipos técnicos permanecem em inglês, por exemplo `feat`, `fix`, `docs`, `refactor` e `ci`. A descrição textual do commit e seu corpo devem ser escritos em PT-BR.

Exemplo:

```text
feat(order): adicionar criação de pedidos

Implementa o fluxo inicial de criação e valida os dados obrigatórios.
```

A política completa de tipos, scopes, breaking changes e validação é mantida na documentação de governança.

## Pull Requests

Toda alteração em branch permanente deve entrar por Pull Request.

Use Draft enquanto a implementação ainda não estiver pronta para avaliação. Ao marcar um Pull Request como pronto para review, o autor declara que:

- o escopo da issue foi atendido;
- os critérios de aceite aplicáveis foram verificados;
- os testes relevantes foram executados;
- a documentação foi atualizada quando necessário;
- não há trabalho conhecido e indispensável deixado incompleto.

A descrição do Pull Request deve explicar contexto e validação, mas não substitui análise do diff, testes ou checks automatizados.

## Reviews e checks

Regras mecânicas devem ser verificadas por automação sempre que possível.

Reviews humanas devem concentrar-se em decisões que exigem julgamento, como comportamento, arquitetura, legibilidade, segurança, compatibilidade e aderência ao domínio.

O projeto não deve introduzir aprovação obrigatória sem utilidade prática apenas para satisfazer processo.

## Documentação

Mudanças que alteram comportamento, contratos, arquitetura, operação ou políticas devem atualizar a documentação correspondente no mesmo Pull Request quando aplicável.

Evite documentar funcionalidades ou decisões que ainda não existem.

## Bugs e propostas de mudança

Utilize os templates oficiais de issue assim que estiverem disponíveis. Até lá, uma issue deve conter informações suficientes para reproduzir o problema ou entender a mudança proposta.

## Referências

- [Visão geral do projeto](README.md)
- [Índice de documentação](docs/README.md)
- [Governança do repositório](docs/governance/README.md)
