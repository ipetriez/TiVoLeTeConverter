//
//  LengthConverterViewModel.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import Foundation

enum LengthUnit: String, CaseIterable, Equatable {
    case meters, kilometers, feet, yards, miles
}

final class LengthConverterViewModel: ObservableObject {
    
    @Published var selectedLengthValue: Double? = nil
    
    @Published var lengthUnitToConvertFrom: LengthUnit = .meters {
        didSet {
            if lengthUnitToConvertFrom == lengthUnitToConvertTo {
                lengthUnitToConvertTo = oldValue
            }
        }
    }
    
    @Published var lengthUnitToConvertTo: LengthUnit = .kilometers {
        didSet {
            if lengthUnitToConvertTo == lengthUnitToConvertFrom {
                lengthUnitToConvertFrom = oldValue
            }
        }
    }
    
    var conversionResult: Double {
        let inputValueInMeters: Double
        let selectedLengthValue = self.selectedLengthValue ?? 0
        
        switch lengthUnitToConvertFrom {
        case .meters:
            inputValueInMeters = selectedLengthValue
        case .kilometers:
            inputValueInMeters = Measurement(value: selectedLengthValue, unit: UnitLength.kilometers).converted(to: .meters).value
        case .feet:
            inputValueInMeters = Measurement(value: selectedLengthValue, unit: UnitLength.feet).converted(to: .meters).value
        case .yards:
            inputValueInMeters = Measurement(value: selectedLengthValue, unit: UnitLength.yards).converted(to: .meters).value
        case .miles:
            inputValueInMeters = Measurement(value: selectedLengthValue, unit: UnitLength.miles).converted(to: .meters).value
        }
        
        switch lengthUnitToConvertTo {
        case .meters:
            return inputValueInMeters
        case .kilometers:
            return Measurement(value: inputValueInMeters, unit: UnitLength.meters).converted(to: .kilometers).value
        case .feet:
            return Measurement(value: inputValueInMeters, unit: UnitLength.meters).converted(to: .feet).value
        case .yards:
            return Measurement(value: inputValueInMeters, unit: UnitLength.meters).converted(to: .yards).value
        case .miles:
            return Measurement(value: inputValueInMeters, unit: UnitLength.meters).converted(to: .miles).value
        }
    }
}
