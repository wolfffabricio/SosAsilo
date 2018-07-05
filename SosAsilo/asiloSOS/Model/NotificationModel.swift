//
//  NotificationModel.swift
//  asiloSOS
//
//  Created by Fabrício Wolff on 04/07/18.
//  Copyright © 2018 Apple Developer Academy. All rights reserved.
//

import Foundation

struct NotificationModel {
    var data = [Notifications]()
    
    static public func createNotification() -> NotificationModel {
        var model = NotificationModel()
        
        model.data.append(Notifications(photo: "bg.jpg", title: "Alerta de emergência", text: "O Lar de Idosos Santa Ana está com situação precária de medicamentos"))
        model.data.append(Notifications(photo: "bg.jpg", title: "Temos novidades para você", text: "Novos asilos entraram para nossa lista de ajuda"))
        model.data.append(Notifications(photo: "bg.jpg", title: "Está na hora da companhia", text: "O asilo Santa Bárbara terá eventos para essa semana"))
        model.data.append(Notifications(photo: "bg.jpg", title: "Precisamos de doações", text: "Estamos com instituições precisando de ajuda"))
        model.data.append(Notifications(photo: "bg.jpg", title: "Hey!!", text: "O Lar Maria de Nazaré precisa de você"))
        model.data.append(Notifications(photo: "bg.jpg", title: "O FRIO CHEGOU!!", text: "O asilo Novo Lar precisa de agasalhos"))
        model.data.append(Notifications(photo: "bg.jpg", title: "ATENÇÃO", text: "O asilo Padre Cacique precisa de ajuda"))
        
        return model
    }
}
