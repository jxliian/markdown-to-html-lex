# La Hipótesis de Riemann

La **Hipótesis de Riemann**, conjeturada por *Bernhard Riemann* en 1859, es considerada por muchos como el problema sin resolver más importante de las matemáticas puras. Está íntimamente relacionada con la distribución de los **números primos**.

## 1. Definición de la Función Zeta
Todo comienza con la función zeta de Riemann, $\zeta(s)$, definida para un número complejo $s$ con parte real mayor que 1 por la serie de Dirichlet:

$$\zeta(s) = \sum_{n=1}^{\infty} \frac{1}{n^s} = \frac{1}{1^s} + \frac{1}{2^s} + \frac{1}{3^s} + \cdots$$

## 2. El Producto de Euler
Una de las propiedades más bellas (que seguro le gusta a tu profesor) es la conexión con los primos. Leonhard Euler demostró que esta suma es igual a un producto infinito sobre todos los números primos $p$:

$$\zeta(s) = \prod_{p \in \mathbb{P}} \frac{1}{1 - p^{-s}}$$

Esto confirma que el comportamiento de $\zeta(s)$ codifica información sobre la aleatoriedad de los primos.

## 3. La Ecuación Funcional
La función se puede extender analíticamente a todo el plano complejo (excepto en $s=1$) satisfaciendo la siguiente ecuación funcional, que relaciona el valor en $s$ con $1-s$:

$$\zeta(s) = 2^s \pi^{s-1} \sin\left(\frac{\pi s}{2}\right) \Gamma(1-s) \zeta(1-s)$$

Donde $\Gamma$ es la función Gamma (la extensión del factorial).

## 4. El Enunciado del Problema
La función zeta tiene ceros "triviales" en los enteros pares negativos ($-2, -4, -6, \dots$). La hipótesis trata sobre los ceros **no triviales**.

Riemann conjeturó que:

> La parte real de todo cero no trivial de la función zeta es $\frac{1}{2}$.

Es decir, si $\zeta(s) = 0$ y $s$ no es un entero par negativo, entonces:

$$\text{Re}(s) = \frac{1}{2}$$

## Consecuencias
Si esta hipótesis se demostrara cierta (hay un premio de [1 millón de dólares](https://www.claymath.org/millennium-problems) del Instituto Clay), implicaría:
- Una cota muy precisa para el error en el Teorema de los Números Primos: $|\pi(x) - \text{Li}(x)| < \frac{1}{8\pi} \sqrt{x} \ln(x)$.
- Mejoras en algoritmos de criptografía.
- Un avance monumental en la Teoría de Números.

_Este documento ha sido generado automáticamente procesando Markdown y LaTeX._
