//
//  ViewController.swift
//  Demo-iOS
//
//  Created by Mukesh Thawani on 13/11/16.
//  Copyright © 2016 Mukesh Thawani. All rights reserved.
//

import UIKit
import FAQView

class FAQViewController: UIViewController {
    
    var faqView: FAQView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FAQs"
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.buttonPressed(_:)))
        navigationItem.leftBarButtonItem = rightBarButton
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        let items = [FAQItem(question: "O que significa as porcentagens presentes no app?", answer: "As porcentagens indicam o grau de necessidade de cada suprimento. Não confunda com a quantidade em estoque."), FAQItem(question: " Como saber se a porcentagem de suprimentos dos asilos está boa ou ruim?",answer: "Nós criamos indicadores para auxiliar tanto o usuário como a instituição:\n \n - 0% a 33% = ruim\n - 33% a 66% = médio\n - 66% a 100% = bom"), FAQItem(question: "Eu sou voluntário, posso realizar cadastro?", answer: "Não, por enquanto apenas instituições podem realizar cadastro, mas estamos trabalhando na criação de uma área do voluntário 🙂"), FAQItem(question: "Como posso ajudar um asilo?", answer: "Nós queremos ajudar a todos, portanto, quanto mais pessoas contribuirem, melhor. Tanto instituições como voluntários podem doar, verificando a necessidade dos asilos, por fim entrando em contato com o este para realizar a ação.")]
        
        faqView = FAQView(frame: view.frame, items: items)
        faqView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(faqView)
        addFaqViewConstraints()
    }
    
    
    func addFaqViewConstraints() {
        let faqViewTrailing = NSLayoutConstraint(item: faqView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 17)
        let faqViewLeading = NSLayoutConstraint(item: faqView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: -17)
        let faqViewTop = NSLayoutConstraint(item: faqView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 50)
        let faqViewBottom = NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: faqView, attribute: .bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([faqViewTop, faqViewBottom, faqViewLeading, faqViewTrailing])
    }
    
    @objc func buttonPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "backToFirst", sender: self)
    }
    
}
