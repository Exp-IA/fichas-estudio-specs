# Contexto para herramientas de IA

Este archivo da a Claude, Codex, Copilot u otro asistente el mismo contexto sobre el proyecto. Los dos participantes del reto desarrollan con IA, así que partir del mismo contexto hace la comparación más justa.

## Qué es este repo

Especificaciones de una aplicación móvil de fichas de estudio con repetición espaciada. Aquí no hay código de la aplicación. Cada participante (Jorge Johnson y Sergio Monsalve) implementa su versión en un repo aparte, a partir de estos documentos, y después se comparan.

El primer usuario es un niño en edad escolar.

## Dónde está cada cosa

| Ruta | Qué contiene |
|---|---|
| `specs/01-requerimientos.md` | Requerimientos con identificador `REQ-XXX`. Es la fuente de verdad |
| `specs/02-modelo-de-datos.md` | Entidades y campos |
| `specs/03-sesiones-y-repeticion.md` | Flujo de sesión y reglas de aparición |
| `specs/04-interfaz.md` | Pantallas, separadas de la lógica |
| `PREGUNTAS-ABIERTAS.md` | Lo que no está decidido |
| `pruebas/aceptacion/*.feature` | Criterios de aceptación en Gherkin, en español |
| `pruebas/casos/*.json` | Los mismos criterios como entradas y salidas esperadas |
| `docs/decisiones/` | Por qué se decidió cada cosa |
| `docs/analisis-y-recomendaciones.md` | Análisis de apps similares y propuestas |

## Reglas

- Todo en español: documentos, identificadores de casos, mensajes de commit.
- No inventar requerimientos. Si algo no está en `specs/`, va como pregunta a `PREGUNTAS-ABIERTAS.md` o como issue, no como hecho.
- No reutilizar un `REQ-XXX`. Un requerimiento retirado se marca como retirado, no se borra.
- Un comportamiento nuevo trae su caso de prueba: escenario en `pruebas/aceptacion/` y caso con el mismo identificador en `pruebas/casos/`.
- Un caso en estado `propuesta` puede cambiar hasta que se cierre su issue. No construir sobre él como si fuera definitivo.
- Los cambios entran por pull request, con la plantilla completa, y el otro participante los revisa.
- Antes de proponer un cambio, correr `python3 scripts/validar.py`.

## Privacidad

El usuario es menor de edad. Cualquier propuesta debe pedir el mínimo de datos personales, guardarlos en el dispositivo por defecto y no enviar datos a terceros sin que un adulto lo autorice. No incluir nombres reales ni datos de menores en ejemplos, casos de prueba o mazos de ejemplo.

## Para trabajar en una implementación

Si este repo se usa como submódulo o referencia desde un repo de código:

- Las pruebas de la implementación deben recorrer `pruebas/casos/*.json` y comparar con `esperado`.
- Si un caso parece incorrecto, abrir un issue aquí con la plantilla "Error en la especificación"; no cambiar el caso localmente.
- Indicar en el README de la implementación la versión de `CHANGELOG.md` contra la que está construida.
