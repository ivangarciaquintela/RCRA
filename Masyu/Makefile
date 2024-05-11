# Definir una regla por defecto
default: run_make_py

help:
	python3 make.py -h

run:
	python3 make.py all

encode: 
	python3 make.py encode
decode : 
	python3 make.py decode

# Regla para mostrar el display con el número especificado
display:
	python3 make.py display $(N)

extract:
	unzip -o masyu-examples.zip

# Regla para ejecutar make.py
run_make_py: extract
	python3 make.py all

# Regla para limpiar archivos solXX.txt y masyuXX.lp
clear:
	rm -f solution*.txt masyu0*.lp 

clean:
	rm -f solution*.txt sol*.txt masyu0*.lp masyu*.txt README.txt

