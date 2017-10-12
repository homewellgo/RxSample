//
//  UISubscriptionViewController.swift
//  RxSample
//
//  Created by PB2 on 2017/10/12.
//  Copyright © 2017年 homewellgo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UISubscriptionViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    
    func bind() {
        _ = textField.rx.text.subscribe(onNext: { text in
            print(text)
        }).disposed(by: disposeBag)
        
        _ = mySwitch.rx.isOn.subscribe(onNext: { [unowned self] isOn in
            self.textField.isEnabled = isOn
        }).disposed(by: disposeBag)
        
        _ = slider.rx.value.subscribe(onNext: { [unowned self] value in
            let valueAsText = String(format: "%.2f", value)
            self.textField.text = valueAsText
        }).disposed(by: disposeBag)
        
        _ = button.rx.tap.subscribe(onNext: {
            print("Button Tap")
        })
    }
}
