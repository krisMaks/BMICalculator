//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Кристина Максимова on 01.02.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmiValue: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmi = weight / pow(height, 2)
        if bmi < 18.5 {
            bmiValue = BMI(value: bmi, advice: "Eat more pies!", color: .blue)
        } else if bmi < 24.9 {
            bmiValue = BMI(value: bmi, advice: "Fit as a fiddle!", color: .green)
        } else {
            bmiValue = BMI(value: bmi, advice: "Eat less pies", color: .red)
        }
    }
    
    func getCalculateValue() -> String {
        return String(format: "%.1f", bmiValue?.value ?? 0)
    }
    
    func getAdvice() -> String {
        return bmiValue?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmiValue?.color ?? .white
    }
}
