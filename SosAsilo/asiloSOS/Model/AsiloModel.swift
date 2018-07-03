import Foundation

struct AsiloModel {
    
    var data = [Asilo]()
    
    static public func asilos() -> AsiloModel {
        var model = AsiloModel()
        
        model.data.append(Asilo(nomeInstituicao: "Santo Antônio dos Excepcionais", endereco: "Av Ipiranga, 6681 - Partenon", photo: "bg.jpg", telefone: "3248-5150", email: "email@teste.com",cnpj: "teste" ,senha: "teste"))
        model.data.append(Asilo(nomeInstituicao: "Santo Antônio dos Excepcionais", endereco: "Av Ipiranga, 6681 - Partenon", photo: "bg.jpg", telefone: "3248-5150", email: "email@teste.com",cnpj: "teste" ,senha: "teste"))
        
        return model
    }
    
    
}
