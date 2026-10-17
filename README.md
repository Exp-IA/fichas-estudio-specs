# Fichas de estudio: especificaciones

Repositorio de especificaciones de una aplicación móvil de fichas de estudio (flashcards) con repetición espaciada.

Aquí solo hay especificaciones, no código. La idea es que cada persona implemente su propia versión de la aplicación, con su stack y sus herramientas de IA, a partir de estos mismos documentos, y luego comparar resultados.

## Origen

Reto de desarrollo cruzado acordado entre Jorge Johnson y Sergio Monsalve el 16 de octubre de 2026. La aplicación de referencia es la que Jorge construyó para un niño en edad escolar.

## Estructura

| Archivo | Contenido |
|---|---|
| [`specs/01-requerimientos.md`](specs/01-requerimientos.md) | Requerimientos funcionales con identificador |
| [`specs/02-modelo-de-datos.md`](specs/02-modelo-de-datos.md) | Entidades y relaciones |
| [`specs/03-sesiones-y-repeticion.md`](specs/03-sesiones-y-repeticion.md) | Flujo de una sesión y reglas de aparición de fichas |
| [`specs/04-interfaz.md`](specs/04-interfaz.md) | Especificación de interfaz, separada de la lógica |
| [`PREGUNTAS-ABIERTAS.md`](PREGUNTAS-ABIERTAS.md) | Decisiones pendientes |
| [`docs/analisis-y-recomendaciones.md`](docs/analisis-y-recomendaciones.md) | Análisis de apps similares y recomendaciones |
| [`pruebas/`](pruebas/) | Casos de prueba compartidos que las dos implementaciones deben pasar |
| [`docs/decisiones/`](docs/decisiones/) | Registro de decisiones tomadas |
| [`CHANGELOG.md`](CHANGELOG.md) | Versiones de la especificación |
| [`AGENTS.md`](AGENTS.md) | Contexto del proyecto para herramientas de IA (`CLAUDE.md` lo importa) |

La lógica (requerimientos, datos, sesiones) y la interfaz (diseño, colores, marca) van en documentos distintos, para poder evaluar implementaciones de cada parte por separado.

## Cómo contribuir

1. Cada cambio a una especificación va en un pull request con una descripción corta de qué cambia y por qué.
2. Los requerimientos se identifican como `REQ-XXX`. No se reutilizan identificadores; un requerimiento que se elimina se marca como retirado.
3. Lo que no esté decidido va a `PREGUNTAS-ABIERTAS.md`, no se asume en los documentos de especificación.
4. Cada decisión pendiente y cada funcionalidad propuesta tiene un issue. Se discute en el issue, se asigna a quien la va a resolver y se cierra con el pull request que actualiza `specs/`.
5. Un comportamiento nuevo trae su caso de prueba en `pruebas/` antes de que alguien lo implemente.
6. Nada entra a `main` sin pull request revisado por el otro participante. La validación (`python3 scripts/validar.py`) corre sola en cada pull request.

### Etiquetas

| Etiqueta | Uso |
|---|---|
| `decisión` | Pregunta abierta que hay que resolver entre los dos |
| `funcionalidad` | Funcionalidad propuesta para la especificación |
| `propuesta` | Mejora para diferenciar la app, surgida del análisis de competencia |
| `fase: MVP` / `fase: v2` / `fase: después` | Prioridad propuesta en el análisis |

## Implementaciones

| Autor | Stack | Repositorio |
|---|---|---|
| Jorge Johnson | Por definir | Por definir |
| Sergio Monsalve | Por definir | Por definir |
