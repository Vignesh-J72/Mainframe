       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVENODD.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM           PIC 9(5) VALUE 0.
       01 WS-QUOTIENT      PIC 9(5) VALUE 0.
       01 WS-REM           PIC 9(1) VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Enter a positive integer: ".
           ACCEPT WS-NUM.

           DIVIDE WS-NUM BY 2
               GIVING WS-QUOTIENT
               REMAINDER WS-REM.

           IF WS-REM = 0
               DISPLAY WS-NUM " is EVEN."
           ELSE
               DISPLAY WS-NUM " is ODD."
           END-IF.

           STOP RUN.
