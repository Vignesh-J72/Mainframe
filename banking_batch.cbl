       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKBATCH.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-TRANSACTION.
          05 WS-ID            PIC X(10).
          05 WS-ACCOUNT       PIC X(10).
          05 WS-TYPE          PIC X.
          05 WS-AMOUNT        PIC 9(9) VALUE 0.

       01 WS-EXPECTED-COUNT   PIC 9(4) VALUE 0.
       01 WS-EXPECTED-AMT     PIC 9(12) VALUE 0.

       01 WS-ACTUAL-COUNT     PIC 9(4) VALUE 0.
       01 WS-ACTUAL-AMT       PIC 9(12) VALUE 0.

       01 WS-REJECT-COUNT     PIC 9(4) VALUE 0.
       01 WS-AUDIT-COUNT      PIC 9(4) VALUE 0.

       01 WS-CHOICE           PIC X VALUE "Y".
       01 WS-VALID            PIC X VALUE "N".
       01 WS-REASON           PIC X(30) VALUE SPACES.

       01 WS-RETURN-CODE      PIC 99 VALUE 0.
       01 WS-INDEX            PIC 9(4) VALUE 0.

       01 WS-POSTED-COUNT     PIC 9(4) VALUE 0.

       01 WS-REPORT-STATUS    PIC X(20) VALUE SPACES.

       PROCEDURE DIVISION.

       MAIN-PROCESS.

           DISPLAY "=================================="
           DISPLAY "     DAILY BANKING BATCH SYSTEM"
           DISPLAY "=================================="

           DISPLAY "Enter expected transaction count:"
           ACCEPT WS-EXPECTED-COUNT

           DISPLAY "Enter expected total amount in cents:"
           ACCEPT WS-EXPECTED-AMT

           PERFORM UNTIL WS-CHOICE = "N" OR WS-CHOICE = "n"

               DISPLAY " "
               DISPLAY "Enter transaction ID:"
               ACCEPT WS-ID

               DISPLAY "Enter account number:"
               ACCEPT WS-ACCOUNT

               DISPLAY "Enter transaction type (C/D):"
               ACCEPT WS-TYPE

               DISPLAY "Enter amount in cents:"
               ACCEPT WS-AMOUNT

               PERFORM VALIDATE-TRANSACTION

               IF WS-VALID = "Y"
                   PERFORM POST-TRANSACTION
               ELSE
                   PERFORM REJECT-TRANSACTION
               END-IF

               ADD 1 TO WS-AUDIT-COUNT

               DISPLAY " "
               DISPLAY "Add another transaction? (Y/N)"
               ACCEPT WS-CHOICE

           END-PERFORM

           PERFORM RECONCILE-TOTALS
           PERFORM GENERATE-REPORT
           PERFORM DISPLAY-RESULTS

           GOBACK.

       VALIDATE-TRANSACTION.

           MOVE "Y" TO WS-VALID
           MOVE SPACES TO WS-REASON

           IF WS-ID = SPACES
               MOVE "N" TO WS-VALID
               MOVE "INVALID TRANSACTION ID" TO WS-REASON
           END-IF

           IF WS-ACCOUNT = SPACES
               MOVE "N" TO WS-VALID
               MOVE "INVALID ACCOUNT" TO WS-REASON
           END-IF

           IF WS-TYPE NOT = "C" AND WS-TYPE NOT = "D"
               MOVE "N" TO WS-VALID
               MOVE "INVALID TYPE" TO WS-REASON
           END-IF

           IF WS-AMOUNT = 0
               MOVE "N" TO WS-VALID
               MOVE "INVALID AMOUNT" TO WS-REASON
           END-IF.

       POST-TRANSACTION.

           ADD 1 TO WS-ACTUAL-COUNT
           ADD WS-AMOUNT TO WS-ACTUAL-AMT
           ADD 1 TO WS-POSTED-COUNT

           DISPLAY "TRANSACTION POSTED SUCCESSFULLY"
           DISPLAY "AUDIT: " WS-ID " POSTED".

       REJECT-TRANSACTION.

           ADD 1 TO WS-REJECT-COUNT

           DISPLAY "TRANSACTION REJECTED"
           DISPLAY "REASON: " WS-REASON
           DISPLAY "AUDIT: " WS-ID " REJECTED".

       RECONCILE-TOTALS.

           DISPLAY " "
           DISPLAY "========== RECONCILIATION =========="

           DISPLAY "EXPECTED COUNT: " WS-EXPECTED-COUNT
           DISPLAY "ACTUAL COUNT  : " WS-ACTUAL-COUNT

           DISPLAY "EXPECTED AMOUNT: " WS-EXPECTED-AMT
           DISPLAY "ACTUAL AMOUNT  : " WS-ACTUAL-AMT

           IF WS-ACTUAL-COUNT NOT = WS-EXPECTED-COUNT
               MOVE 8 TO WS-RETURN-CODE
               DISPLAY "COUNT MISMATCH"
           END-IF

           IF WS-ACTUAL-AMT NOT = WS-EXPECTED-AMT
               MOVE 8 TO WS-RETURN-CODE
               DISPLAY "AMOUNT MISMATCH"
           END-IF

           IF WS-ACTUAL-COUNT = WS-EXPECTED-COUNT
              AND WS-ACTUAL-AMT = WS-EXPECTED-AMT
               DISPLAY "RECONCILIATION SUCCESSFUL"
           END-IF.

       GENERATE-REPORT.

           DISPLAY " "
           DISPLAY "========== DAILY BATCH REPORT =========="
           DISPLAY "TOTAL POSTED     : " WS-POSTED-COUNT
           DISPLAY "TOTAL REJECTED   : " WS-REJECT-COUNT
           DISPLAY "TOTAL AUDIT ENTRIES: " WS-AUDIT-COUNT
           DISPLAY "TOTAL AMOUNT     : " WS-ACTUAL-AMT

           IF WS-RETURN-CODE = 8
               MOVE "FAILED" TO WS-REPORT-STATUS
           ELSE
               MOVE "SUCCESSFUL" TO WS-REPORT-STATUS
           END-IF

           DISPLAY "RECONCILIATION   : " WS-REPORT-STATUS.

       DISPLAY-RESULTS.

           IF WS-RETURN-CODE = 8
               DISPLAY "BATCH FAILED - RECONCILIATION ERROR"
           ELSE
               IF WS-REJECT-COUNT > 0
                   MOVE 4 TO WS-RETURN-CODE
                   DISPLAY "BATCH COMPLETED WITH REJECTIONS"
               ELSE
                   DISPLAY "BATCH COMPLETED SUCCESSFULLY"
               END-IF
           END-IF

           DISPLAY "JOB RETURN CODE: " WS-RETURN-CODE

           MOVE WS-RETURN-CODE TO RETURN-CODE.
           