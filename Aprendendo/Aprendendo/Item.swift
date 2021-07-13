//
//  Item.swift
//  Aprendendo
//
//  Created by Aline Miranda Dutra de Carvalho on 23/12/20.
//

import Foundation

class Item: NSObject {
    
    var nome: String
    var quantidade: Int = 0
    
    init(nome:String, quantidade: Int = 0){
        self.nome = nome
        self.quantidade = quantidade
    }
    
}
