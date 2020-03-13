//
//  teste.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit


class teste:UIViewController {
    
    func instantiate() -> teste{
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "teste") as! teste
        return view
    }
    
}
