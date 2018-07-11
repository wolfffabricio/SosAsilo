//
//  PerfilViewController.swift
//  asiloSOS
//
//  Created by Rodrigo Andreaza Lucas on 10/07/2018.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {
    
    @IBOutlet weak var valueAlimentos: UISlider!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        if segControl.selectedSegmentIndex == 0 {
            
        }
        else if (segControl.selectedSegmentIndex == 1){
            
            
        }else if (segControl.selectedSegmentIndex == 2){
            
            
        }else if (segControl.selectedSegmentIndex == 3){
            
        }
        
        
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        performSegue(withIdentifier: "editProfile", sender: nil)
    }
}
