//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Кристина Максимова on 01.02.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculateBrain = CalculatorBrain()
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
    }

    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(format: "%.fKg", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculateBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToResult" else { return }
        let nextController = segue.destination as! ResultViewController
        nextController.bmiValue = calculateBrain.getCalculateValue()
        nextController.adviceText = calculateBrain.getAdvice()
        nextController.colorBackground = calculateBrain.getColor()
    }
}

