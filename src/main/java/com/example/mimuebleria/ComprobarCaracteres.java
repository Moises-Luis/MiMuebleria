package com.example.mimuebleria;

public class ComprobarCaracteres {
    String cadena;
    int numeroEntero;
    float numeroFlotante;

    public ComprobarCaracteres(String cadena, int numeroEntero) {
        this.cadena = cadena;
        this.numeroEntero = numeroEntero;
    }

    public ComprobarCaracteres(String cadena, float numeroFlotante) {
        this.cadena = cadena;
        this.numeroFlotante = numeroFlotante;
    }

    public String getCadena() {
        return cadena;
    }

    public void setCadena(String cadena) {
        this.cadena = cadena;
    }

    public int getNumeroEntero() {
        return numeroEntero;
    }

    public void setNumeroEntero(int numeroEntero) {
        this.numeroEntero = numeroEntero;
    }

    public float getNumeroFlotante() {
        return numeroFlotante;
    }

    public void setNumeroFlotante(float numeroFlotante) {
        this.numeroFlotante = numeroFlotante;
    }
}
