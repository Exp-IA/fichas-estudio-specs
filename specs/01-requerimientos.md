# Requerimientos funcionales

Versión inicial, tomada de la lista de Jorge Johnson (16 oct 2026).

## Plataforma

| ID | Requerimiento |
|---|---|
| REQ-001 | La aplicación es móvil. |

## Gestión de fichas

| ID | Requerimiento |
|---|---|
| REQ-010 | Cada ficha tiene un texto de pregunta. |
| REQ-011 | Cada ficha tiene un texto de respuesta. |
| REQ-012 | El usuario puede crear, editar y eliminar categorías. |
| REQ-013 | El usuario puede crear, editar y eliminar subcategorías dentro de una categoría. |
| REQ-014 | Una ficha pertenece a exactamente una categoría y, opcionalmente, a una subcategoría de esa categoría. |
| REQ-015 | Una ficha puede tener campos de texto adicionales cuando se necesiten. |
| REQ-016 | El tipo de calificación es una escala de 1 a 5 o Pasa / No pasa. |
| REQ-017 | Una ficha puede responderse con o sin límite de tiempo. Si tiene límite, se define un tiempo máximo para contestar. |

## Operación

| ID | Requerimiento |
|---|---|
| REQ-020 | El estudio se organiza en sesiones. |
| REQ-021 | Una sesión agrupa una o varias categorías, subcategorías o ambas. |
| REQ-022 | Al iniciar una sesión, la aplicación pregunta cuántas fichas se desean. |
| REQ-023 | Las fichas aparecen en orden aleatorio. |
| REQ-024 | La frecuencia de aparición de cada ficha se ajusta según las calificaciones previas que el usuario se ha dado en esa ficha. |
| REQ-025 | Las fichas mejor respondidas tardan más en volver a aparecer; las peor respondidas aparecen con más frecuencia. |
| REQ-026 | El usuario se autocalifica después de ver la respuesta. |

## Registro

| ID | Requerimiento |
|---|---|
| REQ-030 | Se guarda el registro del resultado de cada sesión. |

## Mencionados en la reunión, por confirmar

Estos puntos salieron en la descripción de la aplicación de Jorge, pero no están en su lista. Ver [`PREGUNTAS-ABIERTAS.md`](../PREGUNTAS-ABIERTAS.md).

| ID | Requerimiento |
|---|---|
| REQ-040 | Una ficha puede incluir fotos. |
