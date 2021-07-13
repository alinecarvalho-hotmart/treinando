//
//  imcViewController.swift
//  Aprendendo
//
//  Created by Aline Miranda Dutra de Carvalho on 05/01/21.
//

import Foundation
import UIKit


class imcViewController: UIViewController {
    
    
    @IBOutlet weak var pesoTextField: UITextField?
    @IBOutlet weak var alturaTextField: UITextField?
    

    @IBAction func calcular(_ sender: Any) {
        guard let dados = form() else { return }
        let imc = calculo(imc: dados)
        let mensagem = resultado(calculo: imc)
        
        alerta(mensagem: mensagem)
        
    }

    func calculo(imc: Imc) -> Double {
        let calc = imc.peso/(imc.altura * imc.altura)
        
        return calc
    }
   
    
    func form() -> Imc? {
        guard let pesoForm = pesoTextField?.text,  let peso = Double(pesoForm) else { return nil }
        guard let alturaForm = alturaTextField?.text, let altura = Double(alturaForm) else { return nil }
        
        let imc = Imc(peso: peso, altura: altura)
        
        return imc
    }
    
    func alerta(mensagem: String){
        let alerta = UIAlertController(title: "IMC", message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        
        present(alerta, animated: true, completion: nil)
    }
    
    func resultado(calculo: Double) -> String{
        
        let resultado: String
        
        switch calculo {
        case 0..<17:
            resultado = "Você está muito abaixo do peso"
        case 17...18.49:
            resultado = "Você está abaixo do peso ideal"
        case 18.5..<24.99:
            resultado = "Você está no peso considerado normal"
        case 24..<29.99:
            resultado = "Você está acima do peso"
        default:
            resultado = ""
    }
        let mensagem = String(format: "%.2f", calculo) + "\n" + resultado
        return mensagem
        
}
  
    
    
//baixo de 17    muito abaixo do peso
//Entre 17 e 18,49    abaixo do peso ideal
//Entre 18,5 e 24,99    peso considerado normal
//Entre 24 e 29,99    acima do peso
//Entre 30 e 34,99    obesidade grau I
//Entre 35 e 39,99    obesidade grau II (severa)
//Acima de 40    obesidade grau III (conhecida como obesidade mórbida)
}
