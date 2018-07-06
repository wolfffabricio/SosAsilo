import Foundation

struct AsiloModel {
    
    var data = [Asilo]()
    
    static public func asilos() -> AsiloModel {
        var model = AsiloModel()
        
        model.data.append(Asilo(nomeInstituicao: "Lar de Idosos Santa Ana", endereco: "Rua Waldomiro Schapke - Intercap", photo: "bg.jpg", telefone: "(51) 3315-3408", email: "email@teste.com",cnpj: "teste" ,senha: "teste"))
        model.data.append(Asilo(nomeInstituicao: "Lar Maria de Nazaré", endereco: "Av. Cel. Lucas de Oliveira, 2746 - Petrópolis", photo: "asilo1", telefone: " (51) 3209-3932", email: "email@teste.com",cnpj: "teste" ,senha: "teste"))
        model.data.append(Asilo(nomeInstituicao: "Lar Dom Guanella", endereco: "Rua Tenente Ary Tarragô - Alto Petrópolis", photo: "asilo2", telefone: "(51) 3372-6957", email: "email@teste.com",cnpj: "teste" ,senha: "teste"))
        model.data.append(Asilo(nomeInstituicao: "Asilo Santa Bárbara", endereco: "R. Taquara, 48 - Walderez", photo: "asilo3", telefone: "(51) 3453-7793", email: "email@teste.com",cnpj: "teste" ,senha: "teste"))
        model.data.append(Asilo(nomeInstituicao: "Asilo Padre Cacique", endereco: "Av. Padre Cacique, 1178 - Menino Deus", photo: "asilo4", telefone: "(51) 3233-7571", email: "email@teste.com",cnpj: "teste" ,senha: "teste"))
        model.data.append(Asilo(nomeInstituicao: "Asilo Nossa Senhora Medianeira", endereco: "R. Amazonas, 975 - Neópolis", photo: "asilo5", telefone: " (51) 3043-5602", email: "email@teste.com",cnpj: "teste" ,senha: "teste"))
        model.data.append(Asilo(nomeInstituicao: "Asilo Lar da Fraternidade", endereco: "R. Pedro Álvares Cabral, 225 - Nossa Sra. das Gracas", photo: "asilo6", telefone: "(51) 3463-3435", email: "email@teste.com",cnpj: "teste" ,senha: "teste"))
        
        return model
    }
    
    
}
