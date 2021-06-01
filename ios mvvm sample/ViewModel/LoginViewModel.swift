//
//  LoginViewModelProtocol.swift
//  ios mvvm sample
//
//  Created by JINKI BAE on 2021/06/01.
//

import RxSwift
import RxCocoa

class LoginViewModel {
    
    let emailTextRelay = BehaviorRelay<String>(value: "")
    let pwTextReplay = BehaviorRelay<String>(value: "")
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(emailTextRelay, pwTextReplay).map { email, password in
            return email.count > 0 && email.contains("@") && email.contains(".") && password.count > 0
        }
    }
}
