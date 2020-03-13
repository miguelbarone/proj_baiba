//
//  LoginUseCase.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public class LoginUseCase {
    let loginRepo: LoginRepository
    
    init(loginRepository: LoginRepository) {
        self.loginRepo = loginRepository
    }
    
    public func goLogin(email: String, password: String) -> Single<Bool> {
        return loginRepo.getLogin(email: email, password: password)
        
        }
        
        
}
