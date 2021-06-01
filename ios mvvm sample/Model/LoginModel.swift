//
//  LoginModel.swift
//  ios mvvm sample
//
//  Created by JINKI BAE on 2021/06/01.
//
import RxSwift

struct LoginModel {
    
    func requestLogin(id: String, pw: String) -> Observable<Result<UserInfo, LoginError>> {
        return Observable.create { (observer) -> Disposable in
            if id != "" && pw != "" {
                let userInfo = UserInfo.Builder()
                    .withUserId(0)
                    .withUserName("userName")
                    .withLat(38.13)
                    .withLng(127.123)
                    .build()
                
                observer.onNext(.success(userInfo))
            } else {
                observer.onNext(.failure(.defaultError))
            }
            
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
}
