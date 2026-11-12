       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRAYSTATS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SALES-TABLE.
          05 WS-DAY-SALE   PIC 9(5) OCCURS 5 TIMES.
       01 WS-I             PIC 9(2) VALUE 0.
       01 WS-TOTAL         PIC 9(7) VALUE 0.
       01 WS-MAX           PIC 9(5) VALUE 0.
       01 WS-MIN           PIC 9(5) VALUE 99999.

       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 1200 TO WS-DAY-SALE(1).
           MOVE 1850 TO WS-DAY-SALE(2).
           MOVE 950  TO WS-DAY-SALE(3).
           MOVE 2400 TO WS-DAY-SALE(4).
           MOVE 1600 TO WS-DAY-SALE(5).

           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
               ADD WS-DAY-SALE(WS-I) TO WS-TOTAL
               IF WS-DAY-SALE(WS-I) > WS-MAX
                   MOVE WS-DAY-SALE(WS-I) TO WS-MAX
               END-IF
               IF WS-DAY-SALE(WS-I) < WS-MIN
                   MOVE WS-DAY-SALE(WS-I) TO WS-MIN
               END-IF
           END-PERFORM.

           DISPLAY "Total Sales: " WS-TOTAL.
           DISPLAY "Peak Day   : " WS-MAX.
           DISPLAY "Lowest Day : " WS-MIN.
           STOP RUN.
           