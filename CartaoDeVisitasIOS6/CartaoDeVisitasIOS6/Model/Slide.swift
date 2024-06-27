//
//  Slide.swift
//  CartaoDeVisitasIOS6
//
//  Created by Ana Carolina Barbosa de Souza on 26/06/24.
//

import Foundation

struct Slide {
    let imageName: String
    let title: String
    let description: String
    
    static let collection: [Slide] = [
    Slide(imageName: "onboarding1", title: "Bem-vindo(a)!", description: "Seu cartão de visitas a um clique!"),
    Slide(imageName: "onboarding4", title: "Facilidade", description: "Um cartão de visitas é uma ferramenta muito importante para o networking. E na era digital, porque não um virtual?"),
    Slide(imageName: "onboarding3", title: "Sustentabilidade", description: "Por ser digital, reduz a necessidade de impressão, contribuindo para um ambiente mais sustentável.")



    ]

}
