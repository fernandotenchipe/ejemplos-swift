//
//  ContentView.swift
//  Tarea_Movil2
//
//  Created by Fernando Tenchipe Morales on 13/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var TotalCuenta = ""
    @State private var NumPerson = ""
    @State private var PropinaPers = ""
    @State private var Total = ""
    @State private var MensajeError = false
    
    var body: some View {
        VStack {
            
            Text("Calculadora de pago con propina")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 245/255, green: 239/255, blue:255/255))
                .bold()
            
            Image("verde")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 20.0)
                .frame(width: 200)
            
            HStack{
                Text("Total de la cuenta: ")
                    .padding(.trailing, 20.0)
                    .foregroundColor(.white)
                TextField("Cantidad", text: $TotalCuenta)
                    .textFieldStyle(.roundedBorder)
                    .padding(.trailing,50.0)
            }
            HStack{
                Text("Número de personas: ")
                    .padding(.trailing,1.0)
                    .foregroundColor(.white)
                TextField("Personas", text: $NumPerson)
                    .textFieldStyle(.roundedBorder)
                    .padding(.trailing,49.0)
            }
            
            HStack{
                Text("Porcentaje de propina: ")
                    .padding(.trailing, 79.0)
                    .foregroundColor(.white)
                TextField("Propina", text: $PropinaPers)
                    .textFieldStyle(.roundedBorder)
                    .padding(.trailing,25.0)
                Text("%")
                    .foregroundColor(.white)
            }
            
            HStack{
                Text("Total por persona: ")
                    .padding(.trailing, 25.0)
                    .foregroundColor(.white)
                TextField("Total", text: $Total)
                    .textFieldStyle(.roundedBorder)
                    .padding(.trailing,49.0)
            }
            Spacer()
            
            Button("Calcular"){
                if(TotalCuenta == "" || NumPerson == ""){
                    MensajeError.toggle()
                }else {
                    calculeTotalPorPersona()
                }
            }
            .padding()
            .foregroundColor(.gray)
            .background(Color(red: 245/255, green: 239/255, blue:255/255))
            .cornerRadius(10)
            

            
            Spacer()
            Text("App creada por: Fernando Tenchipe Morales | A01571277")
                .foregroundColor(.white)
        }
        .padding()
        .background(Color(red:126/255, green: 25/255, blue: 70/255))
        .alert("Escribe la cuenta y cuantas personas son", isPresented: $MensajeError){
            Button("Ok"){}
        }
    }
    
    private func calculeTotalPorPersona(){
        let cuenta = Double(TotalCuenta) ?? 0
        let personas = Double(NumPerson) ?? 1
        let propina = Double(PropinaPers) ?? 10
        
        let totalPropina = cuenta * (propina/100.0)
        let totalCuentaPropina = cuenta + totalPropina
        let totalPersona = totalCuentaPropina / personas
        
        Total = String(format: "%.2f", totalPersona)
    
    }
}

#Preview {
    ContentView()
}
