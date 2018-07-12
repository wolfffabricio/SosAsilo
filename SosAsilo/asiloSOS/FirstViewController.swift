//
//  FirstViewController.swift
//  asiloSOS
//
//  Created by Victor Orestes Impérico on 09/07/2018.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import UIKit
import RevealingSplashView
import FirebaseAuth

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad() 
        
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "cardiogram"),iconInitialSize: CGSize(width: 123, height: 123), backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:1.0))
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.animationType = .heartBeat
        revealingSplashView.animationType = .popAndZoomOut
        revealingSplashView.startAnimation(){
            print("Completed")
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.65) {
            
            self.performSegue(withIdentifier: "show", sender: nil)
        }
        
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
