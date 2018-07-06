//
//  SecondViewController.swift
//  asiloSOS
//
//  Created by Victor Orestes Impérico on 28/06/2018.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var AsiloTableView: UITableView!
    var asilo: Asilo!
    @IBOutlet weak var photoAsilo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoAsilo.image = UIImage(named: "\(asilo.photo)")

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
