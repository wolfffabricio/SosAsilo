//
//  ViewController.swift
//  asiloSOS
//
//  Created by Victor Orestes Impérico on 28/06/2018.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var topBar: UINavigationItem!
    let model = AsiloModel.asilos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 210
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        let content = UNMutableNotificationContent()
        content.title = "ATENÇÃO"
        content.body = "O asilo Padre Cacique precisa de ajuda"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print(model.data.count)
            return model.data.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "asilosCell") as! listaGeralCell
            
            
            let asilo = model.data[indexPath.row]
            
            cell.view.layer.cornerRadius = 4
            
            cell.labelNome.text = asilo.nomeInstituicao
            cell.labelEndereco.text = asilo.endereco
            cell.photoAsilo.image = UIImage(named: "\(asilo.photo)")
            
    
            return cell
            
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let asilo = model.data[indexPath.row]
            performSegue(withIdentifier: "mostraDetalhes", sender: asilo)
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let vc = segue.destination as? SecondViewController, segue.identifier == "mostraDetalhes"{
                guard let asilo = sender as? Asilo else {return}
                vc.asilo = asilo
            }
        }

        
        
        

}

//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//}
