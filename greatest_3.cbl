       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAXOFTHREE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N1            PIC S9(5) VALUE 0.
       01 WS-N2            PIC S9(5) VALUE 0.
       01 WS-N3            PIC S9(5) VALUE 0.
       01 WS-LARGEST       PIC S9(5) VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Enter first number: ".
           ACCEPT WS-N1.
           DISPLAY "Enter second number: ".
           ACCEPT WS-N2.
           DISPLAY "Enter third number: ".
           ACCEPT WS-N3.

           MOVE WS-N1 TO WS-LARGEST.
           IF WS-N2 > WS-LARGEST
               MOVE WS-N2 TO WS-LARGEST
           END-IF.
           IF WS-N3 > WS-LARGEST
               MOVE WS-N3 TO WS-LARGEST
           END-IF.

           DISPLAY "Largest number is: " WS-LARGEST.
           STOP RUN.
           