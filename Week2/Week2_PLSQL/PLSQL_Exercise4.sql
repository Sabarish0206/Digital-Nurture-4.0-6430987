CREATE OR REPLACE FUNCTION CalculateAge (
    p_dob IN DATE
) RETURN NUMBER IS
    v_age NUMBER;
BEGIN
    v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, p_dob) / 12);
    RETURN v_age;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('❌ Error calculating age: ' || SQLERRM);
        RETURN NULL;
END;
/

SELECT Name, DOB, CalculateAge(DOB) AS Age
FROM Customers;


CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    p_loan_amount   IN NUMBER,
    p_annual_rate   IN NUMBER,
    p_years         IN NUMBER
) RETURN NUMBER IS
    v_monthly_rate NUMBER;
    v_n            NUMBER;
    v_emi          NUMBER;
BEGIN
    v_monthly_rate := p_annual_rate / (12 * 100); -- Convert annual % to monthly rate
    v_n := p_years * 12; -- Total number of months

    v_emi := (p_loan_amount * v_monthly_rate * POWER(1 + v_monthly_rate, v_n)) /
             (POWER(1 + v_monthly_rate, v_n) - 1);

    RETURN ROUND(v_emi, 2);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('❌ Error calculating EMI: ' || SQLERRM);
        RETURN NULL;
END;
/

SELECT CalculateMonthlyInstallment(100000, 8, 5) AS EMI FROM DUAL;



CREATE OR REPLACE FUNCTION HasSufficientBalance (
    p_account_id IN NUMBER,
    p_amount     IN NUMBER
) RETURN BOOLEAN IS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance
    FROM Accounts
    WHERE AccountID = p_account_id;

    RETURN v_balance >= p_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('❌ Error: Account ID not found.');
        RETURN FALSE;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('❌ Unexpected error: ' || SQLERRM);
        RETURN FALSE;
END;
/

DECLARE
    result BOOLEAN;
BEGIN
    result := HasSufficientBalance(1, 500);
    IF result THEN
        DBMS_OUTPUT.PUT_LINE('✅ Sufficient Balance');
    ELSE
        DBMS_OUTPUT.PUT_LINE('❌ Insufficient Balance');
    END IF;
END;
/