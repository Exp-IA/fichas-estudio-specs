#!/usr/bin/env python3
"""Valida los casos de prueba compartidos y los identificadores de requerimientos.

Uso: python3 scripts/validar.py
Sale con código 1 si encuentra errores.
"""
import json
import re
import sys
from pathlib import Path

RAIZ = Path(__file__).resolve().parent.parent
REQUERIMIENTOS = RAIZ / "specs" / "01-requerimientos.md"
CASOS = RAIZ / "pruebas" / "casos"
ACEPTACION = RAIZ / "pruebas" / "aceptacion"

CAMPOS_ARCHIVO = {"id", "titulo", "estado", "requerimientos", "casos"}
CAMPOS_CASO = {"id", "descripcion", "entrada", "esperado"}
ESTADOS = {"propuesta", "aceptado"}

errores = []


def error(msg):
    errores.append(msg)


def requerimientos_definidos():
    texto = REQUERIMIENTOS.read_text(encoding="utf-8")
    ids = re.findall(r"^\|\s*(REQ-\d{3})\s*\|", texto, flags=re.MULTILINE)
    vistos = set()
    for rid in ids:
        if rid in vistos:
            error(f"{REQUERIMIENTOS.name}: {rid} está definido más de una vez")
        vistos.add(rid)
    return vistos


def validar_casos(reqs):
    ids_casos = {}
    for archivo in sorted(CASOS.glob("*.json")):
        nombre = archivo.relative_to(RAIZ)
        try:
            datos = json.loads(archivo.read_text(encoding="utf-8"))
        except json.JSONDecodeError as e:
            error(f"{nombre}: JSON inválido ({e})")
            continue

        faltan = CAMPOS_ARCHIVO - datos.keys()
        if faltan:
            error(f"{nombre}: faltan campos {sorted(faltan)}")
            continue
        if datos["estado"] not in ESTADOS:
            error(f"{nombre}: estado '{datos['estado']}' no es uno de {sorted(ESTADOS)}")
        if "issue" in datos and not isinstance(datos["issue"], int):
            error(f"{nombre}: 'issue' debe ser un número")
        for rid in datos["requerimientos"]:
            if rid not in reqs:
                error(f"{nombre}: {rid} no existe en {REQUERIMIENTOS.relative_to(RAIZ)}")

        prefijo = datos["id"] + "-"
        for caso in datos["casos"]:
            faltan = CAMPOS_CASO - caso.keys()
            cid = caso.get("id", "?")
            if faltan:
                error(f"{nombre}: el caso {cid} no tiene {sorted(faltan)}")
            if not cid.startswith(prefijo):
                error(f"{nombre}: el caso {cid} debería empezar por {prefijo}")
            if cid in ids_casos:
                error(f"{nombre}: el caso {cid} ya existe en {ids_casos[cid]}")
            ids_casos[cid] = nombre
    return ids_casos


def validar_aceptacion(ids_casos):
    for archivo in sorted(ACEPTACION.glob("*.feature")):
        nombre = archivo.relative_to(RAIZ)
        texto = archivo.read_text(encoding="utf-8")
        if not texto.startswith("# language: es"):
            error(f"{nombre}: la primera línea debe ser '# language: es'")
        for cid in sorted(set(re.findall(r"\b([A-Z]{3}-\d{3})\b", texto))):
            if cid not in ids_casos:
                error(f"{nombre}: {cid} no tiene caso en pruebas/casos/")


def main():
    reqs = requerimientos_definidos()
    ids_casos = validar_casos(reqs)
    validar_aceptacion(ids_casos)
    if errores:
        print(f"{len(errores)} error(es):")
        for e in errores:
            print(f"  - {e}")
        sys.exit(1)
    print(f"OK: {len(reqs)} requerimientos, {len(ids_casos)} casos de prueba.")


if __name__ == "__main__":
    main()
