//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalcaluteViewController: UIViewController {
    var calculaterBrain = CalculateBrain()
    
    @IBOutlet weak var textHeaght: UILabel!
    @IBOutlet weak var textWeight: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func actionHeaght(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        textHeaght.text = "\(height)m"
    }
    
    @IBAction func actionWeight(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        textWeight.text = "\(weight))Kg"
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculaterBrain.calculateBMI(height : height, weight : weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculaterBrain.getBMIValue()
            destinationVC.advice = calculaterBrain.getAdvice()
            destinationVC.color = calculaterBrain.getColor()
        }
    }
}

