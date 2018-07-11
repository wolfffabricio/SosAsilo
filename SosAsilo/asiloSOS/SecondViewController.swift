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
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        photoAsilo.image = UIImage(named: "\(asilo.photo)")
        viewCircles.layer.cornerRadius = 4
        viewInfo.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
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
