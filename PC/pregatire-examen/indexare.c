#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLINE 200

typedef struct {
    int l;
    char v[15];
} art_cuv;

int found_in_file(FILE *f, char *s) {
    fseek(f, 0, SEEK_SET);
    art_cuv aux_art;
    int degeaba;

    while (fread(&aux_art, sizeof(art_cuv), 1, f) > 0) {
        fread(&degeaba, sizeof(degeaba), 1, f);
        if (strcmp(aux_art.v, s) == 0) {
            return 1;
        }
    }

    return 0;
}

int main(int argc, char *argv[]) {
    if (argc != 5) {
        fprintf(stderr, "Usage: index <filename> <n> <m> <p>\n");
        return -1;
    }

    char delim[]=" .,:;-\n/";
    FILE *fin, *f1, *f2;
    int n, m, p, length, count, curr_pos;
    char buffer[MAXLINE], *p_buf;
    art_cuv aux_art, aux_art2;

    fin = fopen(argv[1], "rt");
    m = atoi(argv[2]);
    n = atoi(argv[3]);
    p = atoi(argv[4]);

    f1 = fopen("f1", "w+b");
    f2 = fopen("f2", "w+b");

    while (fscanf(fin, "%s", buffer) > 0) {
        for (p_buf = strtok(buffer, delim); p_buf;
                p_buf = strtok(NULL, delim)) {
            length = strlen(p_buf);

            if (length >= m && length <= n) {
                strcpy(aux_art.v, p_buf);
                aux_art.l = length;

                fwrite(&aux_art, sizeof(art_cuv), 1, f1);
            }
        }
    }

    fclose(fin);

    fseek(f1, 0, SEEK_SET);
    while (fread(&aux_art, sizeof(art_cuv), 1, f1) > 0) {
        if (found_in_file(f2, aux_art.v)) {
            continue;
        } else {
            curr_pos = ftell(f1);
            count = 1;

            while (fread(&aux_art2, sizeof(art_cuv), 1, f1) > 0) {
                if (strcmp(aux_art.v, aux_art2.v) == 0) {
                    count ++;
                }
            }

            fseek(f1, curr_pos, SEEK_SET);
            if (count >= p) {
                fwrite(&aux_art, sizeof(art_cuv), 1, f2);
                fwrite(&count, sizeof(count), 1, f2);
            }
        }
    }

    fseek(f2, 0, SEEK_SET);
    while (fread(&aux_art, sizeof(art_cuv), 1, f2) > 0) {
        fread(&count, sizeof(int), 1, f2);
        printf("%s : %d\n", aux_art.v, count);
    }

    fclose(f1);
    fclose(f2);

    return 0;
}