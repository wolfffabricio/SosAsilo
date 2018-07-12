//
//  SecondViewController.swift
//  asiloSOS
//
//  Created by Victor Orestes Impérico on 28/06/2018.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit
import CircleProgressView

class SecondViewController: UIViewController {
    @IBOutlet weak var AsiloTableView: UITableView!
    var asilo: Asilo!
    @IBOutlet weak var viewCircles: UIView!
    @IBOutlet weak var photoAsilo: UIImageView!
    @IBOutlet weak var loaderAlimentos: CircleProgressView!
    @IBOutlet weak var viewInfo: UIView!
    
    @IBOutlet weak var labelAlimentacao: UILabel!
    
    @IBOutlet weak var labelHigiene: UILabel!
    @IBOutlet weak var labelMedicamentos: UILabel!
    @IBOutlet weak var labelEntretenimento: UILabel!
    @IBOutlet weak var circleMedicamentos: CircleProgressView!
    @IBOutlet weak var circleHigiene: CircleProgressView!
    @IBOutlet weak var circleEntretenimento: CircleProgressView!
    @IBOutlet weak var circleAlimentos: CircleProgressView!
    @IBOutlet weak var txtSobre: UILabel!
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        
        viewCircles.layer.cornerRadius = 4
        viewInfo.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = asilo.nome
    
        photoAsilo.image = UIImage(named: "\(asilo.photo)")
        txtSobre.text = asilo.sobre
        circleAlimentos.setProgress(asilo.indAlimentacao, animated: true)
        circleEntretenimento.setProgress(asilo.indEntretenimento, animated: true)
        circleHigiene.setProgress(asilo.indHigiene, animated: true)
        circleMedicamentos.setProgress(asilo.indMedicamentos, animated: true)
        
        self.labelAlimentacao.text = String(Int(asilo.indAlimentacao * 100))+"%"
        self.labelHigiene.text = String(Int(asilo.indHigiene * 100))+"%"
        self.labelMedicamentos.text = String(Int(asilo.indMedicamentos * 100))+"%"
        self.labelEntretenimento.text = String(Int(asilo.indEntretenimento * 100))+"%"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        circleAlimentos.setProgress(0, animated: false)
        circleEntretenimento.setProgress(0, animated: false)
        circleHigiene.setProgress(0, animated: false)
        circleMedicamentos.setProgress(0, animated: false)
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
