# language: es
# Estado: propuesta (issues #1 y #3). Casos en pruebas/casos/sesion-pendientes.json

Característica: Sesión de fichas pendientes del día
  Para repasar justo lo que estoy por olvidar
  Como estudiante
  Quiero que la app arme sola la sesión del día

  Antecedentes:
    Dado que hoy es "2026-10-20"

  Escenario: SES-001 Vence hoy entra, vence mañana no
    Dado una ficha "a" con próximo repaso "2026-10-20"
    Y una ficha "b" con próximo repaso "2026-10-21"
    Y un límite de 0 fichas nuevas
    Cuando la app arma la sesión de pendientes
    Entonces la sesión incluye los repasos "a"
    Y no incluye fichas nuevas

  Escenario: SES-002 Una ficha atrasada entra
    Dado una ficha "a" con próximo repaso "2026-10-01"
    Y un límite de 0 fichas nuevas
    Cuando la app arma la sesión de pendientes
    Entonces la sesión incluye los repasos "a"

  Escenario: SES-003 Las nuevas entran hasta el límite
    Dado 5 fichas nuevas
    Y un límite de 2 fichas nuevas
    Cuando la app arma la sesión de pendientes
    Entonces la sesión incluye 2 fichas nuevas

  Escenario: SES-004 El límite de nuevas no recorta los repasos
    Dado una ficha "a" con próximo repaso "2026-10-19"
    Y una ficha "b" con próximo repaso "2026-10-20"
    Y 2 fichas nuevas
    Y un límite de 1 ficha nueva
    Cuando la app arma la sesión de pendientes
    Entonces la sesión incluye los repasos "a" y "b"
    Y incluye 1 ficha nueva

  Escenario: SES-005 Menos nuevas que el límite
    Dado 1 ficha nueva
    Y un límite de 10 fichas nuevas
    Cuando la app arma la sesión de pendientes
    Entonces la sesión incluye 1 ficha nueva

  Escenario: SES-006 Nada pendiente
    Dado una ficha "a" con próximo repaso "2026-11-01"
    Y un límite de 10 fichas nuevas
    Cuando la app arma la sesión de pendientes
    Entonces la sesión está vacía
