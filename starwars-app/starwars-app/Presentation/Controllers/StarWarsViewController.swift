//
//  StarWarsViewController.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

     static func instantiate() -> StarWarsViewController {
          let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
          let view = storyboard.instantiateViewController(withIdentifier: "StarWarsViewController") as! StarWarsViewController
         
          
          return view
      }

}

  
