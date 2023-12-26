//
//  ViewController.swift
//  IMC
//
//  Created by Miqueias Pires on 26/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var btnCalculate: UIButton!
    
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var imvResult: UIImageView!
    
    @IBOutlet weak var viewResult: UIView!
    
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any) {
        
       if  let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!){
           imc = weight / pow(height,2)
           showResults()
       }
    }
    
    func showResults(){
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
                break
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
                break
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
                break
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
                break
            default:
                result = "Obesidade"
                image = "obesidade"
            }
        lbResult.text = "\(String(format:"%.2f", imc)): \(result)"
        imvResult.image = UIImage(named: image)
        viewResult.isHidden = false
        view.endEditing(true)
    }
    
}

