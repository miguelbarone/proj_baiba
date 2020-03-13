//
//  LoginViewController.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import RxSwift

class LoginViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var delegate: LoginViewControllerDelegate?
    var viewModel: LoginViewModelContract!
    var dispose = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         bind()
        
        
    }
    
    public class func create(delegate: LoginViewControllerDelegate, viewModel: LoginViewModel) -> LoginViewController {
        
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        view.delegate = delegate
        view.viewModel = viewModel
        return view
        
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text, !password.isEmpty, !email.isEmpty {
            
            self.viewModel.goLogin(email: email, password: password)
        }
        
    }
    
    func bind() {
        
        self.viewModel.loginResponse.drive(onNext: { (login) in
            if login == true {
                
                let vc = self.delegate?.didTouchButtonLogin()
                vc?.modalPresentationStyle = .fullScreen
                self.present(vc!, animated: true, completion: nil)
            }else{
                print("erro")
            }
            
        }).disposed(by: dispose)
        
    }
    
}

protocol LoginViewControllerDelegate {
    func didTouchButtonLogin() -> UIViewController
}

 

