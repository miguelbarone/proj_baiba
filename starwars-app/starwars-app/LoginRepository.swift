//
//  LoginRepository.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

import RxSwift

protocol LoginRepository {
    func getLogin(email: String, password: String) -> Single<Bool>

}
