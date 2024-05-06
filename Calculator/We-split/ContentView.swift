//
//  ContentView.swift
//  Calculator
//
//  Created by Boyo on 05/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPepole = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPepole + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var SumOfAmountAndTip: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of peoples", selection: $numberOfPepole){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section("How much do you want to Tip?"){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                }
                .pickerStyle(.navigationLink)
                
                Section("Amount + Tip Value"){
                    Text(SumOfAmountAndTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }
                
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                .navigationBarTitle("We-Split", displayMode: .inline)
                
                

                
                
                
            }
            .toolbar{
                if amountIsFocused == true{
                    Button("Done"){
                        amountIsFocused = false
                    }
                    
                }
            }
        }
    }
}


    

#Preview {
    ContentView()
}
