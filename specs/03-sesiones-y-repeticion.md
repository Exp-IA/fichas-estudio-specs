# Sesiones y repetición

## Flujo de una sesión

1. El usuario elige una o varias categorías, subcategorías o ambas (REQ-021).
2. La aplicación pregunta cuántas fichas quiere en la sesión (REQ-022).
3. La aplicación arma la selección de fichas a partir del conjunto elegido, de forma aleatoria y ponderada por el historial de cada ficha (REQ-023, REQ-024).
4. Para cada ficha:
   1. Se muestra la pregunta. Si la ficha tiene tiempo, corre el contador (REQ-017).
   2. El usuario pide ver la respuesta, o se agota el tiempo.
   3. Se muestra la respuesta.
   4. El usuario se autocalifica con el tipo de calificación que corresponda (REQ-016, REQ-026).
   5. Se guarda la Respuesta.
5. Al terminar, se guarda el resultado de la sesión y se muestra un resumen (REQ-030).

## Reglas de aparición

Lo que está acordado:

- El orden es aleatorio (REQ-023).
- Cada ficha tiene un peso calculado a partir de sus calificaciones anteriores (REQ-024).
- Una ficha bien respondida tarda más en volver a aparecer; una mal respondida aparece con más frecuencia (REQ-025).

Lo que falta definir está en [`PREGUNTAS-ABIERTAS.md`](../PREGUNTAS-ABIERTAS.md): la fórmula del peso, cómo se tratan las fichas nuevas, si el tiempo transcurrido desde la última vez cuenta, y cómo se comparan las dos escalas de calificación.

Mientras no se defina, cada implementación documenta en su propio repositorio el algoritmo que eligió, para poder compararlos.
