# Generador de plan de estudio y fichas

**Estado: borrador** (issue #24). Nada de este documento es un requerimiento todavía. Cuando se acepte una parte, se le asigna su `REQ-XXX` en [`01-requerimientos.md`](01-requerimientos.md) y se agregan sus casos de prueba.

## Propósito

Crear fichas es el mayor costo de cualquier app de fichas. El generador parte de un tema ("las fracciones de cuarto grado", "el sistema solar") y propone un plan de estudio y un mazo de fichas que un adulto revisa antes de usar.

## Relación con la app de estudio

Son **dos sistemas separados**, unidos por el formato común de mazo (issue #6):

- El generador produce un archivo de mazo.
- La app de estudio lo importa como importaría cualquier otro mazo.
- La app no sabe que el mazo vino de un generador, y el generador no sabe nada de las sesiones ni del historial del estudiante.

Así cada implementación del reto puede usar el mismo mazo generado, y el generador se puede construir, cambiar o descartar sin tocar la app.

## Flujo propuesto

1. **Tema y fuentes.** El adulto escribe el tema y el nivel escolar, y aporta las fuentes: libros o documentos propios, o fuentes de acceso abierto. El generador no busca ni descarga libros con derechos de autor por su cuenta (ver Riesgos).
2. **Extracción de conceptos.** De cada fuente se extraen los conceptos y la parte del texto que los respalda.
3. **Cruce de conceptos.** Se unen los conceptos repetidos entre fuentes y se marcan las relaciones: uno es requisito de otro, uno es ejemplo de otro, se suelen confundir.
4. **Plan de estudio.** Los conceptos se ordenan respetando los requisitos y se agrupan en unidades que se convierten en categorías y subcategorías del mazo.
5. **Fichas.** Para cada concepto se proponen una o más fichas de pregunta y respuesta. **Cada ficha cita su fuente**: documento y página o sección.
6. **Revisión humana.** El adulto revisa, corrige, descarta o aprueba cada ficha. Solo las aprobadas entran al mazo.
7. **Exportar.** Se genera el archivo en el formato común de mazo.

## Formato de salida

Se propone ampliar el formato del issue #6 con campos opcionales, que la app de estudio puede ignorar:

| Elemento | Contenido | Para qué |
|---|---|---|
| Fuentes | Título, autor, tipo (propia, abierta), licencia, enlace si lo hay | Citar y respetar derechos |
| Conceptos | Nombre, descripción corta, fuentes que lo respaldan | Agrupar fichas por idea, no solo por tema |
| Relaciones | Concepto A, concepto B, tipo (requisito, ejemplo, se confunde con) | Plan de estudio; también sirve a la propuesta #18 |
| Plan | Unidades en orden, con sus conceptos | Sugerir qué estudiar primero |
| Fichas | Lo de siempre, más el concepto y la cita (fuente, página o sección) | Que el adulto pueda verificar cada ficha |

El esquema concreto se decide en el issue #6.

## Riesgos

- **Derechos de autor.** Solo se procesan fuentes que el usuario aporta, como un libro que ya tiene o sus propios apuntes, o fuentes de licencia abierta. El generador no reproduce páginas completas: cada ficha cita su fuente y usa un fragmento corto. Las fuentes del usuario no se comparten con otros.
- **Calidad.** Un modelo de IA puede inventar datos o equivocarse de nivel. Por eso cada ficha cita su fuente, la revisión humana es obligatoria y nada entra al mazo sin aprobación.
- **Costo.** Procesar libros con un servicio de IA tiene un costo por uso. Antes de generar hay que mostrar una estimación, y debe haber un límite por mazo.
- **Privacidad del menor.** El generador lo usa el adulto, no el niño. No necesita ni recibe datos del estudiante: ni nombre, ni historial, ni respuestas. Si las fuentes se envían a un servicio externo, el adulto lo autoriza explícitamente antes, como pide la regla de privacidad de [`AGENTS.md`](../AGENTS.md).

## Fuera de este borrador

- Generar fichas a partir de una foto del cuaderno (propuesta #17), que podría reutilizar los pasos 5 a 7.
- Imágenes en las fichas (issue #5).
- Ajustar el mazo según el desempeño del estudiante, que necesitaría datos del niño.

## Preguntas abiertas

1. ¿Quién usa el generador: solo el adulto, o también un profesor para un salón?
2. ¿Corre en el dispositivo, en un servicio propio o en un servicio de IA de terceros? Cada opción cambia el costo y la privacidad.
3. ¿Qué tipos de fuente se aceptan al inicio: PDF, fotos de páginas, texto pegado, enlaces?
4. ¿Cuántas fichas por concepto, y de qué tipos (definición, ejemplo, aplicación)?
5. ¿El plan de estudio se usa en la app (por ejemplo, para desbloquear unidades) o es solo una sugerencia para el adulto?
6. ¿Cómo se mide la calidad de un mazo generado antes de dárselo a un niño?
