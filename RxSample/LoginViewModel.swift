//
//  LoginViewModel.swift
//  RxSample
//
//  Created by PB2 on 2017/10/12.
//  Copyright © 2017年 homewellgo. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    
    var isUsernameValid: Observable<Bool> {
        return username.asObservable().map{ username in
            username.characters.count >= 3
        }
    }
    
    var isPasswordValid: Observable<Bool> {
        return password.asObservable().map{ password in
            password.characters.count >= 3
        }
    }
    
    
    
    var isAllValid: Observable<Bool> {
        return Observable.combineLatest(isUsernameValid, isPasswordValid) {
            isUsernameValid, isPasswordValid in
            isUsernameValid && isPasswordValid
        }
    }
}
