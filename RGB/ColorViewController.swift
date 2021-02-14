//
//  ColorViewController.swift
//  RGB
//
//  Created by Sofi on 12.02.2021.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet var colorImageView: UIImageView!
    
    var redValue: Float!
    var greenValue: Float!
    var blueValue: Float!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? RGBViewController else { return }
        settingsVC.rgbcolor = self
        settingsVC.redValue = redValue
        settingsVC.greenValue = greenValue
        settingsVC.blueValue = blueValue
    }
}

extension ColorViewController: SetengViewColorDelegat {
    func colorRGBdelegat(red: Float, green: Float, blue: Float) {
        
        redValue = red
        greenValue = green
        blueValue = blue
        
        colorImageView.backgroundColor = UIColor(displayP3Red:CGFloat(red),
                                                 green:CGFloat(green),
                                                 blue:CGFloat(blue),
                                                 alpha: 1)
    }
}
