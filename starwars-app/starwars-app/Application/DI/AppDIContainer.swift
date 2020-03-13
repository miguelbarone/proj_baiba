//
//  AppDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 04/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class AppDIContainer {
 
    let signUpDI = SignUpDIContainer()
    
    var window: UIWindow?
        
        
  public func makeHomeViewController() -> LoginViewController {
    return LoginViewController.create(delegate: self, viewModel: LoginViewModel(usecase: LoginUseCase(loginRepository: LoginRepositoryImpl())))
            
        }
        
    }

extension AppDIContainer: LoginViewControllerDelegate {
    func didTouchButtonLogin() -> UIViewController {
        let loginRepository = LoginRepositoryImpl()
        let usecase = LoginUseCase(loginRepository: loginRepository)
        let vm = StarWarsViewController()
        let vc = StarWarsViewController.instantiate()
        
        return vc
    }
    
    
    func showChooseSideViewController() -> ChooseSideViewController {
        return makeChooseSideDI.makeChooseSideViewController()
    }
    var makeChooseSideDI: ChooseDIContainer {
        return ChooseDIContainer()
    }
}
