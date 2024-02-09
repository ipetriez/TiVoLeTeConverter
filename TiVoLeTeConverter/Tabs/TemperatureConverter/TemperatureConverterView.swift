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
            ZStack {
                VStack(spacing: 0) {
                    Form {
                        Section("Conversion result in:") {
                            Picker("Convert to", selection: $vm.temperatureUnitToConvertTo) {
                                ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                                    Text(unit.rawValue)
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            Text(vm.conversionResult, format: .number)
                        }
                    }
                    
                    Form {
                        Section("Convert from") {
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
                    }
                    .navigationTitle("Temperature converter")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        if keyboardIsShown {
                            Button("Done") {
                                keyboardIsShown.toggle()
                            }
                            .fontWeight(.semibold)
                            .tint(Color(.label))
                        }
                    }
                }
                
                if !keyboardIsShown {
                    Image(systemName: "thermometer.sun")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 170)
                        .foregroundStyle(.tertiary)
                }
            }
        }
    }
}

#Preview {
    TemperatureConverterView()
}
