# Fichas de estudio: análisis y recomendaciones

16 de octubre de 2026 · Sergio Monsalve

Cada recomendación tiene un issue abierto para discutirla. Lo que se decida allí se pasa a `specs/` por pull request.

## Resumen

La app ya tiene el núcleo correcto (pregunta, respuesta, autocalificación y repetición según desempeño), pero le falta definir el algoritmo, que es lo que la diferencia de una baraja aleatoria. La recomendación principal es usar FSRS, el algoritmo abierto que Anki adoptó en 2023, en lugar de inventar uno propio.

Las cinco recomendaciones de mayor impacto:

1. **Usar FSRS como motor de repetición**, con la librería abierta ts-fsrs. Resuelve de una vez varias preguntas abiertas: fichas nuevas, tiempo desde el último repaso, regresos después de pausas largas.
2. **Agregar una sesión de "fichas pendientes"** que la app arma sola cada día, además de las sesiones manuales por categoría. Sin ella, la repetición espaciada depende de que el estudiante se acuerde de qué repasar.
3. **Pedir la respuesta antes de mostrarla**: un paso para que el estudiante diga o escriba su respuesta antes de voltear la ficha. Es la diferencia entre recuperar un recuerdo y reconocerlo.
4. **Soportar imágenes y audio desde el inicio** en el modelo de datos, aunque la primera versión solo muestre imágenes. Para un niño, una imagen o una palabra hablada suele ser mejor pregunta que un texto.
5. **Guardar el historial completo de cada respuesta** (ya está en el modelo) y mostrar progreso por categoría. Es lo que motiva a seguir y lo que permite ajustar el algoritmo después.

## La app hoy

Los requerimientos actuales cubren la gestión de fichas y el flujo de sesión; lo que falta es cómo decide la app qué ficha mostrar y cuándo.

| Área | Qué está definido | Qué falta |
| --- | --- | --- |
| Fichas | Pregunta, respuesta, categoría, subcategoría, campos extra, tipo de calificación, tiempo | Imágenes, audio, ficha invertida (respuesta → pregunta) |
| Sesiones | Elegir categorías, número de fichas, orden aleatorio | Sesión automática de fichas pendientes, límite de fichas nuevas por día |
| Repetición | Las mejor respondidas vuelven menos | Algoritmo, intervalos, tratamiento de fichas nuevas y pausas |
| Calificación | Escala 1 a 5 o Pasa / No pasa | Cómo se traducen ambas escalas a un mismo cálculo |
| Registro | Resultado de cada sesión | Progreso por categoría, fichas difíciles, racha de estudio |
| Datos | Modelo local | Respaldo, exportar e importar, sincronizar entre dispositivos |

El punto más delicado es la convivencia de dos escalas de calificación. Si cada ficha puede usar una distinta, el algoritmo necesita una regla para compararlas; la sección de cambios propone una.

## Apps similares

Ninguna app combina lo que pide esta: repetición espaciada seria, uso sencillo para un niño y sesiones armadas por categoría. Anki tiene el mejor algoritmo pero es difícil de usar; Quizlet y Brainscape son fáciles pero su repetición es más simple.

| App | Qué la distingue | Algoritmo | Qué tomar para nuestra app |
| --- | --- | --- | --- |
| [Anki](https://docs.ankiweb.net/faqs/what-spaced-repetition-algorithm.md) | Muy configurable, comunidad grande, gratis en escritorio y Android | SM-2 o FSRS (desde la versión 23.10) | FSRS, el historial completo por ficha, las fichas pendientes del día |
| [Brainscape](https://en.wikipedia.org/wiki/Brainscape) | Contenido hecho por expertos, interfaz limpia, enfocada en exámenes | Repetición basada en confianza: el usuario se califica de 1 a 5 | Es casi igual a nuestra escala de 1 a 5; confirma que es entendible |
| [Quizlet](https://studycardsai.com/best-flashcard-apps-2026) | Biblioteca enorme de mazos compartidos, modos de juego (emparejar, test) | Repetición básica, sin algoritmo publicado | Modos de juego para variar, sobre todo con niños |
| [RemNote](https://memoryos.com/article/best-anki-alternatives-in-2026-apps-that-beat-anki-for-most-people) | Las fichas viven dentro de las notas | Similar a SM-2 | Crear fichas rápido desde un texto, en una versión posterior |
| [Mochi](https://memoryos.com/article/best-anki-alternatives-in-2026-apps-that-beat-anki-for-most-people) | Minimalista, Markdown, sincronización | Repetición espaciada | Formato de texto enriquecido en pregunta y respuesta |

El diseño de Brainscape es el más cercano a lo que Jorge describió: autocalificación de 1 a 5 y frecuencia según esa calificación. La diferencia que proponemos es usar un algoritmo con modelo de memoria (FSRS) debajo de esa misma experiencia.

La comparación de precios y algoritmos viene en parte de un sitio que vende una app competidora, así que sus juicios sobre las demás se tomaron con cautela.

## Mirada de expertos

Cinco perspectivas revisaron la especificación; coinciden en que el valor de la app está en el algoritmo y en el hábito diario, no en la cantidad de funciones.

### Ciencia cognitiva

La [revisión de Dunlosky y colegas (2013)](https://www.psychologicalscience.org/news/releases/which-study-strategies-make-the-grade.html) dio la utilidad más alta a la práctica de evaluación y a la práctica distribuida, justo lo que hace una app de fichas. Para aprovecharlo:

- Pedir que el estudiante responda (en voz alta o escribiendo) antes de ver la respuesta. Ver la respuesta y pensar "sí, la sabía" es reconocimiento, no recuperación.
- Mezclar fichas de varias categorías en una misma sesión, en lugar de estudiar un tema a la vez.
- Ofrecer la ficha invertida (de respuesta a pregunta) para vocabulario y definiciones.

### Algoritmo de repetición

Hay tres opciones probadas; FSRS es la recomendada.

| Opción | Cómo funciona | A favor | En contra |
| --- | --- | --- | --- |
| [Leitner](https://en.wikipedia.org/wiki/Leitner_system) | Cajas: acierto sube de caja, error vuelve a la primera; cada caja se repasa menos | Fácil de explicar a un niño y de implementar | Solo acierto o error, intervalos fijos |
| SM-2 | Intervalo que crece según una calificación de 0 a 5 y un factor de facilidad | Clásico, muchas implementaciones | Maneja mal los repasos atrasados |
| [FSRS](https://docs.ankiweb.net/faqs/what-spaced-repetition-algorithm.md) | Modelo de memoria con estabilidad, dificultad y probabilidad de recordar; se ajusta al historial del usuario | Misma retención con menos repasos, maneja bien pausas largas, se fija una retención deseada | Usa cuatro calificaciones, no cinco; necesita historial para ajustarse |

Para la versión TypeScript existe [ts-fsrs](https://cdn.jsdelivr.net/npm/ts-fsrs@5.4.1/README.md), con funciones para crear fichas, calcular el siguiente repaso y reconstruir el estado desde el historial.

### Producto y UX

- La pantalla de inicio debería decir cuántas fichas tocan hoy y tener un solo botón para empezar.
- Calificar con un toque, con botones grandes. Cinco botones caben en móvil, pero cuatro son más rápidos.
- Crear una ficha debe tomar segundos: pregunta, respuesta, guardar y siguiente, sin salir de la pantalla.

### Pedagogía infantil

El usuario inicial es el sobrino de Jorge, así que la app debe funcionar para un niño:

- Sesiones cortas por defecto y un final claro ("terminaste por hoy").
- Imágenes y audio en preguntas y respuestas; leer en voz alta la pregunta ayuda si el niño aún lee despacio.
- Recompensas por constancia (días seguidos estudiando), no por velocidad, para no premiar respuestas apuradas.
- Una vista para el adulto con el progreso, sin que el niño sienta que lo están evaluando.

### Ingeniería

- Guardar cada respuesta como evento (ya está en el modelo). Con el historial completo se puede cambiar de algoritmo y recalcular todo.
- Funcionar sin conexión, con datos locales; la sincronización puede venir después.
- Exportar e importar en un formato abierto (CSV o JSON) desde el inicio, para que las dos implementaciones del reto puedan intercambiar mazos y comparar resultados con los mismos datos.

## Funcionalidades recomendadas

La primera versión debe hacer bien una sola cosa: mostrar cada día las fichas que tocan y aprender de cada respuesta. Todo lo demás puede esperar.

| Fase | Funcionalidad | Por qué | Origen |
| --- | --- | --- | --- |
| MVP | Algoritmo FSRS con ts-fsrs | Resuelve fichas nuevas, intervalos y pausas | Algoritmo |
| MVP | Sesión de fichas pendientes del día | La repetición espaciada solo funciona si la app decide qué repasar | Anki |
| MVP | Sesión manual por categoría (ya especificada) | Estudiar un tema antes de un examen | Lista de Jorge |
| MVP | Responder antes de ver la respuesta | Recuperar en vez de reconocer | Ciencia cognitiva |
| MVP | Imágenes en pregunta y respuesta | Ya se mencionó en la reunión; clave para niños | Lista de Jorge, pedagogía |
| MVP | Exportar e importar en JSON o CSV | Comparar las dos implementaciones con los mismos mazos | Ingeniería |
| v2 | Límite de fichas nuevas por día | Evita que se acumulen repasos | Anki |
| v2 | Progreso por categoría y racha de días | Motiva y muestra avance | Pedagogía, producto |
| v2 | Audio y lectura en voz alta | Niños que aún leen despacio, idiomas | Pedagogía |
| v2 | Ficha invertida | Vocabulario y definiciones en ambos sentidos | Ciencia cognitiva |
| v2 | Vista del adulto | Seguimiento sin presionar al niño | Pedagogía |
| Después | Varios perfiles en un dispositivo | Hermanos o varios estudiantes | Producto |
| Después | Modos de juego (emparejar, test) | Variar la práctica | Quizlet |
| Después | Sincronización entre dispositivos | Estudiar en celular y tablet | Mochi, Anki |
| Después | Crear fichas desde un texto con IA | Ahorra tiempo al armar mazos | RemNote, apps con IA |
| Después | Ajuste de parámetros de FSRS con el historial | Mejora la precisión con meses de datos | FSRS |

## Cambios propuestos a la especificación

Estas propuestas responden varias de las preguntas abiertas del repo; ninguna está decidida hasta que Jorge y Sergio las acepten.

| Pregunta abierta | Propuesta |
| --- | --- |
| 9. Fórmula del peso de cada ficha | FSRS. Cada ficha guarda estabilidad, dificultad y fecha del próximo repaso; la app muestra primero las vencidas |
| 10. ¿Cuenta el tiempo desde la última vez? | Sí. FSRS calcula la probabilidad de recordar según los días transcurridos |
| 11. Fichas nunca respondidas | Entran como fichas nuevas, con un límite diario (por ejemplo 10) que el usuario puede cambiar |
| 12. Cómo comparar las dos escalas | Traducir a las cuatro calificaciones de FSRS: 1 = Otra vez, 2 = Difícil, 3 y 4 = Bien, 5 = Fácil; No pasa = Otra vez, Pasa = Bien |
| 13. ¿Repetir en la misma sesión si se responde mal? | Sí: una ficha calificada "Otra vez" vuelve al final de la sesión |
| 15. ¿Cuenta el tiempo de respuesta? | Se guarda, pero no entra al algoritmo en la primera versión; en fichas con tiempo, agotarlo cuenta como "Otra vez" |
| 6. Fotos | Sí, en pregunta y respuesta, desde el MVP |
| 2. Dónde viven los datos | En el dispositivo, sin conexión, con exportación e importación en JSON |

Cambios al modelo de datos que esto implica:

- **Ficha:** agregar `imagen_pregunta`, `imagen_respuesta`, `estado_fsrs` (estabilidad, dificultad, próximo repaso, número de repasos y de olvidos).
- **Respuesta:** agregar `calificacion_fsrs` (la traducción de la calificación original), sin perder la calificación original.
- **Sesión:** agregar `tipo` (`pendientes` o `manual`).

Requerimientos nuevos: sesión de pendientes del día, responder antes de ver la respuesta, límite de fichas nuevas y exportar e importar. También hay una pregunta nueva: ¿la escala de 1 a 5 se mantiene o se pasa a cuatro botones, como Anki?

## Propuestas de mejora

Las apps revisadas compiten en algoritmo o en contenido; estas ocho propuestas buscan que la nuestra se distinga por cómo acompaña al estudiante. Las de menor esfuerzo podrían entrar al MVP sin retrasarlo.

| Propuesta | Impacto | Esfuerzo | Fase sugerida |
| --- | --- | --- | --- |
| Estaciones de 5 minutos | Alto | Bajo | MVP |
| Pistas progresivas | Medio | Bajo | MVP |
| Panel de comparación del reto | Medio | Bajo | MVP (script del repo, no parte de la app) |
| Calibración de confianza | Alto | Medio | v2 |
| Fecha de examen por categoría | Alto | Medio | v2 |
| Mazos compartidos por enlace o QR | Medio | Medio | v2 |
| Fichas desde una foto del cuaderno | Alto | Alto | Después |
| Fichas que se confunden | Medio | Alto | Después |

Impacto y esfuerzo son estimaciones para discutir, no mediciones.

### 1. Estaciones de 5 minutos

Las apps de fichas suelen medir la sesión en número de fichas; un niño la vive en minutos. Propuesta: una sesión por defecto de 5 minutos, con un cierre claro al terminar y la opción de hacer otra estación. Es la misma lógica de estaciones cortas del método MAPA, y la cantidad de fichas se ajusta sola al ritmo del estudiante.

### 2. Pistas progresivas

Antes de mostrar la respuesta, el estudiante puede pedir una pista: la primera letra, una imagen o un campo adicional de la ficha (ya previsto en REQ-015). Usar pista limita la calificación máxima a "Bien". Reduce la frustración de quedarse en blanco sin regalar la respuesta.

### 3. Calibración de confianza

La autocalificación de 1 a 5 (como en Brainscape) depende de que el estudiante se juzgue bien. Propuesta: en algunas fichas, comparar la respuesta escrita con la correcta y mostrar, por categoría, si el estudiante se califica más alto o más bajo de lo que acierta. Enseña a conocerse como aprendiz, que es el núcleo de aprender a aprender.

### 4. Fecha de examen por categoría

El estudiante marca que tiene examen de una categoría en una fecha. La app adelanta los repasos de esas fichas para que todas pasen al menos una vez por la sesión de pendientes antes del examen. Responde a la necesidad real de un estudiante de colegio, que no estudia para "siempre" sino para el viernes.

### 5. Fichas desde una foto del cuaderno

El adulto toma una foto de una página del cuaderno o del libro y la IA propone fichas de pregunta y respuesta, que el adulto revisa antes de guardarlas. Ataca el mayor costo de cualquier app de fichas: crearlas. Es la propuesta más cara, porque depende de un servicio de IA y de una pantalla de revisión.

### 6. Mazos compartidos por enlace o código QR

Un adulto o un profesor arma un mazo y lo comparte con un enlace o un QR; otro dispositivo lo importa en un toque. Se construye sobre el formato común de exportación del issue #6 y permite que un salón use el mismo mazo.

### 7. Fichas que se confunden

Si dos fichas suelen fallarse juntas (por ejemplo, dos capitales parecidas o dos fórmulas), la app lo detecta en el historial y propone una ficha de contraste: "¿en qué se diferencian?". Requiere meses de historial, así que es para después.

### 8. Panel de comparación del reto

Para el experimento entre Jorge y Sergio: con el mismo mazo y el formato común, cada implementación exporta su historial y un script en el repo compara retención, número de repasos y tiempo por sesión. Convierte el reto en datos y sirve como caso para la tesis.

## Fuentes

- [Anki: qué algoritmo de repetición usa (SM-2 y FSRS)](https://docs.ankiweb.net/faqs/what-spaced-repetition-algorithm.md)
- [ts-fsrs, librería TypeScript de FSRS](https://cdn.jsdelivr.net/npm/ts-fsrs@5.4.1/README.md)
- [Brainscape (Wikipedia)](https://en.wikipedia.org/wiki/Brainscape)
- [Sistema Leitner (Wikipedia)](https://en.wikipedia.org/wiki/Leitner_system)
- [Association for Psychological Science: qué técnicas de estudio funcionan (Dunlosky et al., 2013)](https://www.psychologicalscience.org/news/releases/which-study-strategies-make-the-grade.html)
- [StudyCards AI: comparación de apps de fichas 2026](https://studycardsai.com/best-flashcard-apps-2026)
- [memoryOS: alternativas a Anki en 2026](https://memoryos.com/article/best-anki-alternatives-in-2026-apps-that-beat-anki-for-most-people)
