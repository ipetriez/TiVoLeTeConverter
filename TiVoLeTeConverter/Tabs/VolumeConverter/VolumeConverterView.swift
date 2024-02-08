//
//  VolumeConverterView.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import SwiftUI

struct VolumeConverterView: View {
    
    @StateObject private var vm = VolumeConverterViewModel()
    @FocusState private var keyboardIsShown: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Convert from", selection: $vm.volumeUnitToConvertFrom) {
                        ForEach(VolumeUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    
                    TextField("Enter number of \(vm.volumeUnitToConvertFrom.rawValue) for conversion", value: $vm.selectedVolumeValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsShown)
                }
                
                Section {
                    Picker("Convert to", selection: $vm.volumeUnitToConvertTo) {
                        ForEach(VolumeUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    
                    Text(vm.conversionResult, format: .number)
                }
            }
            .navigationTitle("Volume converter")
            .toolbar {
                if keyboardIsShown {
                    Button("Done") {
                        keyboardIsShown.toggle()
                    }
                    .tint(Color(.label))
                }
            }
        }
    }
}

#Preview {
    VolumeConverterView()
}
