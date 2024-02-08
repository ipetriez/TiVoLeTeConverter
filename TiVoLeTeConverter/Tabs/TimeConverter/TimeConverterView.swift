//
//  TimeConverterView.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import SwiftUI

struct TimeConverterView: View {
    
    @StateObject private var vm = TimeConverterViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Convert from", selection: $vm.timeUnitToConvertFrom) {
                        ForEach(TimeUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    TextField("Enter number of \(vm.timeUnitToConvertFrom.rawValue) for conversion", value: $vm.selectedTimeValue, format: .number)
                }
                
                Section {
                    Picker("Convert to", selection: $vm.timeUnitToConvertTo) {
                        ForEach(TimeUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    Text(vm.conversionResult, format: .number)
                }
            }
            .navigationTitle("Time converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TimeConverterView()
}
