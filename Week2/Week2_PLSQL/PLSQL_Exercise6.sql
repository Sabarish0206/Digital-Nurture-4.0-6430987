DECLARE
  CURSOR txn_cursor IS
    SELECT c.CustomerID, c.Name, t.AccountID, t.TransactionDate, t.Amount, t.TransactionType
    FROM Customers c
    JOIN Accounts a ON c.CustomerID = a.CustomerID
    JOIN Transactions t ON a.AccountID = t.AccountID
    WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
      AND EXTRACT(YEAR FROM t.TransactionDate) = EXTRACT(YEAR FROM SYSDATE)
    ORDER BY c.CustomerID, t.TransactionDate;

  v_txn txn_cursor%ROWTYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Monthly Transaction Statements');
  OPEN txn_cursor;
  LOOP
    FETCH txn_cursor INTO v_txn;
    EXIT WHEN txn_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(
      'Customer: ' || v_txn.Name || ' | Account: ' || v_txn.AccountID ||
      ' | Date: ' || TO_CHAR(v_txn.TransactionDate, 'DD-MON-YYYY') ||
      ' | ₹' || v_txn.Amount || ' (' || v_txn.TransactionType || ')'
    );
  END LOOP;
  CLOSE txn_cursor;
END;
/


DECLARE
  CURSOR acc_cursor IS
    SELECT AccountID, Balance FROM Accounts;

  v_acc acc_cursor%ROWTYPE;
BEGIN
  OPEN acc_cursor;
  LOOP
    FETCH acc_cursor INTO v_acc;
    EXIT WHEN acc_cursor%NOTFOUND;

    UPDATE Accounts
    SET Balance = Balance - 100,
        LastModified = SYSDATE
    WHERE AccountID = v_acc.AccountID;

    DBMS_OUTPUT.PUT_LINE('₹100 annual fee deducted from Account ID: ' || v_acc.AccountID);
  END LOOP;
  CLOSE acc_cursor;
  COMMIT;
END;
/


DECLARE
  CURSOR loan_cursor IS
    SELECT LoanID, InterestRate FROM Loans;

  v_loan loan_cursor%ROWTYPE;
BEGIN
  OPEN loan_cursor;
  LOOP
    FETCH loan_cursor INTO v_loan;
    EXIT WHEN loan_cursor%NOTFOUND;

    IF v_loan.InterestRate < 6 THEN
      UPDATE Loans
      SET InterestRate = InterestRate + 0.5
      WHERE LoanID = v_loan.LoanID;

      DBMS_OUTPUT.PUT_LINE('Loan ID ' || v_loan.LoanID || ' interest increased to ' || (v_loan.InterestRate + 0.5));
    END IF;
  END LOOP;
  CLOSE loan_cursor;
  COMMIT;
END;
/