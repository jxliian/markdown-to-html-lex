/* SECCIÓN 1: DECLARACIONES 
   Aquí incluimos librerías y definimos alias para las expresiones regulares.
*/
%{
#include <iostream>
#include <string>
#include <vector>

using namespace std;

// Variable auxiliar para controlar si estamos dentro de una lista
bool en_lista = false;

// Función auxiliar para imprimir el cierre de lista si es necesario
void check_lista() {
    if (en_lista) {
        cout << "</ul>" << endl;
        en_lista = false;
    }
}
%}

/* Opciones de flex: noyywrap para leer un solo fichero */
%option noyywrap

/* DEFINICIONES (Alias de Regex) */
/* Detecta ecuaciones tipo $$...$$ */
LATEX_BLOQUE    \$\$[^$]*\$\$
/* Detecta ecuaciones tipo $...$ */
LATEX_INLINE    \$[^$\n]*\$
/* Detecta encabezados (# Titulo) */
HEADER          ^#{1,6}[ ]+.*
/* Detecta negrita (**texto**) */
BOLD            \*\*[^*]*\*\*
/* Detecta cursiva (_texto_) */
ITALIC          _[^_]*_
/* Detecta elementos de lista (- item) */
LIST_ITEM       ^-[ ]+.*
/* Detecta enlaces [texto](url) */
LINK            \[([^]]+)\]\(([^)]+)\)

/* SECCIÓN 2: REGLAS 
   Formato: Patrón { Acción en C++ }
*/
%%

{LATEX_BLOQUE} {
    check_lista(); // Si veníamos de una lista, la cerramos
    /* Envolvemos la ecuación en un div para centrarla */
    cout << "<div class='math-display'>" << yytext << "</div>" << endl;
}

{LATEX_INLINE} {
    /* Envolvemos la ecuación en un span */
    cout << "<span class='math-inline'>" << yytext << "</span>";
}

{HEADER} {
    check_lista();
    /* Contamos cuántas almohadillas (#) tiene para saber si es h1, h2, etc. */
    string texto = yytext;
    int nivel = 0;
    while(texto[nivel] == '#') { nivel++; }
    
    /* Extraemos el título quitando los # y espacios iniciales */
    string contenido = texto.substr(nivel);
    // Quitamos espacios extra al inicio
    size_t start = contenido.find_first_not_of(" ");
    if(start != string::npos) contenido = contenido.substr(start);

    cout << "<h" << nivel << ">" << contenido << "</h" << nivel << ">" << endl;
}

{LIST_ITEM} {
    /* Si no estábamos en lista, abrimos la etiqueta <ul> */
    if (!en_lista) {
        cout << "<ul>" << endl;
        en_lista = true;
    }
    /* Quitamos el guión y espacio inicial (- ) */
    string linea = yytext;
    cout << "  <li>" << linea.substr(2) << "</li>" << endl;
}

{BOLD} {
    /* Quitamos los asteriscos iniciales y finales */
    string s = yytext;
    cout << "<strong>" << s.substr(2, s.length()-4) << "</strong>";
}

{ITALIC} {
    /* Quitamos los guiones bajos */
    string s = yytext;
    cout << "<em>" << s.substr(1, s.length()-2) << "</em>";
}

{LINK} {
    /* Parseamos el link: [Texto](URL) */
    string s = yytext;
    size_t cierra_corchete = s.find("]");
    size_t abre_parentesis = s.find("(");
    
    string texto = s.substr(1, cierra_corchete - 1);
    string url = s.substr(abre_parentesis + 1, s.length() - abre_parentesis - 2);
    
    cout << "<a href='" << url << "'>" << texto << "</a>";
}

\n {
    /* Saltos de línea simples */
    if (!en_lista) cout << "<br>" << endl;
}

. {
    /* Regla por defecto: imprimir el carácter tal cual si no coincide con nada */
    check_lista(); // Si aparece texto normal, cerramos la lista si estaba abierta
    cout << yytext;
}

%%

/* SECCIÓN 3: PROCEDIMIENTOS DE USUARIO 
*/
int main(int argc, char *argv[]) {
    cout << "<!DOCTYPE html>" << endl;
    cout << "<html><head><meta charset='UTF-8'>" << endl;
    cout << "<title>Documento Generado</title>" << endl;
    cout << "<style>" << endl;
    cout << "body { font-family: sans-serif; max-width: 800px; margin: 40px auto; padding: 20px; line-height: 1.6; }" << endl;
    cout << "h1, h2, h3 { color: #2c3e50; border-bottom: 1px solid #eee; }" << endl;
    cout << "code { background: #f4f4f4; padding: 2px 5px; border-radius: 3px; }" << endl;
    cout << ".math-display { text-align: center; margin: 20px 0; font-size: 1.2em; }" << endl;
    cout << "</style>" << endl;
    
    // --- Para las formulas ---
    cout << "<script type=\"text/x-mathjax-config\">" << endl;
    cout << "  MathJax.Hub.Config({" << endl;
    cout << "    tex2jax: {" << endl;
    cout << "      inlineMath: [ ['$','$'], [\"\\\\(\",\"\\\\)\"] ]," << endl;
    cout << "      processEscapes: true" << endl;
    cout << "    }" << endl;
    cout << "  });" << endl;
    cout << "</script>" << endl;
    // -------------------------------------------------------------

    // Script de carga de MathJax
    cout << "<script type=\"text/javascript\" async" << endl;
    cout << "  src=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML\">" << endl;
    cout << "</script>" << endl;
    cout << "</head><body>" << endl;

    FlexLexer* lexer = new yyFlexLexer;
    lexer->yylex();

    if (en_lista) cout << "</ul>" << endl;
    cout << "</body></html>" << endl;

    return 0;
}