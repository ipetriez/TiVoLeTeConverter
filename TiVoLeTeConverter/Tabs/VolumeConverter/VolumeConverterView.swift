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
            ZStack {
                VStack(spacing: 0) {
                    Form {
                        Section {
                            Picker("Convert result in:", selection: $vm.volumeUnitToConvertTo) {
                                ForEach(VolumeUnit.allCases, id: \.self) { unit in
                                    Text(unit.rawValue)
                                }
                            }
                            
                            Text(vm.conversionResult, format: .number)
                        }
                    }
                    
                    Form {
                        Section("Convert from") {
                            Picker("Convert from", selection: $vm.volumeUnitToConvertFrom) {
                                ForEach(VolumeUnit.allCases, id: \.self) { unit in
                                    Text(unit.rawValue)
                                }
                            }
                            .pickerStyle(.wheel)
                            
                            TextField("Enter number of \(vm.volumeUnitToConvertFrom.rawValue) for conversion", value: $vm.selectedVolumeValue, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($keyboardIsShown)
                        }
                    }
                    .navigationTitle("Volume converter")
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
                    Image(systemName: "testtube.2")
                        .resizable()
                        .frame(width: 115, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 170)
                        .foregroundStyle(.tertiary)
                }
            }
        }
    }
}

#Preview {
    VolumeConverterView()
}
