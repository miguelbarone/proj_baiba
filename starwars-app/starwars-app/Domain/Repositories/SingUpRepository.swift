//
//  SingUpRepository.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SignUpRepository {
    func registerUser(email:String, password:String) -> Single<Bool>
}
