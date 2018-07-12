//
//  ViewController.swift
//  asiloSOS
//
//  Created by Victor Orestes Impérico on 28/06/2018.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit
import UserNotifications
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UNUserNotificationCenterDelegate {
    
    var timer = Timer()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topBar: UINavigationItem!
    
    var asilos = [Asilo]()
    let ref = Database.database().reference()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Remove título do back button
        let backItem = UIBarButtonItem()
        backItem.title = nil
        navigationItem.backBarButtonItem = backItem
        
        self.tableView.rowHeight = 210
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { didAllow, error in})
        
        tableView.dataSource = self
        tableView.delegate = self
        getAsilos()
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //getAsilos()
    }
    
    func sendNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "ATENÇÃO‼"
        content.body = "O asilo Padre Cacique precisa de ajuda 👵🏻"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        let content2 = UNMutableNotificationContent()
        content2.title = "O FRIO CHEGOU‼ ☃️"
        content2.body = "O asilo Novo Lar precisa de agasalhos 🧣"
        
        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request2 = UNNotificationRequest(identifier: "timer", content: content2, trigger: trigger2)
        
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asilos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "asilosCell") as! listaGeralCell
        
        
        let dados = asilos[indexPath.row]
        
        cell.view.layer.cornerRadius = 4
        
        cell.labelNome.text = dados.nome
        cell.labelEndereco.text = dados.endereco
        cell.photoAsilo.image = UIImage(named: "\(dados.photo)")
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dados = asilos[indexPath.row]
        
        performSegue(withIdentifier: "mostraDetalhes", sender: dados)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondViewController, segue.identifier == "mostraDetalhes"{
            guard let asilo = sender as? Asilo else {return}
            vc.asilo = asilo
        }
    }
    
    func getAsilos() {
        asilos.removeAll()
        
        ref.child("asilos").queryOrderedByKey().observeSingleEvent(of: .value, with: { (snapshot) in
            
            for snap in snapshot.children {
                
                let userSnap = snap as! DataSnapshot
                let uid = userSnap.key
                let userDict = userSnap.value as! [String:AnyObject]
                let nome = userDict["nome"] as! String
                let email = userDict["email"] as! String
                let cnpj = userDict["cnpj"] as! String
                let endereco = userDict["endereco"] as! String
                let indAlimentos = userDict["indAlimentos"] as! Double
                let indEntretenimento = userDict["indEntretenimento"] as! Double
                let indHigiene = userDict["indHigiene"] as! Double
                let indMedicamentos = userDict["indMedicamentos"] as! Double
                let photo = userDict["photo"] as! String
                let site = userDict["site"] as! String
                let sobre = userDict["sobre"] as! String
                let telefone = userDict["telefone"] as! String
                
                let asiloGet = Asilo(id: uid,nome: nome,email: email, photo: photo, telefone: telefone,cnpj: cnpj ,site: site,endereco: endereco,sobre: sobre,indAlimentacao: indAlimentos,indEntretenimento: indEntretenimento,indHigiene: indHigiene,indMedicamentos: indMedicamentos)
                self.asilos.append(asiloGet)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
           
            }
        })
        
        
        
    
    }
    
    
}

//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//}
