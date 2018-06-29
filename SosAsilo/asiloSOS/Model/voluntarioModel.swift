import Foundation
import UIKit

struct voluntarioModel {
    
    var data = [Voluntario]()
    static public func voluntarios() -> voluntarioModel{
        var model = voluntarioModel()
        
        let discVoluntario = [Voluntario(nome: "victor", email: "@teste", senha: "teste")]
        
         model.data = discVoluntario
        
        return model
   }
}
