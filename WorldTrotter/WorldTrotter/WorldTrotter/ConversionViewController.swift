//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Vikram on 06/05/21.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    //@IBOutlet weak var extraLabel: UILabel!
    //@IBOutlet weak var degreeCelcius: UILabel!
    
    
    @IBOutlet weak var celciusLabel: UILabel!
    @IBOutlet var textField: UITextField!    
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
        
    var celciusValue: Measurement<UnitTemperature>? {
        if let  farenheitValue = farenheitValue {
            return farenheitValue.converted(to: .celsius)
        }
        else {
            return nil
        }
    }

    
    
    var farenheitValue: Measurement<UnitTemperature>? {
        didSet{updateCelciusLabel()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Constraints for Label1
       // extraLabel.text = "yooo"
        
        //        let topExtraLabelConstraint = extraLabel.topAnchor.constraint(equalTo: degreeCelcius.bottomAnchor, constant: 20)
        //
        //        let centreConstraint = extraLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        //
        //        topExtraLabelConstraint.isActive = true
//        centreConstraint.isActive = true
        
        // Inserting a gradient Background
//        let colorArray = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor, UIColor.yellow.cgColor]
//        let CALayer = CAGradientLayer()
//        CALayer.colors = colorArray
//        view.layer.insertSublayer(CALayer, at: 0)
//        CALayer.frame = view.bounds
    }

    override func viewWillAppear(_ animated: Bool) {
        
        let colorArray = [UIColor.blue, UIColor.green, UIColor.yellow]
        view.backgroundColor = colorArray.randomElement()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField ) {
//        if let text = textField.text, !text.isEmpty {
//            celciusLabel.text = text
//        }
//        else {
//            celciusLabel.text = "???"
//        }
        
        if let text = textField.text, let value = Double(text){
            farenheitValue = Measurement(value: value, unit: .fahrenheit)
        }
        else {
            farenheitValue = nil
        }
        
        
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelciusLabel() {
        if let celciusValue = celciusValue {
            //celciusLabel.text = "\(celciusValue.value)"
            celciusLabel.text = numberFormatter.string(from: NSNumber(value: celciusValue.value))
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Current Text: \(String(describing: textField.text))")
        print("Replacement Text: \(string)")
        let existingTextHasDecimalSeparetor = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeperator = string.range(of: ".")
        
        if existingTextHasDecimalSeparetor != nil , replacementTextHasDecimalSeperator != nil {
            return false
        }
        else {
            return true
        }
    }
    
}

