       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEQWRITE.

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

       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN OUTPUT LOG-FILE.
           IF WS-FS NOT = "00"
               DISPLAY "Open failed. Status: " WS-FS
               STOP RUN
           END-IF.

           MOVE "101|BACKUP_DB|OK" TO LOG-RECORD.
           WRITE LOG-RECORD.
           MOVE "102|SYNC_LOGS|OK" TO LOG-RECORD.
           WRITE LOG-RECORD.
           MOVE "103|CLEAN_TEMP|WARN" TO LOG-RECORD.
           WRITE LOG-RECORD.

           CLOSE LOG-FILE.
           DISPLAY "Wrote 3 records to tasks.dat".
           STOP RUN.
           