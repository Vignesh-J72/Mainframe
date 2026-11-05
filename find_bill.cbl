       IDENTIFICATION DIVISION.
       PROGRAM-ID. BILLCALC.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-QTY           PIC 9(3) VALUE 0.
       01 WS-PRICE         PIC 9(5)V99 VALUE 0.
       01 WS-SUBTOTAL      PIC 9(7)V99 VALUE 0.
       01 WS-TAX           PIC 9(6)V99 VALUE 0.
       01 WS-GRAND-TOTAL   PIC 9(7)V99 VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Enter quantity: ".
           ACCEPT WS-QTY.
           DISPLAY "Enter unit price: ".
           ACCEPT WS-PRICE.

           COMPUTE WS-SUBTOTAL = WS-QTY * WS-PRICE.
           COMPUTE WS-TAX ROUNDED = WS-SUBTOTAL * 0.18.
           COMPUTE WS-GRAND-TOTAL = WS-SUBTOTAL + WS-TAX.

           DISPLAY "Subtotal   : " WS-SUBTOTAL.
           DISPLAY "Tax (18%)  : " WS-TAX.
           DISPLAY "Grand Total: " WS-GRAND-TOTAL.
           STOP RUN.
           