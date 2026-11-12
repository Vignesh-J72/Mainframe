       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEQREADREPORT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT LOG-FILE ASSIGN TO "tasks.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       FD  LOG-FILE.
       01  LOG-RECORD      PIC X(40).

       WORKING-STORAGE SECTION.
       01  WS-FS           PIC XX VALUE "00".
       01  WS-EOF          PIC X VALUE "N".
       01  WS-REC-COUNT    PIC 9(4) VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN INPUT LOG-FILE.
           IF WS-FS NOT = "00"
               DISPLAY "Could not open tasks.dat. Status: " WS-FS
               STOP RUN
           END-IF.

           PERFORM UNTIL WS-EOF = "Y"
               READ LOG-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       ADD 1 TO WS-REC-COUNT
                       DISPLAY WS-REC-COUNT ": " LOG-RECORD
               END-READ
           END-PERFORM.

           CLOSE LOG-FILE.
           DISPLAY "Total records read: " WS-REC-COUNT.
           STOP RUN.
           