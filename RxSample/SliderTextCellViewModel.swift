//
//  SliderTextCellViewModel.swift
//  RxSample
//
//  Created by PB2 on 2017/10/12.
//  Copyright © 2017年 homewellgo. All rights reserved.
//


import Foundation
import RxSwift

class SliderTextCellViewModel {
    
    var sliderValue: Variable<Float> = Variable<Float>(0)
    var textFieldText: Variable<String> = Variable<String>("")
    
    var value: Variable<Float> = Variable<Float>(0)
    
    var formattedValueText: Variable<String> = Variable<String>("")
    var formattedValueFloat: Variable<Float> = Variable<Float>(0)
    
    init() {
        bind()
    }
    
    func bind() {
        
        // Bind slider input
        _ = sliderValue.asObservable()
            .map{ self.formatSlider(value: $0)}
            .bind(to: value)
        
        _ = sliderValue.asObservable()
            .map{ self.formatSlider(value: $0) }
            .map{ value -> String in
                String(format: "%.1f", value)
            }.bind(to: formattedValueText)
        
        
        _ = value.asObservable().subscribe(onNext: { value in
            print("Value changed")
        })
        
        _ = formattedValueText.asObservable().subscribe(onNext: { text in
            print("fromatted text:\(text)")
        })
        
        
        
        // Bind textField input
        _ = textFieldText.asObservable()
            .map{ self.formatTextField(text: $0) }
            .bind(to: value)
        
        _ = textFieldText.asObservable()
            .map{ self.formatTextField(text: $0) }
            .bind(to: formattedValueFloat)
        
    }
    
    
    
    private func formatSlider(value: Float) -> Float {
        let step: Float = 0.5
        return round( value / step ) * step
    }
    
    private func formatTextField(text: String?) -> Float {
        
        guard let text = text else { return 0 }
        return Float(text) ?? 0
    }
}
