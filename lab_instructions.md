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

## Folosire

De fiecare data cand vreti sa lucrati la MN, porniti environment-ul special facut pentru asta.

```conda activate mn_env```

Pentru a porni Jupyter Notebooks intr-un director anume in sistem, folositi comanda urmatoare.

```jupyter notebook```

Nu uitati sa verificati la fiecare fisier in care lucrati ca in dreapta sus apare kernel-ul folosit ca fiind ```Octave```.
