//
//  SingUpService.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import FirebaseAuth

class SignUpService {
    
    
    func registerUser(email:String, password:String) -> Single<Bool> {
        return Single.create { single in
            Auth.auth().createUser(withEmail: email, password: password, completion:{ user, error in
                if error != nil {
                    single(.success(false))
                    print("Erro ao cadastrar")
                    return
                }else {
                    single(.success(true))
                    
                    print("Usuário cadastrado")
                    return
                }
            })
            return Disposables.create()
        }
    }
}
