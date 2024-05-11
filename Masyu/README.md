# Author Information

- **Author:** Ivan García Quintela
- **Date:** May 13, 2024
- **Description:** Project: Clingo ASP for Masyu Puzzle Solver

## Description

This project uses Clingo ASP for Masyu puzzle solving. In the project directory there is a `makefile` that provides several useful rules for working with the code.
The following dependencies are required to be installed:
- **Python 3:** It can be downloaded from [python.org](https://www.python.org/downloads/) and installed according to the instructions on the website.
- **pygame:** A library of games that can be installed using ``pip`:
  ````bash
  pip install pygame
  ````
- **clingo:** A logic programming system that can also be installed with pip:
  ````bash
  pip install clingo
  ````
- **clingraph**: An extension for Clingo that allows you to plot graphs and visualize data. You can install it using pip:
  ````bash
  pip install clingraph
  ````
## Use of the Makefile
The `makefile` includes the following rules:

- **default:** Run script to unzip masyu-examples and execute the encode and decode options for each sample.
- **help:** Show help using `make.py`.
- **run:** Run `make.py all`.
- **encode:** Run `python3 encode.py masyuXX.txt masyuXX.lp` for all examples.
- **decode:** Run `python3 decode.py masyuKB.lp masyuXX.lp > solutionXX.txt` for all examples.
- **display:** Displays the display with the specified number (`N`).  Run `python3 display.py masyuKB.lp masyuXX.lp drawmasyu.lp` (N = XX). 
- **extract:** Unzip `masyu-examples.zip` to the directory.
- **clear:** Deletes `solution*.txt` and `masyu0*.lp` files.
- **clean:** Deletes files `solution*.txt`, `sol*.txt`, `masyu0*.lp` and `masyu*.txt`.

## Examples
- `make`
- `make encode`
- `make decode`
- `make display N=01`
- `make display N=02`
- `make display N=03`
- `make clean` 
- `make extract`


## Contact

- **Email:** [ivan.garcia.quintela@udc.es](mailto:ivan@example.com)
- **GitHub:** [Ivan Garcia Quintela](https://github.com/ivangarciaquintela)
- **Repository:** [RCRA](https://github.com/ivangarciaquintela/RCRA/tree/main/Masyu)