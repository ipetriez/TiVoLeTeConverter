//
//  TimeConverterView.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import SwiftUI

struct TimeConverterView: View {
    
    @StateObject private var vm = TimeConverterViewModel()
    @FocusState private var keyboardIsShown: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    Form {
                        Section("Conversion result in:") {
                            Picker("Convert to", selection: $vm.timeUnitToConvertTo) {
                                ForEach(TimeUnit.allCases, id: \.self) { unit in
                                    Text(unit.rawValue)
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            Text(vm.conversionResult, format: .number)
                        }
                    }
                    
                    Form {
                        Section("Convert from:") {
                            Picker("Convert from", selection: $vm.timeUnitToConvertFrom) {
                                ForEach(TimeUnit.allCases, id: \.self) { unit in
                                    Text(unit.rawValue)
                                }
                            }
                            .pickerStyle(.wheel)
                            
                            TextField("Enter number of \(vm.timeUnitToConvertFrom.rawValue) for conversion", value: $vm.selectedTimeValue, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($keyboardIsShown)
                        }
                    }
                    .navigationTitle("Time converter")
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
                    Image(systemName: "clock.arrow.2.circlepath")
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
    TimeConverterView()
}
