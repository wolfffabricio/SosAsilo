//
//  NotificationViewController.swift
//  asiloSOS
//
//  Created by Fabrício Wolff on 04/07/18.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let model = NotificationModel.createNotification()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = 80
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! ListaNotificationCell
        
        
        let notification = model.data[indexPath.row]
        
        cell.view.layer.cornerRadius = 4
        
        cell.titleNotification.text = notification.title
        cell.textNotification.text = notification.text
        cell.photoNotification.image = UIImage(named: "\(notification.photo)")
    
        
        return cell
    }
}
