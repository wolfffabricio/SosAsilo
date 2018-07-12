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

class PerfilEditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
let ref = Database.database().reference()
    
    
    
    @IBOutlet weak var txtSobre: UITextView!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var txtelefone: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var imgPhoto: UIImageView!
    
    //@IBOutlet weak var btnGallery: UIButton!
    
    
    let imagePicker = UIImagePickerController()
    
    
    
    @IBAction func btnGallery(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //   print(info)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgPhoto.image = image
            imagePicker.dismiss(animated: true, completion: nil)
        }
        
    }
    
    var nomeFB: String? = ""
    var emailFB: String? = ""
    var photoFB: String? = ""
    var indAlimentosFB: Double? = 0.0
    var indEntretenimentoFB: Double? = 0.0
    var indMedicamentosFB: Double? = 0.0
    var indHigieneFB: Double? = 0.0
    var txtSobreFB: String? = ""
    var sobreFB: String? = ""
    var cnpjFB: String? = ""
    var siteFB: String? = ""
    var telefoneFB: String? = ""
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mostraDados()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = "Cancelar"
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        imagePicker.delegate = self

    }


    @IBAction func segValueChange(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.slider.value = Float(self.indAlimentosFB!)
        }
        else if (sender.selectedSegmentIndex == 1){
            self.slider.value = Float(self.indEntretenimentoFB!)
        }
        else if (sender.selectedSegmentIndex == 2){
            self.slider.value = Float(self.indMedicamentosFB!)
        }
        else if (sender.selectedSegmentIndex == 3){
            self.slider.value = Float(self.indHigieneFB!)
        }

    }
    
    
    func mostraDados () {
        print(Auth.auth().currentUser!.uid)
        let value = Auth.auth().currentUser!
        ref.child("asilos").child(value.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            self.nomeFB = value?["nome"] as? String
            self.emailFB = value?["email"] as? String
            self.photoFB = value?["photo"] as? String
            self.indAlimentosFB = value?["indAlimentos"] as? Double
            self.indEntretenimentoFB = value?["indEntretenimento"] as? Double
            self.indMedicamentosFB = value?["indMedicamentos"] as? Double
            self.indHigieneFB = value?["indHigiene"] as? Double
            self.txtSobreFB = value?["sobre"] as? String
            self.sobreFB = value?["sobre"] as? String
            self.cnpjFB = value?["cnpj"] as? String
            self.siteFB = value?["site"] as? String
            self.telefoneFB = value?["telefone"] as? String
            
            self.txtSobre.text = self.sobreFB
            self.slider.value = Float(self.indAlimentosFB!)
            
            
            
            
        }) { (error) in
            // self.exibeAlerta()
        }
        
        
    }
    
//    func salvarDados () {
//
//    }
    
    
    @IBAction func btnSalvar(_ sender: UIBarButtonItem) {
        let ref = Database.database().reference().child("asilos").child(Auth.auth().currentUser!.uid)
        ref.updateChildValues([
            "sobre": self.txtSobre.text,
            "email": self.txtemail.text!,
            "telefone": self.txtelefone.text!
           // "indAlimentos":
            ])
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
