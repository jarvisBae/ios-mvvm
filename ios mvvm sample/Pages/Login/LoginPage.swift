//
//  LoginPage.swift
//  ios mvvm sample
//
//  Created by JINKI BAE on 2021/06/01.
//

import UIKit
import RxSwift
import RxCocoa

class LoginPage: UIViewController {

    //MARK: - Properties
    private let bag = DisposeBag()
    let viewModel = LoginViewModel()
    
    //MARK: IBOutlet
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textFieldPassword.isSecureTextEntry = true
        bindViewModel()
    }
    
    func bindViewModel() {
        
        textFieldEmail.rx.text
            .orEmpty
            .bind(to: viewModel.emailTextRelay)
            .disposed(by: bag)
        
        textFieldPassword.rx.text
            .orEmpty
            .bind(to: viewModel.pwTextReplay)
            .disposed(by: bag)
        
        viewModel.isValid()
            .bind(to: buttonLogin.rx.isEnabled)
            .disposed(by: bag)
        
        viewModel.isValid()
            .map { $0 ? 1: 0.3 }
            .bind(to: buttonLogin.rx.alpha)
            .disposed(by: bag)
        
        textFieldEmail.rx.text
            .orEmpty
            .subscribe(onNext: { value in
                
            })
            .disposed(by: bag)
        
        textFieldPassword.rx.text
            .orEmpty
            .subscribe(onNext: { value in
                
            })
            .disposed(by: bag)
    }
    
    
    

}
