       IDENTIFICATION DIVISION.
       PROGRAM-ID. SWAPNUMS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A             PIC 9(4) VALUE 15.
       01 WS-B             PIC 9(4) VALUE 42.
       01 WS-TEMP          PIC 9(4) VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Before swap -> A: " WS-A " B: " WS-B.
           MOVE WS-A TO WS-TEMP.
           MOVE WS-B TO WS-A.
           MOVE WS-TEMP TO WS-B.
           DISPLAY "After swap  -> A: " WS-A " B: " WS-B.
           STOP RUN.
           