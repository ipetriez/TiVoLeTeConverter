//
//  TemperatureConverterView.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import SwiftUI

struct TemperatureConverterView: View {
    
    @StateObject private var vm = TemperatureConverterViewModel()
    @FocusState private var keyboardIsShown: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Convert from", selection: $vm.temperatureUnitToConvertFrom) {
                        ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    TextField("Enter number of \(vm.temperatureUnitToConvertFrom.rawValue) for conversion", value: $vm.selectedTemperatureValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsShown)
                }
                
                Section {
                    Picker("Convert to", selection: $vm.temperatureUnitToConvertTo) {
                        ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Text(vm.conversionResult, format: .number)
                }
            }
            .navigationTitle("Temperature converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if keyboardIsShown {
                    Button("Done") {
                        keyboardIsShown.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    TemperatureConverterView()
}
