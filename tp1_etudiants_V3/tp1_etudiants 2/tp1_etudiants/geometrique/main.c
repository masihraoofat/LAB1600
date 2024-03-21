// Autheurs : Abass, Ely Cheikh - Brizini, Mahfoud - Chekkaf, Mehdi
// Modifié par : Marcoux, Gregoire (2215607) & Raoofat, Masih (2302222)
// Date : 2024-01-26
#include <stdio.h>

int calculerNiemeTerme(int a1, int r, int nb) {
    // Cette fonction devrait retourner le nième terme de la série
    int answer = 0;
    int temp_r = 0;
    //cas limite non requis en C, mais present pour respecter la formulation en assemb.
    nb -= 1;
    if(nb == 0) {return a1;}

    temp_r = pow(r, nb);
    answer = a1*temp_r;
    return answer;
}

int main() {
    int a1; 
    int r;  
    int nb;  

    printf("Entrez le premier terme (a1): ");
    if (scanf("%d", &a1) != 1) return -1;
    printf("Entrez la raison (r): ");
    if (scanf("%d", &r) != 1) return -1;
    printf("Entrez le nombre de termes (N): ");
    if (scanf("%d", &nb) != 1) return -1;

    int sum = calculerNiemeTerme(a1, r, nb);
    printf("La nième terme de la série géométrique est: %d\n", sum);

    return 0;
}
