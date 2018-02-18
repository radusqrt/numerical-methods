#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLEN 30

int dlin[] = {-1, 0, 1, 0};
int dcol[] = {0, 1, 0, -1};

typedef struct {
    char *proprietar, *culoare;
    float pret;
    int insula;
} bucata;

void print_bucata(bucata *buc) {
    printf("[%s:%s:%f:%d] ", buc->proprietar,
        buc->culoare, buc->pret, buc->insula);
}

void fill(bucata **mat, int i, int j, int m, int n,
    int insula, float *preturi) {
    int k, new_i, new_j;

    mat[i][j].insula = insula;
    preturi[insula] += mat[i][j].pret;

    printf("%d-%d: %f-%f\n", i, j, mat[i][j].pret, preturi[insula]);

    for (k = 0; k < 4; ++k) {
        new_i = i + dlin[k];
        new_j = j + dcol[k];

        if (new_i >= 0 && new_j >= 0 && new_i < m && new_j < n) {
            if (mat[new_i][new_j].insula == -1 &&
                strcmp(mat[new_i][new_j].culoare,
                    mat[i][j].culoare) == 0) {
                fill(mat, new_i, new_j, m, n, insula, preturi);
            }
        }
    }
}

int main() {
    bucata **mat;
    FILE *fin;
    char cul_buf[MAXLEN], prop_buf[MAXLEN];
    int m, n, i, j, k, insula_cur, maxim, max_island, nr_proprietari;
    int gasit;
    float pret;
    char **proprietari_max;
    float *preturi_proprietari;

    fin = fopen("pamant.in", "rt");
    fscanf(fin, "%d%d", &m, &n);

    mat = (bucata **) malloc(m * sizeof(bucata *));
    for (i = 0; i < m; ++i) {
        mat[i] = (bucata *) malloc(n * sizeof(bucata));
    }

    for (i = 0; i < m; ++i) {
        for (j = 0; j < n; ++j) {
            fscanf(fin, "%s %s %f",
                prop_buf, cul_buf, &pret);

            mat[i][j].proprietar = strdup(prop_buf);
            mat[i][j].culoare = strdup(cul_buf);
            mat[i][j].pret = pret;
            mat[i][j].insula = -1;
        }
    }

    fclose(fin);

    float *preturi = NULL;
    insula_cur = -1;
    for (i = 0; i < m; ++i) {
        for (j = 0; j < n; ++j) {
            if (mat[i][j].insula == -1) {
                insula_cur ++;
                preturi = realloc(preturi, (insula_cur + 1) * sizeof(float));
                preturi[insula_cur] = 0;
                fill(mat, i, j, m, n, insula_cur, preturi);
            }
        }
    }

    // for (i = 0; i < m; ++i) {
    //     for (j = 0; j < n; ++j) {
    //         preturi[mat[i][j].insula] += mat[i][j].pret;
    //     }
    // }

    for (i = 0; i < m; ++i) {
        for (j = 0; j < n; ++j) {
            // print_bucata(&mat[i][j]);
            printf("%d ", mat[i][j].insula);
        }
        printf("\n");
    }

    for (i = 0; i < insula_cur + 1; ++i) {
        printf("%d: %f\n", i, preturi[i]);
    }

    maxim = preturi[0];
    max_island = 0;

    for (i = 1; i < insula_cur + 1; ++i) {
        if (maxim < preturi[i]) {
            maxim = preturi[i];
            max_island = i;
        }
    }

    proprietari_max = NULL;
    preturi_proprietari = NULL;
    nr_proprietari = 0;

    for (i = 0; i < m; ++i) {
        for (j = 0; j < n; ++j) {
            if (mat[i][j].insula == max_island) {
                gasit = 0;
                for (k = 0; k < nr_proprietari && !gasit; ++k) {
                    if (strcmp(proprietari_max[k], mat[i][j].proprietar) == 0) {
                        gasit = 1;
                        preturi_proprietari[k] += mat[i][j].pret;
                    }
                }

                if (!gasit) {
                    proprietari_max = realloc(proprietari_max, (nr_proprietari + 1) * sizeof(char*));
                    proprietari_max[nr_proprietari] = strdup(mat[i][j].proprietar);
                    preturi_proprietari = realloc(preturi_proprietari, (nr_proprietari + 1) * sizeof(float));
                    preturi_proprietari[nr_proprietari] = mat[i][j].pret;
                    nr_proprietari ++;
                }
            }
        }
    }

    for (i = 0; i < nr_proprietari; ++i) {
        printf("[%s:%f]\n", proprietari_max[i], preturi_proprietari[i]);
    }

    maxim = preturi_proprietari[0];
    strcpy(prop_buf, proprietari_max[0]);

    for (i = 1; i < nr_proprietari; ++i) {
        if (maxim < preturi_proprietari[i]) {
            maxim = preturi_proprietari[i];
            strcpy(prop_buf, proprietari_max[i]);
        }
    }

    printf("MARELE BOSS: %s\n", prop_buf);

    for (i = 0; i < m; ++i) {
        for (j = 0; j < n; ++j) {
            free(mat[i][j].proprietar);
            free(mat[i][j].culoare);
        }

        free(mat[i]);
    }
    free(mat);

    free(preturi);

    for (i = 0; i < nr_proprietari; ++i) {
        free(proprietari_max[i]);
    }

    free(proprietari_max);
    free(preturi_proprietari);

    return 0;
}