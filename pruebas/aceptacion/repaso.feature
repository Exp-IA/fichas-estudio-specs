# language: es
# Estado: propuesta (issue #1). Casos en pruebas/casos/repaso.json

Característica: Programar el próximo repaso con FSRS
  Para que las fichas mejor respondidas vuelvan más tarde y las peores antes
  Como estudiante
  Quiero que cada calificación programe el próximo repaso de la ficha

  Antecedentes:
    Dado FSRS-6 con los pesos por defecto, retención 0.9, sin fuzz y solo días enteros

  Escenario: REP-001 Historial de intervalos
    Dado una ficha nueva que repaso por primera vez el "2026-10-17"
    Cuando la califico Bien seis veces, Otra vez dos veces y Bien cinco veces, cada vez el día en que vence
    Entonces los días programados son 3, 14, 57, 196, 586, 1559, 10, 1, 3, 5, 9, 15 y 25
    Y el último repaso queda para el "2033-08-04"

  Escenario: REP-002 Ficha nueva
    Dado una ficha nueva que repaso por primera vez el "2026-10-17"
    Cuando veo las cuatro calificaciones posibles
    Entonces Otra vez programa 1 día, Difícil 2, Bien 3 y Fácil 8
