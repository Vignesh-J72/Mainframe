       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOOPACCUM.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-N             PIC 9(2) VALUE 5.
       01 WS-IDX           PIC 9(2) VALUE 0.
       01 WS-ENTRY         PIC S9(5) VALUE 0.
       01 WS-SUM           PIC S9(7) VALUE 0.
       01 WS-AVG           PIC S9(5)V99 VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Enter 5 integer numbers:".
           PERFORM VARYING WS-IDX FROM 1 BY 1
               UNTIL WS-IDX > WS-N
               DISPLAY "Number " WS-IDX ": "
               ACCEPT WS-ENTRY
               ADD WS-ENTRY TO WS-SUM
           END-PERFORM.
           COMPUTE WS-AVG ROUNDED = WS-SUM / WS-N.
           DISPLAY "Total Sum: " WS-SUM.
           DISPLAY "Average  : " WS-AVG.
           STOP RUN. 
