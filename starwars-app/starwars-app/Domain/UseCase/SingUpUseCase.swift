//
//  SingUpUseCase.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SignUpUseCase{
    private let signUpImpl: SignUpRepositorImpl
    private let disposeBag = DisposeBag()
    
    init(signUpImpl: SignUpRepositorImpl){
        self.signUpImpl = signUpImpl
    }
    
    func registerUser(email: String, password:String) -> Single<Bool>{
       return signUpImpl.registerUser(email: email, password: password)
    }
}
