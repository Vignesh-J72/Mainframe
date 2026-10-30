       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME          PIC X(20) VALUE SPACES.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Enter your name: ".
           ACCEPT WS-NAME.
           DISPLAY "Welcome to COBOL, " WS-NAME.
           STOP RUN.
           