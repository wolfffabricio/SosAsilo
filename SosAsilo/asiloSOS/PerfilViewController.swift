//
//  PerfilViewController.swift
//  asiloSOS
//
//  Created by Arildo Borges Junior on 11/07/2018.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PerfilViewController: UIViewController {
    let ref = Database.database().reference()

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
        performSegue(withIdentifier: "mostraLogin", sender: txtSobre)
        
        ref.child("asilos").child("-LH8jpKW7aQaHN73QiF1").observeSingleEvent(of: .value, with: { (snapshot) in
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
            self.txtContato.text = "\(telefoneFB!)\n\(emailFB!)\n\(siteFB!)"
            // ...
        }) { (error) in
            self.exibeAlerta()
        }

        // Do any additional setup after loading the view.
    }
    
    func exibeAlerta (){
        let alert = UIAlertController(title: "Ops, algo errado", message: "Tente novamente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            
        })
        
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
