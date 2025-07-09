package com.example.junitapp;

import org.junit.Test;
import static org.junit.Assert.*;

class Calculator {
    public int add(int a, int b) {
        return a + b;
    }
}

public class CalculatorTest {

    @Test
    public void testAdd() {
        Calculator calc = new Calculator();
        int result = calc.add(10, 20);
        assertEquals(30, result);
    }
}
