
import UIKit

struct CalculateBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height : Float, weight : Float){
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.blue)
        } else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "Eat more fiddle", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.red)
        }
    }
    
    func getBMIValue() -> String{
        let bmiTo1DecemalPlase = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecemalPlase
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advece"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
