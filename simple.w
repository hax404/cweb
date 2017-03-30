% -*- mode: c -*-
\secpagedepth0
\emergencystretch1ex
\def\topofcontents{\centerline{\titlefont\title}%
\centerline{\today}\vskip.7in
\centerline{Name,Vorname,infXXXX,Matrikelnummer}
\vskip.7in
  \vfill} % this material will start the table of contents page
\today
%\datethis
\def\vfej{\vfill\eject}
\def\newpage{\aftergroup\vfej}
\vfej

@** Sortieralgorithmen.

@*1 Bubble Sort zufaellig.
@ 0\%/25\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char0\vrule\char1\vrule}\hrule}\hfil}

@ 50\%/75\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char2\vrule\char3\vrule}\hrule}\hfil}

@ 100\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char4\vrule}\hrule}\hfil}
\vfill \break

@*1 Bubble Sort abwaerts.
@ 0\%/25\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char5\vrule\char6\vrule}\hrule}\hfil}

@ 50\%/75\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char7\vrule\char8\vrule}\hrule}\hfil}

@ 100\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char9\vrule}\hrule}\hfil}
\vfill \break


@*1 Insert Sort zufaellig.
@ 0\%/25\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char10\vrule\char11\vrule}\hrule}\hfil}

@ 50\%/75\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char12\vrule\char13\vrule}\hrule}\hfil}

@ 100\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char14\vrule}\hrule}\hfil}
\vfill \break

@*1 Insert Sort abwaerts.
@ 0\%/25\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char15\vrule\char16\vrule}\hrule}\hfil}

@ 50\%/75\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char17\vrule\char18\vrule}\hrule}\hfil}

@ 100\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char19\vrule}\hrule}\hfil}
\vfill \break

@*1 Select Sort zufaellig.
@ 0\%/25\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char20\vrule\char21\vrule}\hrule}\hfil}

@ 50\%/75\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char22\vrule\char23\vrule}\hrule}\hfil}

@ 100\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char24\vrule}\hrule}\hfil}
\vfill \break

@*1 Select Sort abwaerts.
@ 0\%/25\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char25\vrule\char26\vrule}\hrule}\hfil}

@ 50\%/75\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char27\vrule\char28\vrule}\hrule}\hfil}

@ 100\%.
\vskip1\baselineskip
\font\f=simplef.mf scaled 600
{\hfil\f\vbox{\hrule\hbox{\vrule\char29\vrule}\hrule}\hfil}

\vfill \break

@** Programmbestandteile.
@*1 Implementierungen der Sortieralgorithmen.

@*2 Bubble Sort.
@<Bubblesort@>=
void bubble_sort(int list[], int laenge, char filename[]){
	int i, j, tmp;
	for(i=0;i<(laenge-1);i++){
		auswertung(list, laenge, i, filename);
		for(j=0;j<laenge-i-1;j++){
			if(list[j]>list[j+1]){
				tmp= list[j];
				list[j]=list[j+1];
				list[j+1]=tmp;
			}
		}
	}
	auswertung(list, laenge, 100, filename);
}

@*2 Insert Sort.
@<Insertsort@>=
void insert_sort(int list[], int laenge, char filename[]){
	int i,j,tmp;
	auswertung(list, laenge, 0, filename);
	for(i=1;i<=laenge-1;i++){
		j=i;
		while(j>0 && list[j] < list[j-1]){
			tmp = list[j];
			list[j] = list[j-1];
			list[j-1] = tmp;
			j--;
		}
		auswertung(list, laenge, i, filename);
	}
}

@*2 Select Sort.
@<Selectsort@>=
void select_sort(int list[], int laenge, char filename[]){
	int i, j, position, tmp;
	for(i=0;i<(laenge-1);i++){
		auswertung(list, laenge, i, filename);
		position = i;

		for(j=i+1;j<laenge;j++){
			if(list[position]>list[j]){
				position = j;
			}
		}
		if(position != i){
			tmp = list[i];
			list[i] = list[position];
			list[position] = tmp;
		}
	}
	auswertung(list, laenge, 100, filename);
}

@*1 Hilfsfunktionen.

@*2 Array mit Zufallszahlen befuellen.
@<fillrandom@>=
void fill_random(int list[], int laenge){
	int i,k,tmp;
	for(i=0;i<=laenge-1;i++){
		list[i] = i;
	}
	for(i=0;i<laenge-1;i++){
		k = rand()%laenge;
		tmp = list[i];
		list[i] = list[k];
		list[k] = tmp;
	}
}

@*2 Array mit umgekehrt aufsteigenden Werten befuellen.
@<filldesc@>=
void fill_desc(int list[], int laenge){
	int i;
	for(i=0;i<=laenge-1;i++){
		list[i] = (i-100)*-1;
	}
}

@*2 Auswertungsfunktion fuer Zwischenstaende.
@<Auswertung@>=
void auswertung(int list[], int laenge, int i, char filename[]){
	if(i==0){
		write_list(list, laenge, filename, "0");
	}
	else if(i==25){
		write_list(list, laenge, filename, "25");
	}
	else if(i==50){
		write_list(list, laenge, filename, "50");
	}
	else if(i==75){
		write_list(list, laenge, filename, "75");
	}
	else if(i==100){
		write_list(list, laenge, filename, "100");
	}
}

@*2 Funktion zum Wegschreiben vom Array.
@<writelist@>=
void write_list(int list[], int laenge, char filename[], char progress[]){
	int i;
	FILE*f;
	char newname[50] = {""};
	strcat(newname, filename);
	strcat(newname, progress);
	strcat(newname, ".dat");
	f = fopen(newname,"w");
	for(i=0;i<=laenge-1;i++){
		fprintf(f,"%d\t%d\n",i,list[i]);
	}
	fclose(f);
}

@*2 Sortieralgorithmen aufrufen.
@<executeSortalgorithms@>=
fill_random(list, laenge);
bubble_sort(list, laenge, "bubble_sort_random_");
fill_desc(list, laenge);
bubble_sort(list, laenge, "bubble_sort_desc_");

fill_random(list, laenge);
insert_sort(list, laenge, "insert_sort_random_");
fill_desc(list, laenge);
insert_sort(list, laenge, "insert_sort_desc_");

fill_random(list, laenge);
select_sort(list, laenge, "select_sort_random_");
fill_desc(list, laenge);
select_sort(list, laenge, "select_sort_desc_");


@*1 Das Hauptprogramm.

@c
#include<stdlib.h>
#include<stdio.h>
#include<time.h>
#include<string.h>

@<writelist@>@;
@<Auswertung@>@;
@<Bubblesort@>@;
@<Insertsort@>@;
@<Selectsort@>@;
@<fillrandom@>@;
@<filldesc@>@;

int main(){
	int list[101];
	int laenge = 101;
	srand(time(NULL));
	@<executeSortalgorithms@>@;
    return(0);
}

@t\newpage@>
@** Index.
