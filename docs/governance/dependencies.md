# Gerenciamento de dependências

O Dispatch utiliza Dependabot como baseline inicial para atualização automatizada de dependências.

A escolha privilegia integração nativa com GitHub, configuração versionada e baixo custo operacional. A política pode ser revista quando o projeto tiver necessidades que justifiquem outra ferramenta.

## Ecossistemas atuais

O baseline monitora apenas ecossistemas presentes no repositório:

- Composer;
- npm;
- GitHub Actions.

Docker será adicionado quando o repositório possuir Dockerfile ou imagens versionadas. Ecossistemas futuros devem ser incluídos apenas quando existirem manifests reais.

## Branch de destino

Version updates devem abrir Pull Requests contra `dev`.

Eles seguem o mesmo fluxo das demais mudanças:

```text
dependabot/* -> dev -> staging -> main
```

Branches do Dependabot são uma exceção explícita à convenção de nomes de branches temporárias, mas não são uma exceção aos checks do repositório.

Dependabot nunca constitui um caminho direto de promoção para `staging` ou `main`.

## Frequência

Os ecossistemas são verificados semanalmente às segundas-feiras, em horários próximos e separados para reduzir concentração de execuções.

A frequência poderá ser ajustada com base no volume real de atualizações.

## Conventional Commits

PRs e commits automatizados recebem prefixos compatíveis com a política do projeto:

```text
Composer/npm
build(deps): ...
build(deps-dev): ...

GitHub Actions
ci(actions): ...
```

Isso permite que os PRs automatizados atravessem os mesmos checks de commit e título usados por mudanças humanas.

## Major, minor e patch

### Patch

Atualizações patch podem seguir o fluxo normal quando os checks estiverem verdes e não houver regressão conhecida.

### Minor

Atualizações minor seguem o mesmo gate, mas devem ser revisadas quanto a mudanças de comportamento, deprecações e impactos de integração.

### Major

Atualizações major nunca devem ser integradas apenas porque foram abertas automaticamente.

Elas exigem revisão explícita de:

- breaking changes;
- guias de migração;
- compatibilidade com Laravel/PHP ou toolchain;
- impacto em contratos públicos;
- testes e documentação necessários.

Não há auto-merge irrestrito para nenhuma categoria na M00.

## Atualizações de segurança

Dependabot version updates pode ser direcionado para `dev`, mas Dependabot security updates tradicionais são associados à default branch do repositório.

Como a default branch do Dispatch é `main`, um PR automático de segurança direcionado diretamente a `main` não representa um caminho válido de integração e não deve ser usado para contornar `dev -> staging -> main`.

Tratamento esperado:

1. receber o alerta de segurança;
2. avaliar severidade, exploitability e exposição real;
3. abrir uma issue de correção;
4. para correção normal, atualizar a dependência em branch `fix/<issue>-<slug>` criada de `dev`;
5. quando houver risco urgente em produção, utilizar o fluxo formal de `hotfix/<issue>-<slug>` a partir de `main`;
6. executar os gates normais e sincronizar o hotfix conforme a política.

Esse comportamento preserva a política de promoção sem ignorar alertas de supply chain.

## Agrupamento

Atualizações não são agrupadas no baseline inicial.

PRs individuais facilitam:

- leitura de changelog;
- identificação de regressão;
- rollback;
- decisão separada sobre major/minor/patch.

Agrupamento pode ser introduzido posteriormente para conjuntos de baixo risco quando o volume real justificar.

## GitHub Actions

GitHub Actions faz parte da política de dependências.

Atualizações automáticas de actions devem:

- ser propostas contra `dev`;
- passar pelos checks de governança;
- preservar a política de pinning adotada pelo workflow correspondente;
- ser revisadas como mudança de supply chain, não apenas como manutenção cosmética.

## Auto-merge

Auto-merge geral de dependências não faz parte deste baseline.

Uma política futura pode automatizar categorias comprovadamente seguras somente depois que CI, security checks e observabilidade fornecerem evidência suficiente.

## Evolução

A configuração está em `.github/dependabot.yml`.

Sempre que um novo ecossistema for adicionado ao projeto, a mesma mudança deve avaliar se ele precisa entrar no gerenciamento automatizado de dependências.
