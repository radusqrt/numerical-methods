#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAXLEN 30

struct ceva {
    int l;
    char *s;
};

int main() {
    FILE *fin, *fout;
    char nume[MAXLEN], numar[MAXLEN], buffer[MAXLEN];
    struct ceva nebun;
    int length;

    fin = fopen("paginiaurii.in", "r");
    fout = fopen("zappisti.out", "w+b");

    nebun.s = NULL;

    while(fscanf(fin, "%s%s", nume, numar) > 0) {
        if (strncmp(numar, "078", 3) == 0) {
            nebun.l = strlen(nume);
            fwrite(&nebun.l, sizeof(nebun.l), 1, fout);
            if (nebun.s != NULL) {
                free(nebun.s);
            }
            nebun.s = strdup(nume);
            fwrite(nebun.s, sizeof(char), nebun.l, fout);
        }
    }

    free(nebun.s);

    fseek(fout, 0, SEEK_SET);
    while(fread(&length, sizeof(int), 1, fout) > 0) {
        fread(buffer, sizeof(char), length, fout);
        printf("%s\n", buffer);
    }

    fclose(fout);
    fclose(fin);

    return 0;
}