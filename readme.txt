Acest mic proiect in assembly are ca scop o posibila rezolvare a temei de laborator corespunzatoare cursului de Sisteme cu Microprocesoare (SMP) sustinut de Radu Pietraru in cadrul Facultatii de Automatica si Calculatoare, UPB.

———————————<Cerinte tema>———————— 

Enunț

Scrieți un program în limbaj de asamblare, la liberă alegere.

Temele se vor încărca pe Moodle și se vor prezenta la laborator în săptămâna a 8-a.

Criterii de notare

Mediul de programare/execuție:
- program x86 pe 16 biți în EMU8086: 1p
- SAU program x86 pe 32 biți (orice mediu de programare, de exemplu masm32, nasm,
gcc/gas, flat, jwasm, pe orice sistem de operare): 2p
- SAU program x86-64 (orice mediu de programare, orice sistem de operare): 3p
- SAU program x86 pe 16 biți cu încărcare din bootloader: 2p
- SAU program x86 pe 32/64 biți cu încărcare din bootloader: 3p

Tastatura:
- pentru introducere valori (scanf, textbox): 1p
- SAU în regim interactiv (joc, navigare meniu, taste de tip shortcut): 2p

Grafică:
- grafică simplă 2D: 2p
- SAU grafică simplă 3D: 3p

Alte funcții:
- animație: 1p
- utilizare mouse sau touchscreen: 1p
- sunet: 1p
- calcule matematice / logica complexa: 1p (2p pentru calcule de complexitate ridicată)
- acces disc/rețea/usb/bluetooth: 1p pentru fiecare periferic
- utilizare set instrucțiuni extinse: MMX, SSE*, AVX, etc: 1p
- utilizare instrucțiuni speciale (CPUID, RDTSC, RDPMC, etc): 1p
- optimizare cod (cu benchmark și comparație cu versiunea in C): 2p
- lista este deschisă (puteți veni cu propuneri)

Nefuncționale:
- comentarii/indentare: 1p (2p pentru programe foarte bine documentate)
- utilizare sistem de control al versiunilor (exemplu: mercurial, git): 1p
- aducerea temei mai devreme de săptămâna a 8-a: 1p
- originalitate: 1p (teme cu adevarat originale, nu doar necopiate)

Penalizări:
- întârziere: 2p / săptămână
- teme copiate (de la alt student sau din alte surse): se împarte nota la numărul de copii identificate

Se poate lucra în echipă; în acest caz, nota se împarte la numărul de membri ai echipei (cu alte cuvinte, va trebui să alegeți un o temă mai complexă care să vă aducă un punctaj mai mare - aproape de 20).

Nota maximă:
- 12 daca nu se specifică altfel
- 10 / numarul de teme aproape identice (doar pentru teme copiate, nu și pentru lucrul în echipă)
- 3 daca programul nu funcționează
- 5 daca programul pare să funcționeze, dar este inutilizabil din cauza erorilor

Nota de la laborator se calculează astfel: 75% tema, 25% prezența în primele 7
săptămâni.

Exemple

- un student care se mulțumește cu nota 5 și are 5 prezențe în primele 7 săptămâni își poate alege să scrie un program care să deseneze o căsuță in EMU8086, obținând 4 puncte (1p EMU8086 + 2p grafică + 1p comentarii/indentare). Nota la laborator va fi (5*10/7 + 4*3)/4 = 4.79 => 5.

- un student care dorește nota 10 și are 5 prezențe în primele 7 săptămâni își poate alege o temă pe care să obțină 11 puncte. În acest caz, nota va fi: (5*10/7 + 11*3)/4 = 10.

- un program care desenează graficul unei funcții poate primi:
  1p (EMU8086) + 2p (grafica) + 1p (calcule matematice) + 1p (comentarii/indentare) = 5
- același program poate primi nota 6 dacă funcția are parametri introduși de la tastatură (+1p) sau dacă poate fi selectată dintr-un meniu simplu de tip text (+1p)
- același program poate primi nota 7 dacă funcția poate fi selectată dintr-un meniu navigabil cu tastele săgeți (+2p)
- același program poate primi nota 10 dacă este implementat sub Windows/Mac/Linux pe
64 biți (+2p), funcția poate fi selectată din meniu (+2p) și se poate face zoom cu
mouse-ul (+1p).

- un joc în mod text de tip X și 0 poate primi:
  1p (EMU8086) + 1p (logică joc) + 2p (navigare cu săgeți) + 1p (comentarii/indentare) = 5

- un joc în mod grafic de tip Space Invaders poate primi:
  1p (EMU8086) + 2p (grafică 2D) + 1p (animație) + 1p (logică joc) + 2p (taste joc) + 1p (comentarii/indentare) = 8
- același joc, dar în mod text, poate primi nota 6 (se pierde punctajul pentru grafică, dar se pastrează cel pentru animație)
- același joc poate primi nota 10 daca este implementat pe Win32 (+1p) și se poate juca și cu mouse-ul, pe lângă tastatură (+1p)

Succes!

———————————</Cerinte tema>———————— 