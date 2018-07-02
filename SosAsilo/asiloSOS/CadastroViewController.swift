//
//  CadastroViewController.swift
//  asiloSOS
//
//  Created by Fabrício Wolff on 29/06/18.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var cnpjTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var btCadastrar: UIButton!
    
    override func viewDidLoad() {
        
        self.nomeTextField.delegate = self
        self.enderecoTextField.delegate = self
        self.telefoneTextField.delegate = self
        self.cnpjTextField.delegate = self
        self.emailTextField.delegate = self
        self.senhaTextField.delegate = self
        
        self.navigationItem.title = "Cadastro"
    
        nomeTextField.layer.borderColor = UIColor.white.cgColor
        enderecoTextField.layer.borderColor = UIColor.white.cgColor
        telefoneTextField.layer.borderColor = UIColor.white.cgColor
        cnpjTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.borderColor = UIColor.white.cgColor
        senhaTextField.layer.borderColor = UIColor.white.cgColor
        
        nomeTextField.layer.borderWidth = 1.0
        enderecoTextField.layer.borderWidth = 1.0
        telefoneTextField.layer.borderWidth = 1.0
        cnpjTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderWidth = 1.0
        senhaTextField.layer.borderWidth = 1.0
        
        btCadastrar.layer.cornerRadius = 5
        btCadastrar.layer.borderWidth = 1
        btCadastrar.layer.borderColor = UIColor.white.cgColor
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func btCadastrar(_ sender: UIButton) {
        
    }
}
