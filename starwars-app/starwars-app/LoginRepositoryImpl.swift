//
//  LoginRepositoryImpl.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

import RxSwift

public class LoginRepositoryImpl: LoginRepository {
     
    var loginService = LoginService()
    func getLogin(email: String, password: String) -> Single<Bool> {
        
        return loginService.makeLogin(email: email, password: password)
    }
    
    
   
   
        
    }
    



