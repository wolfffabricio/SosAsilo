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
            exibeAlerta()
        }
        else if (enderecoTextField.text?.isEmpty ?? true){
            exibeAlerta()
        }
        else if (telefoneTextField.text?.isEmpty ?? true){
            exibeAlerta()
        }
        else if (cnpjTextField.text?.isEmpty ?? true){
            exibeAlerta()
        }
        else if (emailTextField.text?.isEmpty ?? true){
            exibeAlerta()
        }
        else if (senhaTextField.text?.isEmpty ?? true){
            exibeAlerta()
        }else{
            
            let asilo = Asilos(context: AppDelegate.persistentContainer.viewContext)
            asilo.nome = "12"
            asilo.email = emailTextField.text
            asilo.senha = senhaTextField.text
            asilo.photo = "bg.jpg"
            asilo.telefone = telefoneTextField.text
            asilo.cnpj = cnpjTextField.text
            asilo.site = "sitedoasilo"
            asilo.endereco = enderecoTextField.text
            asilo.sobre = "Sobre este asilo"
            asilo.indAlimentacao = 0.0
            asilo.indEntretenimento = 0.0
            asilo.indHigiene = 0.0
            asilo.indMedicamentos = 0.0
            print("preenchido")
            
            //AppDelegate.saveContext()
            
            self.ref.child("asilos").childByAutoId().setValue(["nome": nomeTextField.text!, "email": emailTextField.text!, "senha": senhaTextField.text!, "photo": "bg", "telefone": telefoneTextField.text!, "cnpj": cnpjTextField.text!, "site": "", "endereco": enderecoTextField.text!, "sobre": "", "indAlimentos": 0.0, "indEntretenimento": 0.0, "indHigiene": 0.0, "indMedicamentos": 0.0])
        }
    }
    
    func exibeAlerta (){
        let alert = UIAlertController(title: "Ops, algo errado", message: "Preencha todos os campos do seu cadastro", preferredStyle: .alert)
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
        
        AppDelegate.saveContext()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
