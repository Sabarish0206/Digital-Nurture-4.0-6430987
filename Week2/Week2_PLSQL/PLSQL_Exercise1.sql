CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    IsVIP VARCHAR2(5),
    LastModified DATE
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER,
    InterestRate NUMBER,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers VALUES (1, 'Gokul', TO_DATE('1950-04-10','YYYY-MM-DD'), 12000, 'FALSE', SYSDATE);
INSERT INTO Customers VALUES (2, 'Ravi', TO_DATE('1995-06-15','YYYY-MM-DD'), 9000, 'FALSE', SYSDATE);

INSERT INTO Loans VALUES (101, 1, 5000, 7.5, SYSDATE - 1000, SYSDATE + 15);
INSERT INTO Loans VALUES (102, 2, 6000, 6.0, SYSDATE - 800, SYSDATE + 60);

BEGIN
  FOR cust IN (
    SELECT CustomerID, DOB
    FROM Customers
  ) LOOP
    IF MONTHS_BETWEEN(SYSDATE, cust.DOB) / 12 > 60 THEN
      UPDATE Loans
      SET InterestRate = InterestRate - 1
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE('Discount applied for Customer ID: ' || cust.CustomerID);
    END IF;
  END LOOP;
  COMMIT;
END;
/


BEGIN
  FOR rec IN (
    SELECT CustomerID, Balance
    FROM Customers
  ) LOOP
    IF rec.Balance > 10000 THEN
      UPDATE Customers
      SET IsVIP = 'TRUE'
      WHERE CustomerID = rec.CustomerID;

      DBMS_OUTPUT.PUT_LINE('VIP Marked for Customer ID: ' || rec.CustomerID);
    END IF;
  END LOOP;
  COMMIT;
END;
/


BEGIN
  FOR loan IN (
    SELECT CustomerID, EndDate
    FROM Loans
    WHERE EndDate BETWEEN SYSDATE AND SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Customer ID ' || loan.CustomerID || 
                         ' loan is due on ' || TO_CHAR(loan.EndDate, 'DD-MON-YYYY'));
  END LOOP;
END;
/