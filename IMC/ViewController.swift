//
//  ViewController.swift
//  IMC
//
//  Created by Felipe Almeida on 23/06/2022.
//  Copyright © 2022 Curso iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var ivResultado: UIImageView!
    @IBOutlet weak var viResutado: UIView!
    
    var imc: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    
    @IBAction func calcular(_ sender: Any) {
        
        if let peso = Double(tfPeso.text!) , let altura = Double(tfAltura.text!) {
            imc = peso / (altura * altura)
            showResults()
        }
    }
    
    func showResults () {
        var result: String = ""
        var image: String = ""
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        lbResultado.text = "\(Int(imc)): \(result)"
        ivResultado.image = UIImage(named:image)
        viResutado.isHidden = false
        view.endEditing(true)
    }
    
}

