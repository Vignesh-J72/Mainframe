       IDENTIFICATION DIVISION.
       PROGRAM-ID. AGECHECK.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AGE           PIC 9(3) VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Enter your age: ".
           ACCEPT WS-AGE.

           IF WS-AGE >= 18
               DISPLAY "Status: Eligible (18 or older)."
           ELSE
               DISPLAY "Status: Underage."
           END-IF.

           STOP RUN.
