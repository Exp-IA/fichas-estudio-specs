# Pruebas compartidas

Casos de prueba que las dos implementaciones deben pasar. Son la forma de hacer TDD a nivel de especificación: primero se escribe el caso aquí, después cada uno lo hace pasar en su app.

## Estructura

| Carpeta | Contenido |
|---|---|
| `aceptacion/` | Criterios de aceptación en Gherkin (Dado / Cuando / Entonces), legibles para personas |
| `casos/` | Los mismos comportamientos como datos: entradas y salidas esperadas en JSON, para correr en pruebas automáticas |

Cada escenario de `aceptacion/` tiene el mismo identificador que su caso en `casos/` (por ejemplo `CAL-001`).

## Formato de un archivo de casos

```json
{
  "id": "CAL",
  "titulo": "Traducción de calificaciones a FSRS",
  "estado": "propuesta",
  "issue": 2,
  "requerimientos": ["REQ-016"],
  "casos": [
    {
      "id": "CAL-001",
      "descripcion": "Escala 1 a 5: un 1 es Otra vez",
      "entrada": { "tipo_calificacion": "escala_1_5", "calificacion": 1 },
      "esperado": { "calificacion_fsrs": "otra_vez" }
    }
  ]
}
```

- `estado`: `propuesta` mientras el issue está abierto; `aceptado` cuando se cierra. Las implementaciones pueden marcar como pendientes las pruebas de casos en `propuesta`.
- `requerimientos`: deben existir en `specs/01-requerimientos.md`.
- `id` de cada caso: único en todo el repo.

## Cómo usarlos en una implementación

1. Copiar o enlazar `pruebas/casos/` en el repo de la implementación (submódulo de git, o descargar en CI).
2. Escribir una prueba que recorra cada archivo, ejecute la función que corresponde con `entrada` y compare con `esperado`.
3. Si un caso parece incorrecto, abrir un issue con la plantilla "Error en la especificación" en lugar de cambiar la prueba localmente.

## Validación

`python3 scripts/validar.py` revisa que los JSON sean válidos, que los identificadores no se repitan y que los requerimientos citados existan. Corre en cada pull request.
