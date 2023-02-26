# Elaborato compilatori 

## Esecuzione dei programmi
L'esecuzione di entrambi gli esercizi avviene allo stesso modo:

    eseguire da terminale: 
        lex <file con estensione .l>
        yacc -d <file con estenzione .y>
    
    si generano i seguenti file:
        lex.yy.c
        y.tab.c
        y.tab.h
    
    eseguire da terminale:
        gcc lex.yy.c y.tab.c
    
    si genera il seguente file:
        a.out
    
    eseguire da terminale:
        ./a.out


## Esercizio 1: The taxy way
In questo esercizio dovevamo creare un analizzatore sintattico che fosse in grado di riconoscere dei movimenti all'interno del piano cartesiano, tali movimenti, letti da standard input consistono in singole righe contenenti una sequenza formata da quattro possibili istruzioni:

    UP n
    DOWN n
    RIGHT n
    LEFT n

dove la prima parola indica la direzione lungo gli assi cartesiani e la seconda indica la quantità di passi unitari da compiere in quella direzione.
Il parser, dopo aver controllato che le istruzioni inserite siano valide, effettua lo "spostamento" dal punto in cui ci si trova fino al punto raggiunto con gli spostamenti effettuati.
Lo scopo è quello di raggiungere un punto B da un punto A di partenza inserendo gli spostamenti corretti.

## Esercizio 2: Creazione dell'albero sintattico a partire dalla calcolatrice a notazione infissa 
Per questo esercizio dovevamo prima creare l'analizzatore sintattico per la calcolatrice infissa utilizzando la seguente grammatica:

    E --> E + T | E - T | T
    T --> T * F | T | F | T % F| F
    F --> num | -F | +F | (E)

Dopodichè il compilatore doveva tradurre l'input fornito tramite standard input in un albero sintattico.
Un esempio di input --> output è il seguente:

    input: +25 * -(2 - 3)
    output: *
                (+)
                    25
                (-)
                    -
                        2
                        3

Si può notare come gli operatori unari siano racchiusi tra parentesi e che l'output sia indentato utilizzando una spaziatura precisa, ovvero tutti i nodi allo stesso livello hanno lo stesso numero di spazi.