CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  FOR acc IN (
    SELECT AccountID, Balance
    FROM Accounts
    WHERE AccountType = 'Savings'
  ) LOOP
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01),
        LastModified = SYSDATE
    WHERE AccountID = acc.AccountID;

    DBMS_OUTPUT.PUT_LINE('✅ Interest added to Account ID: ' || acc.AccountID);
  END LOOP;

  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('❌ Error applying interest: ' || SQLERRM);
    ROLLBACK;
END;
/

BEGIN
  ProcessMonthlyInterest;
END;
/

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
) AS
BEGIN
  UPDATE Employees
  SET Salary = Salary + (Salary * p_bonus_percent / 100)
  WHERE Department = p_department;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('✅ Bonus applied for department: ' || p_department);

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('❌ Error applying bonus: ' || SQLERRM);
    ROLLBACK;
END;
/

BEGIN
  UpdateEmployeeBonus('IT', 10);
END;
/

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_from_account_id IN NUMBER,
    p_to_account_id   IN NUMBER,
    p_amount          IN NUMBER
) AS
    v_balance NUMBER;
BEGIN
  SELECT Balance INTO v_balance
  FROM Accounts
  WHERE AccountID = p_from_account_id
  FOR UPDATE;

  IF v_balance < p_amount THEN
    DBMS_OUTPUT.PUT_LINE('❌ Error: Insufficient balance in Account ' || p_from_account_id);
    RETURN;
  END IF;

  -- Debit source account
  UPDATE Accounts
  SET Balance = Balance - p_amount,
      LastModified = SYSDATE
  WHERE AccountID = p_from_account_id;

  -- Credit destination account
  UPDATE Accounts
  SET Balance = Balance + p_amount,
      LastModified = SYSDATE
  WHERE AccountID = p_to_account_id;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('✅ Transfer successful from ' || p_from_account_id || ' to ' || p_to_account_id);

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('⚠️ Transfer failed: ' || SQLERRM);
    ROLLBACK;
END;
/

BEGIN
  TransferFunds(1, 2, 500);
END;
/