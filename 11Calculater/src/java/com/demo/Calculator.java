package com.demo;

public class Calculator {
    private double operand1;
    private double operand2;
    private String operation;
    private double result;

    // Constructor
    public Calculator() {
        this.result = 0.0;
    }

    // Getters and Setters
    public double getOperand1() { return operand1; }
    public void setOperand1(double operand1) { this.operand1 = operand1; }

    public double getOperand2() { return operand2; }
    public void setOperand2(double operand2) { this.operand2 = operand2; }

    public String getOperation() { return operation; }
    public void setOperation(String operation) { this.operation = operation; }

    public double getResult() { return result; }
    public void setResult(double result) { this.result = result; }

    // Calculate method
    public void calculate() {
        switch (operation) {
            case "Add":
                result = operand1 + operand2;
                break;
            case "Sub":
                result = operand1 - operand2;
                break;
            case "Mul":
                result = operand1 * operand2;
                break;
            case "Div":
                if (operand2 != 0) {
                    result = operand1 / operand2;
                } else {
                    result = Double.NaN; // Indicate division by zero
                }
                break;
            default:
                result = 0.0;
        }
    }
}
