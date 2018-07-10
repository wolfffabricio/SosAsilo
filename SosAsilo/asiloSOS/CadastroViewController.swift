//
//  CadastroViewController.swift
//  asiloSOS
//
//  Created by Fabrício Wolff on 29/06/18.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit
import CoreData

class CadastroViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var icoCadastro: UIImageView!
    @IBOutlet weak var photoInst: UIImageView!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var cnpjTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var btCadastrar: UIButton!
    @IBOutlet weak var viewCadastro: UIView!
    
    var photo = "bg.jpeg"
    var nome = ""
    var endereco = ""
    var telefone = ""
    var cnpj = ""
    var email = ""
    var senha = ""
    
    
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
    
    //    func newInstituicao(nome: String, email: String, senha: String) -> Instituicao {
    //
    //        let instituicao = Instituicao(context: AppDelegate.persistentContainer.viewContext)
    //        instituicao.nome = nome
    //        instituicao.email = email
    //        instituicao.senha = senha
    //
    //        return instituicao
    //
    //    }
    
    
    @IBAction func btCadastrar(_ sender: UIButton) {
        //add db
        
        nome = nomeTextField.text!
        endereco = enderecoTextField.text!
        telefone = telefoneTextField.text!
        cnpj = cnpjTextField.text!
        email = emailTextField.text!
        senha = senhaTextField.text!
        
        AsiloModel.shared.data.append(Asilo(nomeInstituicao: nome, endereco: endereco, photo: photo, telefone: telefone, email: email, cnpj: cnpj, senha: senha))
        
        
        // DESCOMENTAR A FUNÇÃO A NEW ISNTUIÇÃO
        //        AsiloModel.shared.data.forEach { asilo in
        //            self.newInstituicao(nome: asilo.nomeInstituicao, email: asilo.email, senha: asilo.senha)
        //        }
        
        //let instituicaoBD = newInstituicoes()
        
        
        
        
        
    }
}
