package com.example.mimuebleria;

public class Error extends Exception{

    public Error() {
    }

    public Error(String message) {
        super(message);
    }
}
    /*public void setNumber1(String number1) throws CalculatorException {
        try {
            this.number1 = Integer.valueOf(number1);
        } catch (NumberFormatException e) {
            throw new CalculatorException("El valor del numero 1 es incorrecto");
        }
    }*/