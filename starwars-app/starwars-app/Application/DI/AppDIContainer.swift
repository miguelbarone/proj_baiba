//
//  AppDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 04/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class AppDIContainer {
        
    var makeLoginDI: LoginDIContainer {
        return LoginDIContainer()
    }
        
  public func makeLoginViewController() -> LoginViewController {
    return makeLoginDI.makeLoginViewController()
            
        }
        
    }

