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
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var delegate: LoginViewControllerDelegate?
    var viewModel: LoginViewModelContract!
    var dispose = DisposeBag()
    
    var iconClick = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eyePasswordButton()
        bind()

        let myColor = UIColor.white
        loginButton.layer.borderColor = myColor.cgColor

        loginButton.layer.borderWidth = 1.0
        
       
        
        emailTextField.layer.masksToBounds = false
        emailTextField.layer.shadowRadius = 3.0
        emailTextField.layer.shadowColor = UIColor.black.cgColor
        emailTextField.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        emailTextField.layer.shadowOpacity = 1.0
        
        passwordTextField.layer.masksToBounds = false
        passwordTextField.layer.shadowRadius = 3.0
        passwordTextField.layer.shadowColor = UIColor.black.cgColor
        passwordTextField.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        passwordTextField.layer.shadowOpacity = 1.0
        
        alertView.layer.masksToBounds = false
        alertView.layer.shadowRadius = 7.0
        alertView.layer.shadowColor = UIColor.red.cgColor
        alertView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        
        alertView.layer.shadowOpacity = 5.0
        alertView.layer.borderWidth = 2
        alertView.layer.borderColor = (UIColor(named: "alert")?.cgColor )
        alertView.layer.cornerRadius = 12
        
        loginButton.layer.borderColor = (UIColor(named: "yellowbutton")?.cgColor as! CGColor)
        loginButton.layer.cornerRadius = 21
        
        alertView.isHidden = true
        
        emailTextField.attributedPlaceholder = NSAttributedString(string:"E-MAIL", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholder")])
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"SENHA", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholder")])
//        passwordTextField.layer.shadowPath.
         
        

    }
    
    func eyePasswordButton() {
        eyeButton.rx.tap.bind {
            if(self.iconClick == true) {
                self.passwordTextField.isSecureTextEntry = false
                self.iconClick = false
                self.eyeButton.setImage(UIImage(named: "ic_visibility_off"), for: .normal)
                
            } else {
                self.passwordTextField.isSecureTextEntry = true
                self.iconClick = true
                self.eyeButton.setImage(UIImage(named: "ic_visibility"), for: .normal)
                
                
            }
        }.disposed(by: dispose)
    }
    
    
    
    
    public class func create(delegate: LoginViewControllerDelegate, viewModel: LoginViewModel) -> LoginViewController {
        
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        view.delegate = delegate
        view.viewModel = viewModel
        return view
        
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text, !password.isEmpty, !email.isEmpty, password.count <= 8 {
            viewModel.goLogin(email: email, password: password)
        } else {
            
            alertView.isHidden = false
//            let alert = UIAlertController(title: "Campos incorretos!", message: "Preencha todos os campos, ou verifique se inseriu os dados corretos.", preferredStyle: .alert)
//
//                 alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//
//                 self.present(alert, animated: true)
            
            
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
    
    @IBAction func resetPasswordButton(_ sender: Any) {
        
        let vc = ResetPasswordViewController.instantiate(viewModel: ResetViewModel(usecase: ResetPasswordUseCase(resetRepository: ResetPasswordRepositoryImpl())))
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
        
    }
}

protocol LoginViewControllerDelegate {
    func didTouchButtonLogin() -> ChooseSideViewController
}

 

