//
//  LoginViewController.swift
//  asiloSOS
//
//  Created by Fabrício Wolff on 29/06/18.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var btEntrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.senhaTextField.delegate = self
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.navigationItem.title = "Login"
        
        emailTextField.layer.borderColor = UIColor.white.cgColor
        senhaTextField.layer.borderColor = UIColor.white.cgColor
        
        emailTextField.layer.borderWidth = 1.0
        senhaTextField.layer.borderWidth = 1.0

        
        btEntrar.layer.cornerRadius = 5
        btEntrar.layer.borderWidth = 1
        btEntrar.layer.borderColor = UIColor.white.cgColor
        
        
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email", attributes: [kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.white])
        senhaTextField.attributedPlaceholder = NSAttributedString(string:"Senha", attributes: [kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.white])
        
    }
    
    @IBAction func btEntrar(_ sender: UIButton) {
        
    }
    
    @IBAction func btRegistrar(_ sender: UIButton) {

    }
}
