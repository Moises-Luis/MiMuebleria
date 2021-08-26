package com.example.mimuebleria;

public enum Exceptions {
    NUMEXCEPTION(0),
    CADENAEXCEPTION(1);

    private Exceptions(int identificador){
        this.identificador = identificador;
    }
    private int identificador;

    public int getIdentificador() {
        return identificador;
    }
}

