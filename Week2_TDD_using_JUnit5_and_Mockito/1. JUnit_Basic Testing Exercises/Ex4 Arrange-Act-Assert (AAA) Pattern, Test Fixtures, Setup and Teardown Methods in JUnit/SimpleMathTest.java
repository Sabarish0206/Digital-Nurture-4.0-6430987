package com.example.junitapp;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class SimpleMathTest {

    private SimpleMath math;

    @Before
    public void setUp() {
        math = new SimpleMath();
        System.out.println("Setup: SimpleMath object created");
    }

    @After
    public void tearDown() {
        math = null;
        System.out.println("Teardown: SimpleMath object cleared");
    }

    @Test
    public void testAddition() {
        int a = 12;
        int b = 8;
        int result = math.add(a, b);
        assertEquals(20, result);
    }

    @Test
    public void testSubtraction() {
        int result = math.subtract(15, 6);
        assertEquals(9, result);
    }

    @Test
    public void testMultiplication() {
        int result = math.multiply(4, 5);
        assertEquals(20, result);
    }

    static class SimpleMath {
        public int add(int a, int b) { return a + b; }
        public int subtract(int a, int b) { return a - b; }
        public int multiply(int a, int b) { return a * b; }
    }
}
