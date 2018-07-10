import Foundation

struct AsiloModel {
    
    static var shared: AsiloModel = {
        
        var model = AsiloModel()
        
        model.data.append(Asilo(id: "234",nome: "Lar de Idosos Santa Ana", email: "email@gmail.com", senha: "12345", photo: "bg.jpg", telefone: "(51) 3315-3408", cnpj: "05.418.914/0001-90" ,site: "www", endereco: "Rua Tal", sobre: "Sobre Lar de Idosos Santa Ana", indAlimentacao: 0.3, indEntretenimento: 0.4, indHigiene: 0.7,indMedicamentos: 0.9))
        model.data.append(Asilo(id: "234",nome: "Lar Maria de Nazaré", email: "email@gmail.com", senha: "12345", photo: "asilo1", telefone: "(51) 3209-3932", cnpj: "05.418.914/0001-90" ,site: "www", endereco: "Av. Cel. Lucas de Oliveira, 2746 - Petrópolis", sobre: "Sobre Lar de Idosos Santa Ana", indAlimentacao: 0.3, indEntretenimento: 0.4, indHigiene: 0.7,indMedicamentos: 0.9))
        model.data.append(Asilo(id: "234",nome: "Lar Dom Guanella", email: "email@gmail.com", senha: "12345", photo: "asilo2", telefone: "(51) 3372-6957", cnpj: "05.418.914/0001-90" ,site: "www", endereco: "Rua Tenente Ary Tarragô - Alto Petrópolis", sobre: "Sobre Lar de Idosos Santa Ana", indAlimentacao: 0.3, indEntretenimento: 0.4, indHigiene: 0.7,indMedicamentos: 0.9))
        
        
        
        
        
        model.data.append(Asilo(id: "234",nome: "Asilo Santa Bárbara", email: "email@gmail.com", senha: "12345", photo: "asilo3", telefone: "(51) 3453-7793", cnpj: "05.418.914/0001-90" ,site: "www", endereco: "R. Taquara, 48 - Walderez", sobre: "Sobre Lar de Idosos Santa Ana", indAlimentacao: 0.3, indEntretenimento: 0.4, indHigiene: 0.7,indMedicamentos: 0.9))
        model.data.append(Asilo(id: "234",nome: "Asilo Padre Cacique", email: "email@gmail.com", senha: "12345", photo: "asilo4", telefone: "(51) 3233-7571", cnpj: "05.418.914/0001-90" ,site: "www", endereco: "Av. Padre Cacique, 1178 - Menino Deus", sobre: "Sobre Lar de Idosos Santa Ana", indAlimentacao: 0.3, indEntretenimento: 0.4, indHigiene: 0.7,indMedicamentos: 0.9))
        model.data.append(Asilo(id: "234",nome: "Asilo Nossa Senhora Medianeira", email: "email@gmail.com", senha: "12345", photo: "asilo5", telefone: "(51) 3315-3408", cnpj: "05.418.914/0001-90" ,site: "www", endereco: "R. Amazonas, 975 - Neópolis", sobre: "Sobre Lar de Idosos Santa Ana", indAlimentacao: 0.3, indEntretenimento: 0.4, indHigiene: 0.7,indMedicamentos: 0.9))
        
        
        return model
    }()
    
    var data = [Asilo]()
    
}
