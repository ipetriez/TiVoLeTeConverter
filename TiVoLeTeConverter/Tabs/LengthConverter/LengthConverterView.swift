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
            ZStack {
                VStack(spacing: 0) {
                    Form {
                        Section {
                            Picker("Convert result in:", selection: $vm.lengthUnitToConvertTo) {
                                ForEach(LengthUnit.allCases, id: \.self) { unit in
                                    Text(unit.rawValue)
                                }
                            }
                            
                            Text(vm.conversionResult, format: .number)
                        }
                    }
                    
                    Form {
                        Section("Convert from") {
                            Picker("Convert from", selection: $vm.lengthUnitToConvertFrom) {
                                ForEach(LengthUnit.allCases, id: \.self) { unit in
                                    Text(unit.rawValue)
                                }
                            }
                            .pickerStyle(.wheel)
                            
                            TextField("Enter number of \(vm.lengthUnitToConvertFrom.rawValue) for conversion", value: $vm.selectedLengthValue, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($keyboardIsShown)
                        }
                    }
                    .navigationTitle("Length converter")
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
                    Image(systemName: "ruler")
                        .resizable()
                        .frame(width: 150, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 170)
                        .foregroundStyle(.tertiary)
                }
            }
        }
    }
}

#Preview {
    LengthConverterView()
}
