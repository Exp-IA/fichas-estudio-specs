# language: es
# Estado: propuesta (issue #2). Casos en pruebas/casos/calificacion.json

Característica: Traducir la autocalificación a las calificaciones de FSRS
  Para que el algoritmo trate igual las dos escalas
  Como estudiante
  Quiero que mi calificación de 1 a 5 o de Pasa / No pasa se traduzca de forma consistente

  Esquema del escenario: Escala de 1 a 5
    Dado una ficha con tipo de calificación "escala_1_5"
    Cuando me califico con <calificacion> sin agotar el tiempo
    Entonces la calificación para FSRS es "<fsrs>"

    Ejemplos:
      | caso    | calificacion | fsrs     |
      | CAL-001 | 1            | otra_vez |
      | CAL-002 | 2            | dificil  |
      | CAL-003 | 3            | bien     |
      | CAL-004 | 4            | bien     |
      | CAL-005 | 5            | facil    |

  Esquema del escenario: Pasa / No pasa
    Dado una ficha con tipo de calificación "pasa_no_pasa"
    Cuando me califico con "<calificacion>" sin agotar el tiempo
    Entonces la calificación para FSRS es "<fsrs>"

    Ejemplos:
      | caso    | calificacion | fsrs     |
      | CAL-006 | no_pasa      | otra_vez |
      | CAL-007 | pasa         | bien     |

  Escenario: CAL-008 Tiempo agotado
    Dado una ficha con tiempo máximo para contestar
    Y se agota el tiempo antes de que responda
    Cuando me califico con 5
    Entonces la calificación para FSRS es "otra_vez"

  Escenario: CAL-009 Calificación fuera de rango
    Dado una ficha con tipo de calificación "escala_1_5"
    Cuando la app recibe una calificación de 6
    Entonces la app rechaza la calificación con el error "calificacion_invalida"

  Esquema del escenario: Calificación que no corresponde al tipo de la ficha
    Dado una ficha con tipo de calificación "<tipo>"
    Cuando la app recibe la calificación <calificacion>
    Entonces la app rechaza la calificación con el error "calificacion_invalida"

    Ejemplos:
      | caso    | tipo         | calificacion |
      | CAL-010 | escala_1_5   | "pasa"       |
      | CAL-011 | pasa_no_pasa | 3            |

  Escenario: CAL-012 La validación va antes que el tiempo agotado
    Dado una ficha con tipo de calificación "escala_1_5" y tiempo máximo para contestar
    Y se agota el tiempo antes de que responda
    Cuando la app recibe una calificación de 6
    Entonces la app rechaza la calificación con el error "calificacion_invalida"
