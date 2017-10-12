//
//  LoginViewController.swift
//  RxSample
//
//  Created by PB2 on 2017/10/12.
//  Copyright © 2017年 homewellgo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    let errorColor: UIColor = .orange
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = usernameTextField.rx.text.map{ $0 ?? "" }.bind(to: loginViewModel.username    )
        
        _ = passwordTextField.rx.text.map{ $0 ?? "" }.bind(to: loginViewModel.password    )
        
        
        loginViewModel.isUsernameValid.subscribe(onNext: { [unowned self] isValid in
            self.usernameTextField.backgroundColor = isValid ? .white : .orange
        }).disposed(by: disposeBag)
        
        loginViewModel.isPasswordValid.subscribe(onNext: { [unowned self] isValid in
            self.passwordTextField.backgroundColor = isValid ? .white : .orange
        }).disposed(by: disposeBag)
        
        loginViewModel.isAllValid.subscribe(onNext: { [unowned self] isValid in
            self.loginButton.isEnabled = isValid
            self.loginButton.backgroundColor = isValid ? .darkGray : .lightGray
            self.messageLabel.text = isValid ? "OK" : "Information missing"
            self.messageLabel.textColor = isValid ? .blue : .red
        }).disposed(by: disposeBag)
    }
    
    
}
