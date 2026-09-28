# Política de Pull Requests e merges

Pull Requests são a unidade de integração e promoção do Dispatch.

A política busca preservar rastreabilidade, manter branches permanentes sincronizáveis e permitir automação progressiva sem introduzir aprovações ou etapas sem função prática.

## Idioma

O título do Pull Request deve ser escrito em inglês e seguir a semântica de Conventional Commits.

A descrição, contexto, validação, comentários e documentação associados ao Pull Request devem ser escritos em PT-BR.

Exemplo:

```text
docs(governance): define pull request policy
```

## Destinos protegidos

Mudanças destinadas a `dev`, `staging` ou `main` devem entrar por Pull Request.

Push direto nessas branches deve ser bloqueado pelos rulesets quando a proteção técnica do repositório for implementada.

## Origem e destino

O fluxo normal permitido é:

```text
temporary branch -> dev
dev              -> staging
staging          -> main
```

Hotfixes seguem o fluxo excepcional definido em [`branch-strategy.md`](branch-strategy.md).

Pull Requests que tentem pular uma etapa de promoção são inválidos mesmo que todos os demais checks estejam aprovados.

## Draft

Pull Requests podem ser abertos como Draft durante o desenvolvimento.

Um Pull Request deve sair de Draft somente quando:

- a implementação necessária estiver concluída;
- os critérios de aceite aplicáveis tiverem sido atendidos;
- os testes relevantes tiverem sido executados;
- a documentação tiver sido atualizada quando necessário;
- não houver trabalho indispensável conhecido deixado incompleto.

## Vínculo com issues

Mudanças originadas de branches temporárias devem estar vinculadas à issue correspondente.

O vínculo primário é:

```text
issue -> branch -> Pull Request
```

Pull Requests de promoção entre branches permanentes representam uma entrega e não precisam fingir pertencer à issue de implementação mais recente. Quando houver uma issue específica de release ou promoção, ela deve ser vinculada normalmente.

## Título do Pull Request

Títulos seguem a semântica de Conventional Commits:

```text
<type>(<scope>)!: <description>
```

A descrição do título é escrita em inglês.

Exemplos:

```text
feat(order): add order creation
fix(inventory): prevent negative stock
docs(governance): define pull request policy
chore(release): promote staging to production
```

A política completa está em [`commits.md`](commits.md).

## Descrição do Pull Request

A descrição deve ser escrita em PT-BR e registrar apenas informações úteis para revisão:

- resumo;
- issue relacionada, quando aplicável;
- alterações realizadas;
- estratégia de validação;
- testes executados;
- impacto em documentação;
- breaking changes, quando aplicável.

A descrição não substitui o diff, os testes nem os checks automatizados.

## Checks

Checks configurados como obrigatórios devem estar aprovados antes do merge.

A lista de checks evolui junto com a infraestrutura de engenharia. A política não documenta como obrigatório um check que ainda não existe.

Regras mecânicas devem ser automatizadas sempre que possível, incluindo:

- origem e destino do Pull Request;
- nome da branch;
- título do Pull Request;
- commits de desenvolvimento;
- testes;
- linting;
- análise estática;
- quality gates.

## Reviews

Conversas de review devem estar resolvidas antes do merge.

Review humano deve concentrar-se em aspectos que exigem julgamento, como arquitetura, comportamento, domínio, legibilidade, segurança e compatibilidade.

Enquanto o repositório possuir um único mantenedor, não há requisito artificial de aprovação por uma segunda pessoa. Essa regra pode mudar quando a estrutura real de colaboração justificar.

## Método de merge

O método oficial do Dispatch é **Merge Commit**.

Ele deve ser utilizado em:

- branches temporárias para `dev`;
- `dev` para `staging`;
- `staging` para `main`;
- hotfix para `main`;
- sincronizações necessárias após hotfix.

Squash Merge e Rebase Merge não fazem parte do fluxo oficial.

A escolha por Merge Commit preserva a ancestralidade entre branches permanentes e evita reescrever o histórico durante promoções sucessivas.

## Remoção de branches temporárias

Após o merge de uma branch temporária em `dev`, a branch de origem deve ser removida.

Essa regra se aplica a branches como:

- `feat/*`;
- `fix/*`;
- `refactor/*`;
- `perf/*`;
- `test/*`;
- `docs/*`;
- `build/*`;
- `ci/*`;
- `chore/*`;
- `revert/*`.

Branches permanentes nunca são removidas por essa política:

```text
dev
staging
main
```

Branches de hotfix também devem ser removidas após a correção ter sido integrada e sincronizada conforme a estratégia de branches.

Sempre que a configuração do repositório permitir, a remoção automática da head branch após o merge deve ser habilitada para reduzir branches obsoletas e trabalho manual.

## Histórico de produção

A branch `main` representa o estado de produção.

Promoções de `staging` para `main` criam commits de merge que funcionam como marcos de entrega. O histórico de primeira linha pode ser inspecionado com:

```bash
git log --first-parent main
```

Isso preserva os commits de desenvolvimento e, ao mesmo tempo, permite visualizar a sequência de promoções.

## Breaking changes

Pull Requests com breaking changes devem:

- indicar `!` no título quando aplicável;
- descrever o impacto em PT-BR;
- documentar estratégia de migração;
- atualizar contratos e documentação afetados no mesmo conjunto de mudanças.

## Princípio operacional

Merge deve depender de evidência verificável, não de cerimônia.

Automação deve validar o que é mecânico. Review humano deve ser reservado ao que realmente exige análise.
