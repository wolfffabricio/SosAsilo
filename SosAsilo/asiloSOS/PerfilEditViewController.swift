//
//  PerfilEditViewController.swift
//  asiloSOS
//
//  Created by Fabrício Wolff on 12/07/18.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class PerfilEditViewController: UIViewController {
let ref = Database.database().reference()
    
    
    
    @IBOutlet weak var txtSobre: UITextView!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var txtelefone: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
                
//                self.indAlimentacao.setProgress(indAlimentosFB, animated: true)
//                self.indEntretenimento.setProgress(indEntretenimentoFB, animated: true)
//                self.indMedicamentos.setProgress(indMedicamentosFB, animated: true)
//                self.indHigiene.setProgress(indHigieneFB, animated: true)
//                
//                
//                self.labelAlimentacao.text = String(Int(indAlimentosFB * 100))+"%"
//                self.labelEntretenimento.text = String(Int(indEntretenimentoFB * 100))+"%"
//                self.labelHigiene.text = String(Int(indHigieneFB * 100))+"%"
//                self.labelMedicamentos.text = String(Int(indMedicamentosFB * 100))+"%"
//                
//                self.txtSobre.text = sobreFB
//                self.photo.image = UIImage(named: "\(photoFB)")
//                self.txtContato.text = "\(telefoneFB!)\n\(Auth.auth().currentUser!.email!)\n\(siteFB!)"
//                // ...
            }) { (error) in
                // self.exibeAlerta()
            }
            
            
        }
        
        
    }


   
}
