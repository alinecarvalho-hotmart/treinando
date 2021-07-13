//
//  ViewController.swift
//  Aprendendo
//
//  Created by Aline Miranda Dutra de Carvalho on 23/12/20.
//

import UIKit

class FormViewController: UIViewController {

    var square : UIView!
    
    override func viewDidLoad() {
        square = UIView(frame: CGRect(x: .zero, y: .zero, width: 100, height: 100))
        square.backgroundColor = UIColor.black
        view.addSubview(square)
    }
    
    
    


}

