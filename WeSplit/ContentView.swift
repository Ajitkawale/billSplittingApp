//
//  ContentView.swift
//  WeSplit
//
//  Created by Ajit Kawale on 09/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
   @State private var tipPercentage = 20
    @State private var noOfPeople = 2
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 10, 20, 30]
   
    
    var totalperperson: Double {
        let peopleCount = Double(noOfPeople + 2)
                return finalBill / peopleCount
        
    }
        
        var finalBill: Double {
            let tipSelection = Double(tipPercentage)
                    let tipValue = checkAmount / 100 * tipSelection
                    return checkAmount + tipValue
        }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Bill Amount") {
                    TextField("Enter amount", value: $checkAmount,
                              format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)}
              
                Section ("How much do you want to tip?"){
                    Picker("Tip percentage" , selection: $tipPercentage ){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section ("TotalAmount"){
                    Text(finalBill , format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                    
                }
                
                Section{
                    
                    Picker("Number of people", selection: $noOfPeople) {
                        ForEach(2..<11) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section ("Sab itna nikalo"){
                    Text(totalperperson , format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused
                {
                    Button("Done") {
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
