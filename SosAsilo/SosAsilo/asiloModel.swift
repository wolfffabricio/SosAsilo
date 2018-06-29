import Foundation
import UIKit

struct asiloModel {
    
    var data = [Asilo]()
    
    static public func asilos() -> asiloModel{
        var model = asiloModel()
        
        let voluntarios = voluntarioModel.voluntarios().data
        
        let asilos = [
            Asilo(nomeInstituicao: "teste", endereco: "av. teste", photo: #imageLiteral(resourceName: "Reprod-Poa-24-horas-409"), telefone: "3248-5150", email: "@teste",cnpj: "teste" ,senha: "teste", voluntarios: voluntarios)]
        
        model.data = asilos
        return model
        }
}
