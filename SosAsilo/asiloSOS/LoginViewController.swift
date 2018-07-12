//
//  LoginViewController.swift
//  asiloSOS
//
//  Created by Fabrício Wolff on 29/06/18.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var btEntrar: UIButton!
    @IBOutlet weak var iconLogin: UIImageView!
    @IBOutlet weak var viewLogin: UIView!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let request: NSFetchRequest<Asilos> = Asilos.fetchRequest()
        
        //let results = try! AppDelegate.persistentContainer.viewContext.fetch(request)
        
        
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        if (emailTextField.text?.isEmpty ?? true){
            exibeAlerta(erro: 3)
        }
        else if (senhaTextField.text?.isEmpty ?? true){
            exibeAlerta(erro: 3)
        }else{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: senhaTextField.text!) { (user, error) in
                if error != nil {
                    if let errCode = AuthErrorCode(rawValue: error!._code) {

                        switch errCode {
                        case .invalidEmail:
                            self.exibeAlerta(erro: 1)
                        case .wrongPassword:
                            self.exibeAlerta(erro: 1)
                        default:
                            self.exibeAlerta(erro: 2)
                        }

                    }

                }else{
                    self.dismiss(animated: true, completion: nil)
                }
                
            }

        }
    }
    func exibeAlerta (erro: Int){
        var description: String = ""
        if(erro == 1){
            description = "Dados inválidos"
        } else
        if(erro == 2){
            description = "Tente novamente"
        } else
        if(erro == 3){
            description = "Preencha seu email e senha"
        }
        
        let alert = UIAlertController(title: "Ops, algo errado", message: "\(description)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.senhaTextField.delegate = self
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationItem.title = "Login"
        
        //Cor da Borda
        emailTextField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        senhaTextField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        btEntrar.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
        //Espessura da borda
        emailTextField.layer.borderWidth = 1.0
        senhaTextField.layer.borderWidth = 1.0

        //Arredondamento
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderWidth = 1
        
        senhaTextField.layer.cornerRadius = 5
        senhaTextField.layer.borderWidth = 1
        
        btEntrar.layer.cornerRadius = 5
        btEntrar.layer.borderWidth = 1
        
        //Arrendondamento icon
        iconLogin.layer.borderWidth = 5
        iconLogin.layer.borderColor = UIColor(red: 0/255.0, green: 150.0/255.0, blue: 255.0/255.0, alpha: 1).cgColor
        iconLogin.layer.masksToBounds = true
        iconLogin.layer.cornerRadius = iconLogin.frame.width / 2
        
        //viewLogin.layer.masksToBounds = true
        viewLogin.layer.cornerRadius = 8
        
//        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email", attributes: [(kCTForegroundColorAttributeName as NSAttributedStringKey) as String: UIColor.white])
//        senhaTextField.attributedPlaceholder = NSAttributedString(string:"Senha", attributes: [(kCTForegroundColorAttributeName as NSAttributedStringKey) as String: UIColor.white])
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func btEntrar(_ sender: UIButton) {
        
    }
    
    @IBAction func btRegistrar(_ sender: UIButton) {

    }
}
