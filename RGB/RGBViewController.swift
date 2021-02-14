//
//  ViewController.swift
//  RGB
//
//  Created by Sofi on 29.01.2021.
//

import UIKit

protocol SetengViewColorDelegat {
    
    func colorRGBdelegat (red: Float, green: Float, blue: Float )
}

class RGBViewController: UIViewController {
    
    @IBOutlet weak var colorMixView: UIView!
    
    @IBOutlet weak var redNumber: UILabel!
    @IBOutlet weak var greenNumber: UILabel!
    @IBOutlet weak var blueNumber: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var redNumberTextField: UITextField!
    @IBOutlet var greenNumberTextField: UITextField!
    @IBOutlet var blueNumberTextField: UITextField!
    
    var rgbcolor: SetengViewColorDelegat!
    
    var redValue: Float!
    var greenValue: Float!
    var blueValue: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkValuehardcor()
        
        colorMixView.layer.cornerRadius = 10
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func colrRGB ( red: Float, green: Float, blue: Float) {
        colorMixView.backgroundColor = UIColor(displayP3Red:CGFloat(red),
                                               green:CGFloat(green),
                                               blue:CGFloat(blue),
                                               alpha: 1)
    }
    
    private func sowAlert() {
        
        let alert = UIAlertController(title: "Incorrect number",
                                      message: "Please, enter correct number",
                                      preferredStyle: .alert )
        let action = UIAlertAction(title: "OK",
                                   style:.destructive,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func checkValuehardcor() {
        if redValue == nil {
            redValue = 0.00
            greenValue = 0.00
            blueValue = 0.00
        }
        redSlider.value = redValue
        greenSlider.value = greenValue
        blueSlider.value = blueValue
        
        redNumber.text = String(format: "%.2f", redValue)
        greenNumber.text = String(format: "%.2f", greenValue)
        blueNumber.text = String(format: "%.2f", blueValue)
        
        redNumberTextField.text = redNumber.text
        greenNumberTextField.text = greenNumber.text
        blueNumberTextField.text = blueNumber.text
        
        colorMixView.backgroundColor = UIColor(displayP3Red:CGFloat(redValue),
                                               green:CGFloat(greenValue),
                                               blue:CGFloat(blueValue),
                                               alpha: 1)
    }
    // MARK: - Action
    @IBAction func doneButton(_ sender: Any) {
        rgbcolor.colorRGBdelegat(red: redSlider.value,
                                 green: greenSlider.value,
                                 blue: blueSlider.value)
        dismiss(animated: true)
    }
    
    @IBAction func redSliderAction() {
        colrRGB(red: redSlider.value,
                green: greenSlider.value,
                blue: blueSlider.value)
        
        redNumber.text = String(format: "%.2f", redSlider.value)
        redNumberTextField.text = redNumber.text
    }
    
    @IBAction func greenSliderAction() {
        colrRGB(red: redSlider.value,
                green: greenSlider.value,
                blue: blueSlider.value)
        
        greenNumber.text = String(format: "%.2f", greenSlider.value)
        greenNumberTextField.text = greenNumber.text
    }
    
    @IBAction func blueSliderAction() {
        colrRGB(red: redSlider.value,
                green: greenSlider.value,
                blue: blueSlider.value)
        
        blueNumber.text = String(format: "%.2f", blueSlider.value)
        blueNumberTextField.text = blueNumber.text
    }
}

extension RGBViewController: SetengViewColorDelegat {
    func colorRGBdelegat(red: Float, green: Float, blue: Float) {
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
    }
}

extension RGBViewController:  UITextFieldDelegate  {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text!.count > 4  {
            sowAlert()
            textField.text = nil
        }else if textField == redNumberTextField {
            greenNumberTextField.becomeFirstResponder()
        } else if textField == greenNumberTextField {
            blueNumberTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let newValue = textField.text else {return}
        guard let numberValue = Float(newValue) else {return}
        if textField == redNumberTextField {
            redNumber.text = String(format: "%.2f", numberValue)
            colrRGB (red: Float(numberValue),
                     green: greenSlider.value,
                     blue: blueSlider.value)
            
        } else if textField == greenNumberTextField {
            greenNumber.text = String(format: "%.2f", numberValue)
            colrRGB (red: redSlider.value,
                     green: Float(numberValue),
                     blue: blueSlider.value)
            
        } else if textField == blueNumberTextField {
            blueNumber.text = String(format: "%.2f", numberValue)
            
            colrRGB (red: redSlider.value,
                     green: greenSlider.value,
                     blue: Float(numberValue))
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == textField {
            let allowedCharacters = CharacterSet(charactersIn:".0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
}
