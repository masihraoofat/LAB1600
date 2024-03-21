// Autheurs : Abass, Ely Cheikh - Brizini, Mahfoud - Chekkaf, Mehdi
// Modifié par : Marcoux, Gregoire (2215607) & Raoofat, Masih (2302222)
// Date : 2024-01-26
#include <stdio.h>
const one = 1;

int fibonacci(int n_value) {
    // Cette fonction devrait retourner le nième terme de la suite
    int value1 = 0;
    int value2 = 1;
    if(n_value == 0) {return value1;}

    while(1) {
        if(n_value - one == 0) {return value2;}
        n_value = n_value - one;
        value1 = value1 + value2;

        if(n_value - one == 0) {return value1;}
        n_value = n_value - one;
        value2 = value2 + value1;
    }
}

int main() {
    // Affichage des 10 premiers termes de la suite de Fibonacci
    for (int i = 0; i <= 10; i ++) printf("Fibonacci %d = %d\n", i, fibonacci(i));
    return 0;
}
