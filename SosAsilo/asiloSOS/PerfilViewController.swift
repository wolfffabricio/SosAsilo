//
//  PerfilViewController.swift
//  asiloSOS
//
//  Created by Arildo Borges Junior on 11/07/2018.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class PerfilViewController: UIViewController {
    let ref = Database.database().reference()
    

    @IBAction func logout(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    performSegue(withIdentifier: "mostraLogin", sender: self)
                } catch let signOutError as NSError {
                    print ("Error signing out: %@", signOutError)
                }
    }
    @IBOutlet weak var labelAlimentacao: UILabel!
    @IBOutlet weak var labelEntretenimento: UILabel!
    @IBOutlet weak var labelMedicamentos: UILabel!
    @IBOutlet weak var labelHigiene: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var indAlimentacao: CircleProgressView!
    @IBOutlet weak var indEntretenimento: CircleProgressView!
    @IBOutlet weak var indMedicamentos: CircleProgressView!
    @IBOutlet weak var indHigiene: CircleProgressView!
    @IBOutlet weak var txtSobre: UILabel!
    @IBOutlet weak var txtContato: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func mostraDados () {
        print(Auth.auth().currentUser!.uid)
        let value = Auth.auth().currentUser!
        ref.child("asilos").child(value.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let nomeFB = value?["nome"] as? String
            let emailFB = value?["email"] as? String
            let photoFB = value?["photo"] as! String
            let indAlimentosFB = value?["indAlimentos"] as! Double
            let indEntretenimentoFB = value?["indEntretenimento"] as! Double
            let indMedicamentosFB = value?["indMedicamentos"] as! Double
            let indHigieneFB = value?["indHigiene"] as! Double
            let txtSobreFB = value?["sobre"] as? String
            let sobreFB = value?["sobre"] as? String
            let cnpjFB = value?["cnpj"] as? String
            let siteFB = value?["site"] as? String
            let telefoneFB = value?["telefone"] as? String
            
            self.indAlimentacao.setProgress(indAlimentosFB, animated: true)
            self.indEntretenimento.setProgress(indEntretenimentoFB, animated: true)
            self.indMedicamentos.setProgress(indMedicamentosFB, animated: true)
            self.indHigiene.setProgress(indHigieneFB, animated: true)
            
            
            self.labelAlimentacao.text = String(Int(indAlimentosFB * 100))+"%"
            self.labelEntretenimento.text = String(Int(indEntretenimentoFB * 100))+"%"
            self.labelHigiene.text = String(Int(indHigieneFB * 100))+"%"
            self.labelMedicamentos.text = String(Int(indMedicamentosFB * 100))+"%"
            
            self.txtSobre.text = sobreFB
            self.photo.image = UIImage(named: "\(photoFB)")
            self.txtContato.text = "\(telefoneFB!)\n\(Auth.auth().currentUser!.email!)\n\(siteFB!)"
            // ...
        }) { (error) in
            self.exibeAlerta()
        }

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Cancelar"
        navigationItem.backBarButtonItem = backItem
    }
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            mostraDados()
        } else {
            self.performSegue(withIdentifier: "mostraLogin", sender: self)
        }
    }
    
    func exibeAlerta (){
        let alert = UIAlertController(title: "Ops, algo errado", message: "Tente novamente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            
        })
        
        self.present(alert, animated: true, completion: nil)
    }
}
