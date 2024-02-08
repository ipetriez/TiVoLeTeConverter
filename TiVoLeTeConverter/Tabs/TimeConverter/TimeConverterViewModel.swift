//
//  TimeConverterViewModel.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import Foundation

enum TimeUnit: String, CaseIterable, Equatable {
    case seconds, minutes, hours, days
}

final class TimeConverterViewModel: ObservableObject {
    
    @Published var selectedTimeValue: Double? = nil
    
    @Published var timeUnitToConvertFrom: TimeUnit = .seconds {
        didSet {
            if timeUnitToConvertFrom == timeUnitToConvertTo {
                timeUnitToConvertTo = oldValue
            }
        }
    }
    
    @Published var timeUnitToConvertTo: TimeUnit = .minutes {
        didSet {
            if timeUnitToConvertTo == timeUnitToConvertFrom {
                timeUnitToConvertFrom = oldValue
            }
        }
    }
    
    var conversionResult: Double {
        let inputValueInSeconds: Double
        let selectedTimeValue = self.selectedTimeValue ?? 0
        
        switch timeUnitToConvertFrom {
        case .seconds:
            inputValueInSeconds = selectedTimeValue
        case .minutes:
            inputValueInSeconds = selectedTimeValue * 60
        case .hours:
            inputValueInSeconds = selectedTimeValue * 3600
        case .days:
            inputValueInSeconds = selectedTimeValue * 86400
        }
        
        switch timeUnitToConvertTo {
        case .seconds:
            return inputValueInSeconds
        case .minutes:
            return inputValueInSeconds / 60
        case .hours:
            return inputValueInSeconds / 3600
        case .days:
            return inputValueInSeconds / 86400
        }
    }
}
