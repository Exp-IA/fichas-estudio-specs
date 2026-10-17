# Fichas de estudio: especificaciones

Repositorio de especificaciones de una aplicación móvil de fichas de estudio (flashcards) con repetición espaciada.

Aquí solo hay especificaciones, no código. La idea es que cada persona implemente su propia versión de la aplicación, con su stack y sus herramientas de IA, a partir de estos mismos documentos, y luego comparar resultados.

## Origen

Reto de desarrollo cruzado acordado entre Jorge Johnson y Sergio Monsalve el 16 de octubre de 2026. La aplicación de referencia es la que Jorge construyó para su sobrino.

## Estructura

| Archivo | Contenido |
|---|---|
| [`specs/01-requerimientos.md`](specs/01-requerimientos.md) | Requerimientos funcionales con identificador |
| [`specs/02-modelo-de-datos.md`](specs/02-modelo-de-datos.md) | Entidades y relaciones |
| [`specs/03-sesiones-y-repeticion.md`](specs/03-sesiones-y-repeticion.md) | Flujo de una sesión y reglas de aparición de fichas |
| [`specs/04-interfaz.md`](specs/04-interfaz.md) | Especificación de interfaz, separada de la lógica |
| [`PREGUNTAS-ABIERTAS.md`](PREGUNTAS-ABIERTAS.md) | Decisiones pendientes |

La lógica (requerimientos, datos, sesiones) y la interfaz (diseño, colores, marca) van en documentos distintos, para poder evaluar implementaciones de cada parte por separado.

## Cómo contribuir

1. Cada cambio a una especificación va en un pull request con una descripción corta de qué cambia y por qué.
2. Los requerimientos se identifican como `REQ-XXX`. No se reutilizan identificadores; un requerimiento que se elimina se marca como retirado.
3. Lo que no esté decidido va a `PREGUNTAS-ABIERTAS.md`, no se asume en los documentos de especificación.

## Implementaciones

| Autor | Stack | Repositorio |
|---|---|---|
| Jorge Johnson | Por definir | Por definir |
| Sergio Monsalve | Por definir | Por definir |
