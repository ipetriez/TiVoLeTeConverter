//
//  LengthConverterView.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import SwiftUI

struct LengthConverterView: View {
    
    @StateObject private var vm = LengthConverterViewModel()
    @FocusState private var keyboardIsShown: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Convert from", selection: $vm.lengthUnitToConvertFrom) {
                        ForEach(LengthUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    
                    TextField("Enter number of \(vm.lengthUnitToConvertFrom.rawValue) for conversion", value: $vm.selectedLengthValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsShown)
                }
                
                Section {
                    Picker("Convert to", selection: $vm.lengthUnitToConvertTo) {
                        ForEach(LengthUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    
                    Text(vm.conversionResult, format: .number)
                }
            }
            .navigationTitle("Length converter")
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
    LengthConverterView()
}
