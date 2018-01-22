#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXVOTES 5
#define MAXLEN 20

typedef struct {
    char nume[MAXLEN];
    int puncte;
    int calificata;
} tara;

tara *gaseste(tara tari[], char *nume,
        int tari_gasite) {
    int i;

    for (i = 0; i < tari_gasite; ++i) {
        if (strcmp(nume, tari[i].nume) == 0) {
            return &tari[i];
        }
    }

    return NULL;
}

int is_disqualified(char *tara_juriu,
    char tari_votate[MAXVOTES][MAXLEN]) {
    int i;

    for (i = 0; i < MAXVOTES; ++i) {
        if (strcmp(tari_votate[i],
                tara_juriu) == 0) {
            return 1;
        }
    }

    return 0;
}

void voteaza(char *nume_tara, tara tari[],
        int *tari_gasite, int puncte) {
    int i;

    for (i = 0; i < *tari_gasite; ++i) {
        if (strcmp(nume_tara, tari[i].nume) == 0) {
            tari[i].puncte += puncte;
            return;
        }
    }

    strcpy(tari[*tari_gasite].nume, nume_tara);
    tari[*tari_gasite].puncte = puncte;
    tari[*tari_gasite].calificata = 1;
    (*tari_gasite) ++;
}

void print_tara(tara *tara_curenta) {
    printf("[%s : %d : %s]\n",
        tara_curenta->nume,
        tara_curenta->puncte,
        tara_curenta->calificata ?
            "CALIFICATA" :
            "DESCALIFICATA"
    );
}

void swapc(tara *a, tara *b) {
    char aux[MAXLEN];
    strcpy(aux, a->nume);
    strcpy(a->nume, b->nume);
    strcpy(b->nume, aux);
}

void swapi(int *a, int *b) {
    *a ^= *b;
    *b ^= *a;
    *a ^= *b;
}

int trebuie_schimbate(tara *a, tara *b) {
    return a->puncte * a->calificata <
        b->puncte * b->calificata;
}

int cmp(const void *a, const void *b) {
    return trebuie_schimbate((tara *) a, (tara *) b);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: ./eurovision <n> <clasament>\n");
        return -27;
    }

    int n, i, j, tari_gasite;
    FILE *fin;
    char tara_juriu[MAXLEN];
    char tari_votate[MAXVOTES][MAXLEN];

    n = atoi(argv[1]);
    fin = fopen(argv[2], "rt");

    tara *tara_curenta, tari[n];
    tari_gasite = 0;

    while (fscanf(fin, "%s", tara_juriu) > 0) {
        for (i = 0; i < MAXVOTES; ++i) {
            fscanf(fin, "%s", tari_votate[i]);
        }

        tara_curenta = gaseste(tari,
            tara_juriu, tari_gasite);

        if (tara_curenta == NULL) {
            strcpy(tari[tari_gasite].nume, tara_juriu);
            tari[tari_gasite].puncte = 0;
            tari[tari_gasite].calificata = 1;
            tara_curenta = &tari[tari_gasite ++];
        }

        if (is_disqualified(tara_juriu,
                tari_votate)) {
            tara_curenta->calificata = 0;
        }

        for (i = 0; i < MAXVOTES; ++i) {
            voteaza(tari_votate[i], tari,
                &tari_gasite, MAXVOTES - i);
        }
    }

    for (i = 0; i < tari_gasite; ++i) {
        print_tara(&tari[i]);
    }

    // Bubble sort
    /*
    int sorted;
    do {
        sorted = 1;
        for (i = 0; i < tari_gasite - 1; ++i) {
            if (trebuie_schimbate(&tari[i], &tari[i + 1])) {
                swapc(&tari[i], &tari[i + 1]);
                swapi(&tari[i].puncte, &tari[i + 1].puncte);
                swapi(&tari[i].calificata, &tari[i + 1].calificata);
                sorted = 0;
            }
        }
    } while (!sorted);
    */

    // Sortare penala prin interschimbare
    /*
    for (i = 0; i < tari_gasite - 1; ++i) {
        for (j = i + 1; j < tari_gasite; ++j) {
            if (trebuie_schimbate(&tari[i], &tari[j])) {
                swapc(&tari[i], &tari[j]);
                swapi(&tari[i].puncte, &tari[j].puncte);
                swapi(&tari[i].calificata, &tari[j].calificata);
            }
        }
    }
    */

    // Sortare prin qsort
    /*
    qsort(tari, tari_gasite, sizeof(tara), cmp);

    printf("================\n");
    for (i = 0; i < tari_gasite; ++i) {
        print_tara(&tari[i]);
    }

    printf("================\n");
    printf("PENALELE\n");
    for (i = 0; i < tari_gasite; ++i) {
        if (tari[i].puncte == 0) {
            print_tara(&tari[i]);
        }
    }
    */

    fclose(fin);

    return 0;
}