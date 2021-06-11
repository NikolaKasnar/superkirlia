# Super Kirlia
Super Mario - like simple game, original at https://github.com/valucij/Super-Kirlia

Dorađeni projekt iz kolegija Multimedijski sustavi.
(Improved project assignment from the lecture on Multimedia Sytems at of PMF-Mathemathics, University of Zagreb)\

**Opis implementacije**\
HR: Implementirat ću platformsku igru, nešto nalik na igru Super Mario. Ime glavnog lika će biti Kirlia, a cilj igre će biti skupiti sve novčiće i izbjegavati neprijatelje, te tako uspješno završiti sve razine. Svaka razina će imati svoju temu, i svi likovi/neprijatelji će biti ručno nacrtani u nekom programu. Implementacija će biti izvršena u Processingu (minimalno verzija 3) sa popratnom dokumentacijom. 

ENG: This is an implementation of a game similar to Super Mario, made using Processing (minimal ver. 3 required). The project is named after Kirlia (the Pokemon character), and to win the character must collect coins and avoid enemies, and sucessfully finish all the levels. 
All the characters/backgrounds in the game are hand drawn, with the drawing videos accessible in /Dokumentacija zip file. 



**Dokumentacija**\
Videi.zip\
*Sadrži videe procesa crtanja pozadina/likova za igru.* 

main.tex\
*Latex file za .pdf dokumentaciju.*

Multimedijski_sustavi.pdf\
*Službena .pdf dokumentacija kolegice L.Valentić (https://github.com/valucij) koja je prva osmislila projekt.* 

Super_Kirlia_dorada.docx\
*Detaljan opis dorade projekta izveden od strane I. Tutiš.* 

**SuperKirlia - code**\
Main\
*Glavni dio koda u processingu, uključuje deklaraciju objekata; load slika/zvukova, kao i klasične funkcije setup() i draw().*

Button\
*Klasa koja predstavlja gumb. Klasa je abstraktna, što znači da se u glavnom programu treba napraviti konkretan razred koji govori što će taj gumb raditi. Naravno, da bi gumb radio, treba imati funkcije koje govore što se događa kad se klikne mišem, a u glavnom programu u funkciji mousePressed() se treba pozvati ista ta funkcija, ali od gumba.*

ButtonMenu\
*Klasa koja nasljeđuje klasu Button, predstavlja gumb na koji - kada kliknemo - pokreće igru.*

ButtonExit\
*Klasa koja nasljeđuje klasu Button, predstavlja gumb na koji - kada kliknemo - omogućuje izlazak iz igre.* 

Character\
*Klasa predstavlja lika prostoru. Taj lik ima koordinate, tj položaj na kojem se nalazi, visinu, širinu, i može se kretati. Klase Kirlia i Enemy nasljeđuju upravo ovu klasu.*

Kirlia\
*Klasa koja predstavlja lika, glavnog lika kojeg igrač upravlja. Zato ta klasa ima funkcije koje se bave kretanjem, skakanjem, i pritiskanjem strelica, ili slova 'ASWD'.*

Enemy\
*Klasa koja predstavlja neprijatelja, te se objekti te klase same pokreću. Poslije konstrukcije jednog takvog objekta, može se točno definirati koliko je taj lik širok, visok, koliko se daleko može kretati, kako će izgledati i ostalo.*

Coin\
*Klasa predstavlja novčić kojeg Kirlia mora skupiti. Ovo je relativno jednostavno klasa.*

Point\
*Klasa predstavlja točku, ili točnije vektor od 2 dimenzije.*

Rectangle\
*Klasa predstavlja platformu po kojoj Kirlia može hodati. Ime je možda nezgodno, ali to ime je dano jer platforme nalikuju na pravokutnike.*
 
Level\
*Ovo je klasa koja ima najviše funkcija, i klasa koja ima najbitnije funkcije. Klasa se brine da cijela igra funkcionira kako spada. Ova klasa omogućava kretanje lika, skakanje lika, skupljanje novčića i ostalo.*

InputControl\
*Ovo je skup funkcija koje opisuju respons programa na.*
- *Pritisak tipki na tipkovnici koje u igrama klasično opisuju kretanje*
- *Otpuštanje tipki na tipkovnici koje u igrama klasično opisuju kretanje*
- *Klik mišem*

data\
*Datoteka koja sadrži slike i zvukove koji se učitavaju.*

**Prijedlog daljnjih poboljšanja**  
1. Dodavanje barem još jednog levela
  
2. Dodavanje nove pozadine i mogućnost mjenjanja pozadine
  
3. Drugačije organiziranje koda
  
4. Korištenje Box2d biblioteke 
  
5. Dodavanje još nekoliko različitih vrsta neprijatelja
  
6. Dodavanje mogućnosti skupljanja novčića različitih vrijednosti
  
7. Dodavanje mogućnost borbe protiv neprijatelja
  
8. Dodavanje gumba koji vraća igrača iz levela na početni zaslon
  
9. Dodavanje multiplayera
  
10. Prikazivanje broja bodova i života na kraju igre
  
11. Dodavanje dodatnog menija koji potvrđuje da želimo izaći iz igre (npr. pita korisnika "Are you sure you want to exit?" sa opcijama "Cancel" i "Yes, exit!")
12. ...
