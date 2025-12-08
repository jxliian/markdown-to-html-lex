# Makefile para el proyecto Markdown+LaTeX a HTML

all: procesador

procesador: lex.yy.cc
	g++ -o procesador lex.yy.cc

lex.yy.cc: procesador.l
	flex++ procesador.l

clean:
	rm -f procesador lex.yy.cc salida.html

test: procesador
	./procesador < prueba.md > salida.html
	@echo "Generado salida.html. ¡Ábrelo en tu navegador!"