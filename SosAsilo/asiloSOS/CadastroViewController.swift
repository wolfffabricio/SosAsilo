//
//  CadastroViewController.swift
//  asiloSOS
//
//  Created by Fabrício Wolff on 29/06/18.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth

class CadastroViewController: UIViewController {
    
    let ref = Database.database().reference()
    
    @IBOutlet weak var icoCadastro: UIImageView!
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var cnpjTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var btCadastrar: UIButton!
    @IBOutlet weak var viewCadastro: UIView!
    
    @IBAction func btnCadastra(_ sender: UIButton) {
        if (nomeTextField.text?.isEmpty ?? true){
            exibeAlerta(erro: 1)
        }
        else if (enderecoTextField.text?.isEmpty ?? true){
            exibeAlerta(erro: 1)
        }
        else if (telefoneTextField.text?.isEmpty ?? true){
            exibeAlerta(erro: 1)
        }
        else if (cnpjTextField.text?.isEmpty ?? true){
            exibeAlerta(erro: 1)
        }
        else if (emailTextField.text?.isEmpty ?? true){
            exibeAlerta(erro: 1)
        }
        else if (senhaTextField.text?.isEmpty ?? true){
            exibeAlerta(erro: 1)
        }
        else if (senhaTextField.text!.count < 6){
            exibeAlerta(erro: 2)
        }
        else if (!emailTextField.text!.validateEmail()){
            exibeAlerta(erro: 3)
        }else{
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: senhaTextField.text!) { (user, error) in
                if error == nil {
                    let user = Auth.auth().currentUser
                    let uid = user!.uid
                    
                    self.ref.child("asilos").child(uid).setValue([
                      "nome": self.nomeTextField.text!,
                      "photo": "bg",
                      "telefone": self.telefoneTextField.text!,
                      "cnpj": self.cnpjTextField.text!,
                      "site": "",
                      "endereco": self.enderecoTextField.text!,
                      "sobre": "",
                      "indAlimentos": 0.0,
                      "indEntretenimento": 0.0,
                      "indHigiene": 0.0,
                      "indMedicamentos": 0.0])
                    
                    self.dismiss(animated: false, completion: nil)
                }else{
                    print(error!.localizedDescription.description)
                }}
            
            //performSegue(withIdentifier: "mostraPerfil", sender: asilo)
        }
    }
    
    func exibeAlerta (erro: Int){
        var description: String = ""
        if(erro == 1){
            description = "Preencha todos os campos"
        } else
            if(erro == 2){
                description = "Senha deve conter no mínimo 6 caracteres"
        }else
            if(erro == 3){
                description = "Email inválido"
        }
        
        let alert = UIAlertController(title: "Ops, algo errado", message: "\(description)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
//    @IBAction func saveItem(_ sender: Any) {
//
//        guard let enteredText = nomeTextField?.text else {
//            return
//        }
//
//
//            guard let entryText = nomeTextField?.text else {
//                return
//            }
//
//            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//            let newEntry = Item(context: context)
//            newEntry.name = entryText
//
//            (UIApplication.shared.delegate as! AppDelegate).saveContext()
//
//            dismiss(animated: true, completion: nil)
//
//        }
//
//    }
    
    override func viewDidLoad() {
        
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
        
        viewCadastro.layer.cornerRadius = 8
        
        //Arrendondamento icon
        icoCadastro.layer.borderWidth = 5
        icoCadastro.layer.borderColor = UIColor(red: 0/255.0, green: 150.0/255.0, blue: 255.0/255.0, alpha: 1).cgColor
        icoCadastro.layer.masksToBounds = true
        icoCadastro.layer.cornerRadius = icoCadastro.frame.width / 2
        //implementando db - Rodrigo Andreaza
        
        //AppDelegate.saveContext()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
extension String {
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}
