# Modelo de datos

Modelo mínimo que cubre los requerimientos de [`01-requerimientos.md`](01-requerimientos.md). Los nombres son orientativos; cada implementación puede adaptarlos.

## Entidades

### Categoría

| Campo | Tipo | Notas |
|---|---|---|
| id | identificador | |
| nombre | texto | Obligatorio |

### Subcategoría

| Campo | Tipo | Notas |
|---|---|---|
| id | identificador | |
| categoria_id | referencia a Categoría | Obligatorio |
| nombre | texto | Obligatorio |

### Ficha

| Campo | Tipo | Notas |
|---|---|---|
| id | identificador | |
| pregunta | texto | Obligatorio (REQ-010) |
| respuesta | texto | Obligatorio (REQ-011) |
| categoria_id | referencia a Categoría | Obligatorio (REQ-014) |
| subcategoria_id | referencia a Subcategoría | Opcional; debe pertenecer a la misma categoría (REQ-014) |
| campos_adicionales | lista de pares nombre / texto | Opcional (REQ-015) |
| tipo_calificacion | `escala_1_5` o `pasa_no_pasa` | REQ-016; ver pregunta abierta sobre dónde se define |
| con_tiempo | booleano | REQ-017 |
| tiempo_maximo_segundos | entero | Obligatorio si `con_tiempo` es verdadero (REQ-017) |

### Sesión

| Campo | Tipo | Notas |
|---|---|---|
| id | identificador | |
| inicio | fecha y hora | |
| fin | fecha y hora | Vacío mientras está en curso |
| categorias | lista de referencias a Categoría | REQ-021 |
| subcategorias | lista de referencias a Subcategoría | REQ-021 |
| fichas_solicitadas | entero | REQ-022 |

### Respuesta

Una fila por cada ficha mostrada en una sesión. Es la base del registro (REQ-030) y de la estadística que ajusta la frecuencia (REQ-024).

| Campo | Tipo | Notas |
|---|---|---|
| id | identificador | |
| sesion_id | referencia a Sesión | |
| ficha_id | referencia a Ficha | |
| mostrada_en | fecha y hora | |
| calificacion | entero 1 a 5, o pasa / no pasa | Autocalificación (REQ-026) |
| tiempo_respuesta_segundos | número | |
| tiempo_agotado | booleano | Solo aplica a fichas con tiempo |

## Relaciones

- Una Categoría tiene muchas Subcategorías y muchas Fichas.
- Una Subcategoría tiene muchas Fichas.
- Una Sesión tiene muchas Respuestas.
- Una Ficha tiene muchas Respuestas a lo largo del tiempo.
