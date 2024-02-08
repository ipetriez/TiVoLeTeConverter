//
//  TemperatureConverterViewModel.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import Foundation

enum TemperatureUnit: String, CaseIterable, Equatable {
    case celsius, fahrenheit, kelvin
}

final class TemperatureConverterViewModel: ObservableObject {
    
    @Published var selectedTemperatureValue: Double? = nil
    
    @Published var temperatureUnitToConvertFrom: TemperatureUnit = .celsius {
        didSet {
            if temperatureUnitToConvertFrom == temperatureUnitToConvertTo {
                temperatureUnitToConvertTo = oldValue
            }
        }
    }
    
    @Published var temperatureUnitToConvertTo: TemperatureUnit = .fahrenheit {
        didSet {
            if temperatureUnitToConvertTo == temperatureUnitToConvertFrom {
                temperatureUnitToConvertFrom = oldValue
            }
        }
    }
    
    var conversionResult: Double {
        let inputValueInCelsius: Double
        let selectedTemperatureValue = self.selectedTemperatureValue ?? 0
        
        switch temperatureUnitToConvertFrom {
        case .celsius:
            inputValueInCelsius = selectedTemperatureValue
        case .fahrenheit:
            inputValueInCelsius = Measurement(value: selectedTemperatureValue, unit: UnitTemperature.fahrenheit).converted(to: .celsius).value
        case .kelvin:
            inputValueInCelsius = Measurement(value: selectedTemperatureValue, unit: UnitTemperature.kelvin).converted(to: .celsius).value
        }
        
        switch temperatureUnitToConvertTo {
        case .celsius:
            return inputValueInCelsius
        case .fahrenheit:
            return Measurement(value: inputValueInCelsius, unit: UnitTemperature.celsius).converted(to: .fahrenheit).value
        case .kelvin:
            return Measurement(value: inputValueInCelsius, unit: UnitTemperature.celsius).converted(to: .kelvin).value
        }
    }
}
