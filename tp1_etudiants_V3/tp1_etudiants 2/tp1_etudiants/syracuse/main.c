// Autheurs : Abass, Ely Cheikh - Brizini, Mahfoud - Chekkaf, Mehdi
// Modifié par : Marcoux, Gregoire (2215607) & Raoofat, Masih (2302222)
// Date : 2024-01-26

#include <stdio.h>

int syracuse(int u0, int nb) {
    // Cette fonction devrait retourner le nbième terme de la suite
    
    while(1) {
        int temp_value = u0;
        temp_value = temp_value >> 1;
        temp_value = temp_value * 2;

        if(u0-temp_value == 0) { //pair
            u0 = u0 >> 1;
        }

        else if(u0-temp_value != 0) {//impair
            u0 = u0 * 3 + 1;
        }

        nb -= 1;
        if(nb == 0) {return u0;}
    }
}

int main() {
    int nb = 3; // Nombre de termes
    int u0 = 15; // Terme initial
    printf("Syracuse %d = %d\n", u0, syracuse(u0, nb));
    return 0;
}