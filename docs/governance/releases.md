# Política de versionamento e releases

O Dispatch separa desenvolvimento, promoção, deployment e release para preservar rastreabilidade sem acoplar a publicação de uma versão formal a cada mudança implantada.

## Conceitos

- **Promoção** move um estado já integrado entre as branches permanentes `dev`, `staging` e `main`.
- **Deployment** disponibiliza um artefato em um ambiente.
- **Release** identifica formalmente uma versão pública do software por meio de uma tag SemVer e dos respectivos metadados de release.

Deployment e release são conceitos independentes. Uma mudança pode ser implantada sem criar imediatamente uma nova versão pública.

## Fluxo normal

```text
temporary branch
      ↓
     dev
      ↓
   staging
      ↓
     main
      ↓
vMAJOR.MINOR.PATCH
      ↓
 GitHub Release
```

As integrações e promoções utilizam **Merge Commit**, conforme a política de Pull Requests e merges.

Tags de release somente podem ser criadas depois que o commit correspondente estiver presente em `main`.

## Semantic Versioning

O projeto utiliza Semantic Versioning no formato:

```text
MAJOR.MINOR.PATCH
```

As tags Git utilizam o prefixo `v`:

```text
vMAJOR.MINOR.PATCH
```

Exemplos válidos:

```text
v0.1.0
v0.4.3
v1.0.0
v2.3.1
```

## Versões anteriores a 1.0.0

Enquanto o contrato público do Dispatch ainda estiver em evolução inicial, versões `0.x.y` são permitidas.

Nesse período:

- `MINOR` pode representar evolução funcional relevante;
- `PATCH` representa correções compatíveis dentro da linha atual;
- mudanças incompatíveis devem ser explicitamente documentadas nas release notes.

A promoção para `1.0.0` deve ocorrer quando os contratos públicos considerados estáveis estiverem definidos e suportados como tal.

## Seleção da versão

A versão deve refletir o impacto público acumulado desde a última release:

- **MAJOR**, mudança incompatível em contrato público estável;
- **MINOR**, funcionalidade nova compatível;
- **PATCH**, correção compatível.

Mudanças internas sem impacto público podem participar de uma release sem determinar isoladamente um incremento específico.

## Tags

Regras:

- tags de release seguem estritamente `vMAJOR.MINOR.PATCH`;
- uma tag de release deve apontar para um commit pertencente a `main`;
- tags de release não podem ser originadas diretamente de `dev`, `staging` ou branches temporárias;
- uma versão publicada não deve ser movida ou reutilizada;
- correções posteriores geram uma nova versão.

## Release notes e changelog

Toda release deve possuir notas suficientes para identificar:

- funcionalidades relevantes;
- correções relevantes;
- breaking changes;
- instruções de migração quando necessárias;
- PRs ou issues associadas quando houver valor de rastreabilidade.

A geração automatizada de changelog e release notes será introduzida posteriormente. A política definida aqui é a fonte normativa para essa automação.

## Hotfix

Hotfixes seguem o fluxo excepcional definido na estratégia de branches:

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

Após a integração do hotfix em `main`:

1. a correção deve ser sincronizada para `staging`;
2. a mesma correção deve ser sincronizada para `dev`;
3. uma nova release PATCH pode ser criada quando a correção precisar ser formalmente versionada.

O hotfix continua sujeito aos checks aplicáveis e não constitui um bypass permanente das políticas do repositório.

## Relação com Merge Commit

O Dispatch utiliza Merge Commit para integração e promoção.

O commit de merge em `main` representa o estado aprovado após a promoção de `staging`. Quando uma release for criada, a tag deve apontar para o commit de `main` que representa exatamente o estado publicado.

Squash Merge e Rebase Merge não fazem parte do fluxo oficial.

## Automação futura

A automação de release deve, no mínimo:

- validar o formato SemVer;
- confirmar que a referência pertence a `main`;
- impedir reutilização de versão;
- produzir release notes de forma determinística;
- utilizar permissões mínimas;
- manter deployment e release como etapas conceitualmente separadas.
