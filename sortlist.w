\def\topofcontents{\centerline{\titlefont\title}%
\centerline{\today}\vskip.7in
\centerline{Name,Vorname,infXXXX,Matrikelnummer}
  \vfill} % this material will start the table of contents page

Dies ist vor dem ersten at at-c
@ @c

@** Das Grundgeruest.
Das Programm besteht aus drei Teilen: Den einzubindenden Bibliotheken, die Strukturen und Funktionen. Die Funktion int main() wird beim Programmaufruf ausgefuehrt. Diese enthält das Hauptprogramm.
@c

@<Includes@>@;
@<Struktur@>@;
int main (){
@<Hauptprogramm@>@;
}

@*2 Eingebundene Bibliotheken.
Hier sind alle benoetigten Bibliotheken eingebunden. Diese werden vom Compiler beim Compillieren in das Programm integriert.
@<Includes@>=
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

@*2 Struktur.\break
Benoetigt wird ein struct mit den Pointern auf gleichartige structs fuer Vorgaenger und Nachfolger, sowie der Wert.
@<Struktur@>=
struct zahl {
	struct zahl *prev;
	struct zahl *next;
	int wert;
};

@*2 Hauptprogramm. \break
Ueber while-Schleife werden eingegebene Zeichen eingelesen und verarbeitet. Folgt auf einen Buchstaben eine Zahl, wird dies als Befehl interpretiert.
@<Hauptprogramm@>=
@<Deklarationen@>@;
printf(":");
while ((c = getchar()) && c != EOF){
	printf("%c",c);
	if (((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == 10) && b > 0){
		buffer[b] = '\0';
		wert = atoi(buffer);
		strcpy(buffer,"");
		b = 0;
		if (insert){
			@<WertEinfuegen@>@;
		}
		else if (delete){
			@<WertLoeschen@>@;
		}
		insert = 0;
		delete = 0;
		current = start;
		printf("\n");
		i = 0;
		while (current != (struct zahl *)0){
			printf("\t%i",current->wert);
			current = current->next;
			i++;
		}
		printf("\n:");
	}
@<Eingabeauswertung@>@;
}
return 0;


@*3 Deklarationen.\break Hier werden alle benoetigten Variablen, Arrays und Structs deklariert und gegebenenfalls initialisiert.
@<Deklarationen@>=
char c;
int insert = 0;
int delete = 0;
int b = 0;
int wert = 0;
int i = 0;
int fehler = 0;
char buffer[100];
struct zahl *current = (struct zahl *)0, *start = (struct zahl *)0, *temp = (struct zahl *)0, *last = (struct zahl *)0;

@*3 Wert einfuegen. Soll ein Wert eingefuegt werden, wird fuer diesen Speicher angefordert. Anschliessend wird das Element einsortiert.
@<WertEinfuegen@>=
temp = (struct zahl *)malloc (sizeof(struct zahl));
temp->wert = wert;
temp->next = (struct zahl *)0;
temp->prev = (struct zahl *)0;
if (start == (struct zahl *)0){
	start = temp;
}
else {
@<ElementEinsortieren@>@;
}

@*4 Element einsortieren. Mit einer Schliefe wird der passende Ort gesucht, wo das neue Element eingefuegt werden soll.
@<ElementEinsortieren@>=
current = start;
while (current != (struct zahl *)0){
	if (current->wert == temp->wert) break;
	if (current->wert > temp->wert){
		if (current->prev == (struct zahl*)0){
			temp->next = start;
			start->prev = temp;
			start = temp;
		}
		else {
			last = current->prev;
			temp->prev = last;
			last->next = temp;
			temp->next = current;
			current->prev = temp;
		}
		break;
	}
	else if (current->next == (struct zahl *)0) {
		temp->prev = current;
		current->next = temp;
		break;
	}
	current = current->next;
}

@*3 Wert loeschen. Innerhalb der sortierten Liste wird das zu loeschende Element gesucht und aus der Liste abgetrennt.
@<WertLoeschen@>=
current = start;
last = (struct zahl*)0;
while (current != (struct zahl*)0){
	if (current->wert == wert){
		@<ElementLoeschen@>@;
	}
	last = current;
	current = current->next;
}

@*4 Element loeschen. Ist das Element abgetrennt, kann es geloescht werden. Anschliessend kann dessen Speicher freigegeben werden.
@<ElementLoeschen@>=
if (last == (struct zahl *)0){
	if (current->next == (struct zahl *)0){
		start = (struct zahl *)0;
	}
	else {
		start = current->next;
		start->prev = (struct zahl *)0;
	}
	free(current);
	break;
}
else {
	if (current->next == (struct zahl *)0){
		last->next = (struct zahl *)0;
	}
	else {
		last->next = current->next;
		current->next->prev = last;
	}
	free(current);
}

@*3 Eingabeauswertung. Anhand der eingegeben Zeichen werden Steuervariablen gesetzt, welche oben ausgewertet werden.
@<Eingabeauswertung@>=
else if (c == 'Q' || c == 'q' || c == 'X' || c == 'x'){
    break;
}
if (c== 'E' || c == 'e' || c == 'I' || c == 'i'){
	insert = 1; delete = 0;
}
else if (c == 'L' || c == 'l' || c == 'D' || c == 'd'){
	insert = 0; delete = 1;
}
else if ((c >= '0' && c <= '9') || c == '-'){
	buffer[b++] = c;
}
else if (c != 10 && fehler != 1) {
	printf("Anwendung:\n  E,e,I,i Schluessel zum Einfuegen    z.B. e27\n  D,d,L,l Schluessel zum Loeschen    z.B. l27\n  Q,q,X,x zum Beenden\n");
	fehler = 1;
}
fehler = 0;

@** Index.
