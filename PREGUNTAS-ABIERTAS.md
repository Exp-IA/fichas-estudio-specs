# Preguntas abiertas

Decisiones pendientes. Cuando se resuelva una, se pasa al documento de especificación que corresponda y se marca aquí como resuelta.

## Plataforma

1. ¿Móvil nativo (iOS, Android o ambos) o multiplataforma? En la reunión se habló de Mac, iPhone, iPad y web. ¿Entra la web en el alcance?
2. ¿Los datos viven solo en el dispositivo o se sincronizan entre dispositivos?
3. ¿Un solo usuario por dispositivo o varios perfiles (por ejemplo, varios estudiantes)?

## Fichas

4. ¿El tipo de calificación (1 a 5 o Pasa / No pasa) se define por ficha, por categoría o por sesión?
5. ¿El tiempo máximo se define por ficha, por categoría o por sesión?
6. ¿Las fichas incluyen fotos (REQ-040)? ¿En la pregunta, en la respuesta o en ambas?
7. Campos adicionales: ¿son libres por ficha o se definen como plantilla por categoría?
8. ¿Se pueden importar y exportar fichas (por ejemplo, CSV)?

## Sesiones y repetición

9. ¿Qué fórmula da el peso de cada ficha? ¿Se usa un algoritmo conocido (Leitner, SM-2) o uno propio?
10. ¿Cuenta el tiempo transcurrido desde la última vez que apareció la ficha, o solo el historial de calificaciones?
11. ¿Cómo se tratan las fichas que nunca se han respondido?
12. ¿Cómo se traduce Pasa / No pasa a la misma escala de la calificación de 1 a 5 para el cálculo?
13. ¿Una ficha puede repetirse dentro de la misma sesión si se responde mal?
14. ¿Qué pasa si se piden más fichas de las que hay en las categorías elegidas?
15. ¿Se toma en cuenta el tiempo de respuesta en la estadística?

## Registro

16. ¿Qué datos se muestran en el resumen de sesión y en el historial (aciertos, promedio, tiempo, fichas más difíciles)?

## Eliminación

17. ¿Qué pasa al eliminar una categoría que tiene fichas (REQ-012)? Las opciones son borrar en cascada (fichas e historial), bloquear hasta que se muevan o borren las fichas, o borrar en cascada después de una confirmación. Propuesta: bloquear, para que un niño no pierda su progreso con un toque. Esto implica que la interfaz ofrezca mover fichas a otra categoría. Al eliminar una subcategoría, ¿sus fichas quedan en la categoría o se borran?
