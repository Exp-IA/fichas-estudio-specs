# language: es
# Estado: propuesta. Casos en pruebas/casos/seleccion-sesion.json

Característica: Elegir las fichas de una sesión manual
  Para estudiar lo que necesito
  Como estudiante
  Quiero elegir categorías o subcategorías y cuántas fichas, y que salgan en orden aleatorio

  Escenario: SEL-001 Por categoría
    Dado fichas en "mate" y en "ciencias"
    Cuando elijo la categoría "mate" y pido 10 fichas
    Entonces entran las 2 fichas de "mate"

  Escenario: SEL-002 Categorías y subcategorías juntas
    Dado fichas en "mate" y en "ciencias", con subcategorías
    Cuando elijo la categoría "mate" y las subcategorías "planetas" y "fracciones"
    Entonces entran las fichas de "mate" y la de "planetas", cada una una sola vez

  Escenario: SEL-003 Más fichas de las pedidas
    Dado 5 fichas en "mate"
    Cuando elijo "mate" y pido 2 fichas
    Entonces entran 2 fichas de "mate", sin repetir

  Escenario: SEL-004 Menos fichas de las pedidas
    Dado 1 ficha en "historia"
    Cuando elijo "historia" y pido 10 fichas
    Entonces entra esa única ficha

  Escenario: SEL-005 Nada que estudiar
    Dado fichas solo en "mate"
    Cuando elijo "historia"
    Entonces la sesión queda vacía
