import os
import subprocess
import time
import argparse


def encode_xx(xx):
    #Función para ejecutar encode para un archivo masyuXX.txt dado el valor de XX
    masyu_input = f"masyu{xx}.txt"
    masyu_output = f"masyu{xx}.lp"
    encode_command = f"python3 encode.py {masyu_input} {masyu_output}"
    print(f"Ejecutando: {encode_command}")
    try:
        subprocess.run(encode_command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error al ejecutar {encode_command}: {e}")

def decode_xx(xx):
    #Función para ejecutar decode para un archivo masyuXX.lp dado el valor de XX
    masyu_output = f"masyu{xx}.lp"
    solution_output = f"solution{xx}.txt"
    decode_command = f"python3 decode.py masyuKB.lp {masyu_output} > {solution_output}"
    print(f"Ejecutando: {decode_command}")
    start_time = time.time()
    # Ejecutar decode.py
    try:
        subprocess.run(decode_command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error al ejecutar {decode_command}: {e}")
    # Calcular tiempo transcurrido en milisegundos
    end_time = time.time()
    execution_time_ms = (end_time - start_time) #* 1000  # Convertir a milisegundos
    # Mostrar el tiempo de ejecución
    print(f"Tiempo de ejecución de decode.py para masyu{xx}: {execution_time_ms:.2f} s")

    # Comparar solXX.txt con solutionXX.txt
    sol_file = f"sol{xx}.txt"
    solution_file = f"solution{xx}.txt"

    # Leer el contenido de los archivos
    with open(sol_file, 'r') as f:
        sol_content = f.read()

    with open(solution_file, 'r') as f:
        solution_content = f.read()

    # Mostrar el progreso y los contenidos de los archivos
    print(f"Contenido de {sol_file}:")
    print(sol_content)
    print(f"Contenido de {solution_file}:")
    print(solution_content)

    # Comparar los archivos
    if sol_content == solution_content:
        print(f"Los archivos {sol_file} y {solution_file} son iguales.")
    else:
        print(f"¡Atención! Los archivos {sol_file} y {solution_file} son diferentes.")

    print("="*50)  # Separador visual entre iteraciones

def display_xx(xx):
    """Función para ejecutar display.py para un archivo masyuXX.lp dado el valor de XX"""
    masyu_output = f"masyu{xx:02d}.lp"
    display_command = f"python3 display.py masyuKB.lp {masyu_output} drawmasyu.lp"
    print(f"Ejecutando: {display_command}")
    try:
        subprocess.run(display_command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error al ejecutar {display_command}: {e}")


def main():
    parser = argparse.ArgumentParser(description="Script para ejecutar encode y decode para archivos masyuXX.")
    parser.add_argument("action", choices=["all", "encode", "decode","display"], help="Acción a realizar (all, encode, decode o display)")
    parser.add_argument("xx", nargs="?", type=str, help="Valor de XX (debe ser un número entre 01 y 08), solo en la opcion display")
    args = parser.parse_args()
    xx_values = [f"{i:02d}" for i in range(9)]

    if args.action == "all":
        for xx in xx_values:
            encode_xx(xx)
            decode_xx(xx)
    elif args.action == "encode":
        for xx in xx_values:
            encode_xx(xx)
    elif args.action == "decode":
        for xx in xx_values:
            decode_xx(xx)
    elif args.action == "display":
        if args.xx is not None:
            encode_xx(f"{int(args.xx):02d}")
            decode_xx(f"{int(args.xx):02d}")
            display_xx(int(args.xx))
    else:
            print("Acción no válida. Usa 'all', 'encode', 'decode' o 'display'.")

if __name__ == "__main__":
    main()

    