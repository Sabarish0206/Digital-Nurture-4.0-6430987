CREATE OR REPLACE PACKAGE CustomerManagement IS
  PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_dob DATE, p_balance NUMBER);
  PROCEDURE UpdateCustomerDetails(p_id NUMBER, p_name VARCHAR2, p_balance NUMBER);
  FUNCTION GetCustomerBalance(p_id NUMBER) RETURN NUMBER;
END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement IS

  PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_dob DATE, p_balance NUMBER) IS
  BEGIN
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (p_id, p_name, p_dob, p_balance, SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Customer added successfully.');
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE('Customer already exists.');
  END;

  PROCEDURE UpdateCustomerDetails(p_id NUMBER, p_name VARCHAR2, p_balance NUMBER) IS
  BEGIN
    UPDATE Customers
    SET Name = p_name,
        Balance = p_balance,
        LastModified = SYSDATE
    WHERE CustomerID = p_id;

    DBMS_OUTPUT.PUT_LINE('Customer details updated.');
  END;

  FUNCTION GetCustomerBalance(p_id NUMBER) RETURN NUMBER IS
    v_balance NUMBER;
  BEGIN
    SELECT Balance INTO v_balance FROM Customers WHERE CustomerID = p_id;
    RETURN v_balance;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
  END;

END CustomerManagement;
/

BEGIN
  CustomerManagement.AddCustomer(3, 'Ravi Kumar', TO_DATE('1995-08-10','YYYY-MM-DD'), 2000);
  DBMS_OUTPUT.PUT_LINE('Balance: ' || CustomerManagement.GetCustomerBalance(3));
END;
/




CREATE OR REPLACE PACKAGE EmployeeManagement IS
  PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2, p_hire DATE);
  PROCEDURE UpdateEmployeeDetails(p_id NUMBER, p_salary NUMBER, p_position VARCHAR2);
  FUNCTION CalculateAnnualSalary(p_id NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement IS

  PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2, p_hire DATE) IS
  BEGIN
    INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
    VALUES (p_id, p_name, p_position, p_salary, p_dept, p_hire);
    DBMS_OUTPUT.PUT_LINE('Employee hired successfully.');
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE('Employee already exists.');
  END;

  PROCEDURE UpdateEmployeeDetails(p_id NUMBER, p_salary NUMBER, p_position VARCHAR2) IS
  BEGIN
    UPDATE Employees
    SET Salary = p_salary,
        Position = p_position
    WHERE EmployeeID = p_id;
    DBMS_OUTPUT.PUT_LINE('Employee updated.');
  END;

  FUNCTION CalculateAnnualSalary(p_id NUMBER) RETURN NUMBER IS
    v_salary NUMBER;
  BEGIN
    SELECT Salary INTO v_salary FROM Employees WHERE EmployeeID = p_id;
    RETURN v_salary * 12;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
  END;

END EmployeeManagement;
/

BEGIN
  EmployeeManagement.HireEmployee(
    p_id        => 3,
    p_name      => 'Rohit Sharma',
    p_position  => 'Analyst',
    p_salary    => 55000,
    p_dept      => 'Finance',
    p_hire      => TO_DATE('2020-10-01', 'YYYY-MM-DD')
  );
END;
/

BEGIN
  EmployeeManagement.UpdateEmployeeDetails(
    p_id        => 3,
    p_salary    => 60000,
    p_position  => 'Senior Analyst'
  );
END;
/

DECLARE
  annual_salary NUMBER;
BEGIN
  annual_salary := EmployeeManagement.CalculateAnnualSalary(3);
  DBMS_OUTPUT.PUT_LINE('Annual Salary: ₹' || annual_salary);
END;
/



CREATE OR REPLACE PACKAGE AccountOperations IS
  PROCEDURE OpenAccount(p_acc_id NUMBER, p_cust_id NUMBER, p_type VARCHAR2, p_balance NUMBER);
  PROCEDURE CloseAccount(p_acc_id NUMBER);
  FUNCTION GetTotalBalanceByCustomer(p_cust_id NUMBER) RETURN NUMBER;
END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations IS

  PROCEDURE OpenAccount(p_acc_id NUMBER, p_cust_id NUMBER, p_type VARCHAR2, p_balance NUMBER) IS
  BEGIN
    INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
    VALUES (p_acc_id, p_cust_id, p_type, p_balance, SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Account opened.');
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE('Account already exists.');
  END;

  PROCEDURE CloseAccount(p_acc_id NUMBER) IS
  BEGIN
    DELETE FROM Accounts WHERE AccountID = p_acc_id;
    DBMS_OUTPUT.PUT_LINE('Account closed.');
  END;

  FUNCTION GetTotalBalanceByCustomer(p_cust_id NUMBER) RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    SELECT NVL(SUM(Balance), 0) INTO v_total FROM Accounts WHERE CustomerID = p_cust_id;
    RETURN v_total;
  END;

END AccountOperations;
/

BEGIN
  AccountOperations.OpenAccount(3, 3, 'Savings', 3000);
  DBMS_OUTPUT.PUT_LINE('Total: ' || AccountOperations.GetTotalBalanceByCustomer(3));
END;
/

DECLARE
  total_balance NUMBER;
BEGIN
  total_balance := AccountOperations.GetTotalBalanceByCustomer(1);
  DBMS_OUTPUT.PUT_LINE('Total Balance for Customer ID 1: ₹' || total_balance);
END;
/