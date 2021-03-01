# Instructiuni pentru laboratorul de MN

## Alegere alias unic

Intrati [aici](https://docs.google.com/spreadsheets/d/1ZNWChct5qWZcqeay0zMtXWjDHpMtmii-GMOXJwzJ4uY/edit?usp=sharing) si treceti-va numele + un alias pe care il voi folosi pentru autograding. Alias-ul trebuie sa contina doar litere mici si cifre si sa nu inceapa cu cifre.

Documentul va fi blocat de pe 03.03.2020, deci nu va veti mai putea schimba alias-ul ales.

## Instalare

### 1. Instalare Octave

Instructiuni [aici](https://wiki.octave.org/Octave_for_GNU/Linux).

### 2. Instalare Anaconda

Instructiuni [aici](https://docs.anaconda.com/anaconda/install/linux/).

### 3. Creare ```conda env``` pentru laboratoarele de MN

```conda create -n mn_env anaconda python=3.7```

### 4. Activare environment

```conda activate mn_env```

### 5. Instalare kernel Octave pentru Jupyter Notebooks

```
conda config --add channels conda-forge
conda install octave_kernel
conda install texinfo
```

### 6. Instalare gnuplot pentru grafice in Octave

```
conda install -c bioconda gnuplot
```

## Folosire

De fiecare data cand vreti sa lucrati la MN, porniti environment-ul special facut pentru asta.

```conda activate mn_env```

Pentru a porni Jupyter Notebooks intr-un director anume in sistem, folositi comanda urmatoare:

```jupyter notebook```

Nu uitati sa verificati la fiecare fisier in care lucrati ca in dreapta sus apare kernel-ul folosit ca fiind ```Octave```.

## Trimitere

Imi veti trimite pe adresa radu.stochitoiu@gmail.com cate un mail pentru fiecare laborator cu titlul ```[<lab_name_as_in_drive_directory>] [<your_chosen_alias>] Laborator MN``` si care va contine cate o arhiva cu urmatoarea structura de fisiere:

```<your_chosen_alias>/<lab_name_as_in_drive_directory>/assignment.ipynb```

Exemplu: pentru laboratorul LU, numele laboratorului este ```2-lu```, dupa cum se poate vedea in [drive](https://drive.google.com/open?id=1rgnXmFved0mU9ka_G09D5TKp4Gt_LzIc); titlul email-ului poate fi [2-lu] [radusqrt] Laborator MN. 
