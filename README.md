# 📝 Flex Markdown & LaTeX Parser

![C++](https://img.shields.io/badge/C++-Solutions-blue.svg?style=flat&logo=c%2B%2B)
![Flex](https://img.shields.io/badge/Tool-Flex-green.svg)
![Status](https://img.shields.io/badge/Status-Completed-success)
![University](https://img.shields.io/badge/UGR-Modelos_de_Computación-red)

Un procesador de textos avanzado construido con **Flex** y **C++**. Este escáner léxico convierte documentos escritos en **Markdown** (con soporte para ecuaciones **LaTeX**) en páginas **HTML5** modernas, estilizadas y responsivas.

Este proyecto fue desarrollado como parte de la asignatura *Modelos de Computación* de la Universidad de Granada.

## ✨ Características principales

Este no es un conversor estándar. Incluye características avanzadas de procesamiento de lenguaje:

### 1. 📐 Soporte Matemático (LaTeX)
Integra **MathJax** para renderizar ecuaciones complejas.
- **Inline:** Detecta `$E=mc^2$` dentro del texto.
- **Display Block:** Detecta bloques `$$...$$` y los centra con estilo.

### 2. 💻 Resaltado de Sintaxis (Syntax Highlighting)
Utiliza **Start Conditions (`%x`)** de Flex para cambiar de autómata al detectar bloques de código C++.
- Colorea palabras clave (`int`, `return`, `if`), cadenas y comentarios.
- Mantiene el formato pre-procesado.


## 🛠️ Tecnologías y Teoría

Este proyecto aplica la teoría de **Autómatas Finitos y Expresiones Regulares**.

* [cite_start]**Flex (Fast Lexical Analyzer Generator):** Herramienta que genera un escáner en C++ a partir de reglas léxicas[cite: 14].
* **Expresiones Regulares:** Se definen patrones formales para cada token (encabezados, listas, negritas, etc.).
* **Autómatas Finitos Deterministas (AFD):** Flex compila estas expresiones en un AFD que procesa el texto de entrada eficientemente.

## 🚀 Instalación y Uso

### Prerrequisitos
Necesitas tener instalado `flex` y un compilador de C++ (`g++`).

```bash
# En Ubuntu/Debian
sudo apt-get install flex g++ make

```

### Compilación

Hemos incluido un `makefile` para facilitar la tarea. Simplemente ejecuta:

```bash
make

```

Esto generará el ejecutable `procesador`.

### Ejecución

Para convertir un archivo Markdown a HTML:

```bash
./procesador < prueba.md > index.html

```

O utiliza el comando de prueba automático:

```bash
make test

```

Esto procesará `prueba.md` y generará `salida.html` automáticamente.

---

## 📂 Estructura del Proyecto

* `procesador.l`: Archivo fuente de Flex. Contiene las definiciones (`%x`), reglas regex y el código C++ inyector.
* `makefile`: Script de automatización para compilar y limpiar.
* `prueba.md`: Archivo de entrada con ejemplos complejos (Hipótesis de Riemann, Código C++, etc.).
* `lex.yy.cc`: (Generado) Código fuente en C++ creado por Flex.

---



## 👥 Autores

* **[José Ángel Carretero Montes]**
* **[David Bacas Posadas]**
* **[Julián Carrion Tovar]**

