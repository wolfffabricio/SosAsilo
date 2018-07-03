//
//  ViewController.swift
//  asiloSOS
//
//  Created by Victor Orestes Impérico on 28/06/2018.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit
import UserNotifications

<<<<<<< HEAD
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UNUserNotificationCenterDelegate {
    
    var timer = Timer()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TopBar: UINavigationItem!
    @IBOutlet weak var listaGeralTable: UITableView!
    
=======
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var topBar: UINavigationItem!
>>>>>>> 971c167687c907b2ec533de4574c16fff4c0cda2
    let model = AsiloModel.asilos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        self.tableView.rowHeight = 210
=======
<<<<<<< HEAD
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { didAllow, error in})
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.rowHeight = 80.0
//        UIApplication.shared.applicationIconBadgeNumber = 0
        
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
    }
    
    @objc func appMovedToBackground() {
        startTimer()
    }
    
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
            self.sendNotification()
        })
    }
    
    func sendNotification() {
=======
        self.tableViewGeral.rowHeight = 210
>>>>>>> ec151772918a373cc9445d5c6cf5a8c59682fcdd
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
>>>>>>> 971c167687c907b2ec533de4574c16fff4c0cda2
        
        let content = UNMutableNotificationContent()
        content.title = "ATENÇÃO"
        content.body = "O asilo Padre Cacique precisa de ajuda"

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
<<<<<<< HEAD
        tableView.dataSource = self
        tableView.delegate = self
=======
<<<<<<< HEAD
        let content2 = UNMutableNotificationContent()
        content2.title = "O FRIO CHEGOU!!"
        content2.body = "O asilo Novo Lar precisa de agasalhos"
        
        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request2 = UNNotificationRequest(identifier: "timer", content: content2, trigger: trigger2)
        
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(model.data.count)
        return model.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "asilosCell") as! listaGeralCell
=======
        tableViewGeral.dataSource = self
        tableViewGeral.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
>>>>>>> ec151772918a373cc9445d5c6cf5a8c59682fcdd
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
<<<<<<< HEAD
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

=======
>>>>>>> 971c167687c907b2ec533de4574c16fff4c0cda2
>>>>>>> ec151772918a373cc9445d5c6cf5a8c59682fcdd
        
        
        let asilo = model.data[indexPath.row]
        
        cell.layer.cornerRadius = 8
        
        cell.labelNome.text = asilo.nomeInstituicao
        cell.labelEndereco.text = asilo.endereco
        cell.photoAsilo.image = UIImage(named: "\(asilo.photo)")
        
        
        return cell
        
    }
}

//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//}
