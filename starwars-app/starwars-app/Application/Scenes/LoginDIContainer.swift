//
//  LoginDIContainer.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 13/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

class LoginDIContainer: LoginViewControllerDelegate {
    
    var makeChooseSideDI: ChooseDIContainer {
        return ChooseDIContainer()
    }
    
    public func makeLoginViewController() -> LoginViewController {
        return LoginViewController.create(delegate: self, viewModel: LoginViewModel(usecase: LoginUseCase(loginRepository: LoginRepositoryImpl())))
        
    }
    
    func didTouchButtonLogin() -> ChooseSideViewController {
        return makeChooseSideDI.makeChooseSideViewController()
    }

    
}


