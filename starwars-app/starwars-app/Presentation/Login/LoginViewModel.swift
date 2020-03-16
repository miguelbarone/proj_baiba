//
//  LoginViewModel.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol LoginViewModelContract {
    var loginResponse: Driver<Bool?>{ get }
    func goLogin(email: String, password: String) 
}

public class LoginViewModel: LoginViewModelContract {
    let disposeBag = DisposeBag()
    var usecase: LoginUseCase
    
    private let loginRelay: BehaviorRelay<Bool?> =
        BehaviorRelay(value: nil)
       public var loginResponse: Driver<Bool?>{ return
           loginRelay.asDriver() }
    
    public func goLogin(email: String, password: String){
        usecase.goLogin(email: email, password: password).subscribe(onSuccess: { login in
            self.loginRelay.accept(login)
            }).disposed(by: disposeBag)
     }
    
    init(usecase: LoginUseCase) {
        self.usecase = usecase
        
    }
    
}

   

