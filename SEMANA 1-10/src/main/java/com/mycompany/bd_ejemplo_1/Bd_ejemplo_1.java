/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.bd_ejemplo_1;

/**
 *
 * @author admin
 */
public class Bd_ejemplo_1 {
    public static void main(String[] args) {
        int[] numeros = {1, 2, 3, 4, 5, 6, 7, 8};
        int cantidadPares = contarPares(numeros);
        int [] pares =cantidadPares(numeros);
        
        System.out.println("Cantidad de números pares: " + cantidadPares);
        System.out.println("Numeros pares: ");
        for (int i=0;i<pares.length;i++){
              System.out.println(pares[i]);
        }            
     }

    public static int contarPares(int[] lista) {
    int contador = 0;
        for (int numero : lista) {
             if (numero % 2 == 0) {          
                contador++;
            }
        }
        return contador;
        
    }
    public static int[] cantidadPares(int[] lista) {
        int [] pares= new int [lista.length];
        int contador=0;
        for (int numero : lista) {
             if (numero % 2 == 0) {  
                 pares [contador]=numero;
                 contador++;
                 }
             }
        int [] partotal=new int [contador];
        System.arraycopy(pares, 0, partotal, 0, contador);
        return partotal;
    }      
}

