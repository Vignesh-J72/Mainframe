       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRADEEVAL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SCORE         PIC 9(3) VALUE 0.
          88 SCORE-INVALID VALUE 101 THRU 999.
          88 GRADE-A       VALUE 90 THRU 100.
          88 GRADE-B       VALUE 75 THRU 89.
          88 GRADE-C       VALUE 60 THRU 74.
          88 GRADE-FAIL    VALUE 0 THRU 59.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Enter score (0-100): ".
           ACCEPT WS-SCORE.
           EVALUATE TRUE
               WHEN SCORE-INVALID
                   DISPLAY "Error: Score must be 0 to 100."
               WHEN GRADE-A
                   DISPLAY "Result: Grade A"
               WHEN GRADE-B
                   DISPLAY "Result: Grade B"
               WHEN GRADE-C
                   DISPLAY "Result: Grade C"
               WHEN GRADE-FAIL
                   DISPLAY "Result: Needs Improvement"
               WHEN OTHER
                   DISPLAY "Result: Unknown"
           END-EVALUATE.
           STOP RUN.
           