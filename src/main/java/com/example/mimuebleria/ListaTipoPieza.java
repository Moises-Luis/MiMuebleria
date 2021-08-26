package com.example.mimuebleria;

import java.util.ArrayList;

public class ListaTipoPieza {
    ArrayList<PiezaPOJO> miLista;
    boolean isEmpty;
    boolean error;
    String mensajeError;

    public void print(){
        for (int i = 0; i<miLista.size(); i++){
            System.out.println(miLista.get(i).getCantidad());
            System.out.println(miLista.get(i).getPrecio());
            System.out.println(miLista.get(i).getTipo());
        }
    }

    public ArrayList<PiezaPOJO> getMiLista() {
        return miLista;
    }

    public void setMiLista(ArrayList<PiezaPOJO> miLista) {
        this.miLista = miLista;
    }

    public boolean isEmpty() {
        return isEmpty;
    }

    public void setEmpty(boolean empty) {
        isEmpty = empty;
    }

    public boolean isError() {
        return error;
    }

    public void setError(boolean error) {
        this.error = error;
    }

    public String getMensajeError() {
        return mensajeError;
    }

    public void setMensajeError(String mensajeError) {
        this.mensajeError = mensajeError;
    }
}
