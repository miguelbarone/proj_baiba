//
//  LoginService.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import FirebaseAuth
import RxSwift
import RxCocoa

class LoginService {
    func makeLogin(email: String, password: String) -> Single<Bool> {
        return Single.create { single in
            Auth.auth().signIn(withEmail: email, password: password, completion:{ user, error in
                if error != nil {
                    single(.success(false))
                    print ("erro")
                    return
                } else {
                    single(.success(true))
                    print("Usuário logado")
                    return
                }
                
            })
        return Disposables.create()
    }
  
  }

}
