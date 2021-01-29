//
//  ViewController.swift
//  RGB
//
//  Created by Sofi on 29.01.2021.
//

import UIKit

class RGBViewController: UIViewController {

    @IBOutlet weak var colorMixView: UIView!
    
    @IBOutlet weak var redNumber: UILabel!
    @IBOutlet weak var greenNumber: UILabel!
    @IBOutlet weak var blueNumber: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorMixView.layer.cornerRadius = 10
        
// RED Slide
        redSlider.value = 0.0
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        
// GREEN Slider
        greenSlider.value = 0.0
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        
// Blue Slider
        blueSlider.value = 0.0
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
    }
// MARK: - Action
    @IBAction func redSliderAction() {
        redNumber.text = String(format: "%.2f",(redSlider.value))
        colorMixView.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green:CGFloat(greenSlider.value) , blue:CGFloat(blueSlider.value) , alpha: 1 )
    }
    
    @IBAction func greenSliderAction() {
        greenNumber.text = String(format: "%.2f",(greenSlider.value))
        colorMixView.backgroundColor = UIColor(displayP3Red:CGFloat(redSlider.value), green:CGFloat(greenSlider.value), blue:CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func blueSliderAction() {
        blueNumber.text = String(format: "%.2f",(blueSlider.value))
        colorMixView.backgroundColor = UIColor(displayP3Red:CGFloat(redSlider.value), green:CGFloat(greenSlider.value), blue:CGFloat(blueSlider.value), alpha: 1)
    }
}

