package recursion;

public class Forecasting {

    // Recursive growth prediction (e.g., compound interest-like model)
    public static double predictValue(double currentValue, double growthRate, int years) {
        if (years == 0)
            return currentValue;
        return predictValue(currentValue * (1 + growthRate), growthRate, years - 1);
    }

    // Optimized version using iteration (optional for comparison)
    public static double predictValueIterative(double currentValue, double growthRate, int years) {
        for (int i = 0; i < years; i++) {
            currentValue *= (1 + growthRate);
        }
        return currentValue;
    }

    public static void main(String[] args) {
        double initial = 10000;
        double growthRate = 0.08; // 8% growth
        int years = 5;

        double predicted = predictValue(initial, growthRate, years);
        System.out.println("Predicted future value (recursive): ₹" + predicted);

        double predictedIter = predictValueIterative(initial, growthRate, years);
        System.out.println("Predicted future value (iterative): ₹" + predictedIter);
    }
}
