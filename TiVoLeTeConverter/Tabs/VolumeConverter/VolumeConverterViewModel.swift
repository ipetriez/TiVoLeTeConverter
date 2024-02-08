//
//  VolumeConverterViewModel.swift
//  TiVoLeTeConverter
//
//  Created by Sergey Petrosyan on 08.02.24.
//

import Foundation

enum VolumeUnit: String, CaseIterable, Equatable {
    case milliliters, liters, cups, pints, gallons
}

final class VolumeConverterViewModel: ObservableObject {
    
    @Published var selectedVolumeValue: Double? = nil
    
    @Published var volumeUnitToConvertFrom: VolumeUnit = .milliliters {
        didSet {
            if volumeUnitToConvertFrom == volumeUnitToConvertTo {
                volumeUnitToConvertTo = oldValue
            }
        }
    }
    
    @Published var volumeUnitToConvertTo: VolumeUnit = .liters {
        didSet {
            if volumeUnitToConvertTo == volumeUnitToConvertFrom {
                volumeUnitToConvertFrom = oldValue
            }
        }
    }
    
    var conversionResult: Double {
        let inputValueInMilliliters: Double
        let selectedVolumeValue = self.selectedVolumeValue ?? 0
        
        switch volumeUnitToConvertFrom {
        case .milliliters:
            inputValueInMilliliters = selectedVolumeValue
        case .liters:
            inputValueInMilliliters = Measurement(value: selectedVolumeValue, unit: UnitVolume.liters).converted(to: .milliliters).value
        case .cups:
            inputValueInMilliliters = Measurement(value: selectedVolumeValue, unit: UnitVolume.cups).converted(to: .milliliters).value
        case .pints:
            inputValueInMilliliters = Measurement(value: selectedVolumeValue, unit: UnitVolume.pints).converted(to: .milliliters).value
        case .gallons:
            inputValueInMilliliters = Measurement(value: selectedVolumeValue, unit: UnitVolume.gallons).converted(to: .milliliters).value
        }
        
        switch volumeUnitToConvertTo {
        case .milliliters:
            return inputValueInMilliliters
        case .liters:
            return Measurement(value: inputValueInMilliliters, unit: UnitVolume.milliliters).converted(to: .liters).value
        case .cups:
            return Measurement(value: inputValueInMilliliters, unit: UnitVolume.milliliters).converted(to: .cups).value
        case .pints:
            return Measurement(value: inputValueInMilliliters, unit: UnitVolume.milliliters).converted(to: .pints).value
        case .gallons:
            return Measurement(value: inputValueInMilliliters, unit: UnitVolume.milliliters).converted(to: .gallons).value
        }
    }
}
