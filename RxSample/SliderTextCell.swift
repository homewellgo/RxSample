//
//  SliderTextCell.swift
//  RxSample
//
//  Created by PB2 on 2017/10/12.
//  Copyright © 2017年 homewellgo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SliderTextCell: UITableViewCell {
    
    let slider: UISlider = {
        let s = UISlider()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.minimumValue = 0
        s.maximumValue = 100
        return s
    }()
    
    lazy var textField: UITextField = {
        let tf = UITextField.defaultStyle()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let disposeBag = DisposeBag()
    let sliderTextCellViewModel: SliderTextCellViewModel = SliderTextCellViewModel()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupSbuviews()
        bind()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSbuviews() {
        addSubview( slider )
        addSubview( textField )
        
        let horizontalFormat: String = "H:|-10-[v0]-|"
        addConstraints(withFormat: horizontalFormat, views: slider)
        addConstraints(withFormat: horizontalFormat, views: textField)
        
        addConstraints(withFormat: "V:|-10-[v0]-5-[v1]-|", views: textField,slider)
    }
    
    
    
    func bind() {
        
        // Bind UI value to VM
        _ = slider.rx.value.bind(to: sliderTextCellViewModel.sliderValue)
        _ = textField.rx.text.map{ $0 ?? "" }.bind(to: sliderTextCellViewModel.textFieldText)
        
        
        // Bind VM value to UI
        _ = sliderTextCellViewModel.formattedValueText.asObservable().bind(to: textField.rx.text)
        _ = sliderTextCellViewModel.formattedValueFloat.asObservable().bind(to: slider.rx.value)
    }
}


















