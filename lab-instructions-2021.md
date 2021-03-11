# Instructiuni pentru laboratorul de MN

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

### Tips & tricks

1. In interiorul celulei puteti folosi ```Enter``` pentru newline;
2. Pentru a executa o celula apasati ```Shift + Enter```;
3. Ordinea de executie a celulelor se vede in stanga fiecarei celule;
4. Celulele pot fi de tip ```Code``` si ```Markdown``` pentru a scrie text in format [markdown](https://guides.github.com/features/mastering-markdown/).

## Testare

Dupa ce rezolvati exercitiile din ```assignment.py```:
1. executati celulele care contin functiile rezolvate;
2. executati celulele de test; sunt acelea care contin functii de tip ```assert```;
3. in cazul in care ati rezolvat corect cerintele, nu veti primi [niciun mesaj de eroare](https://drive.google.com/file/d/14qQODLiWBHEjE5D3MH_yXkblYuBUp0aJ/view?usp=sharing);
4. in cazul in care ati rezolvat incorect cerintele, veti primi [mesaje de erroare](https://drive.google.com/file/d/1tDaz_MovUvgZMWef8Jk8Eh8Y790g6I2Y/view?usp=sharing);
5. atentie ca puteti si sta intr-o bucla infinita daca celula nu termina executia niciodata si [apare steluta in stanga ei](https://drive.google.com/file/d/1tf8L0ulsslvqjM5Fet2v338kpUaO14EU/view?usp=sharing).
