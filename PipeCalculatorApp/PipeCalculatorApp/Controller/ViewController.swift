//
//  ViewController.swift
//  PipeCalculatorApp
//
//  Created by tosy on 9.04.23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var checkMarkD: UIImageView!
    
    @IBOutlet var checkMarkS: UIImageView!
    
    @IBOutlet var checkMarkL: UIImageView!
    
    @IBOutlet var checkMarkH: UILabel!
   
    @IBOutlet var meterLabel: UILabel!
    
    @IBOutlet var znPipeLabel: UILabel!
   
    @IBOutlet var diameterTf: UITextField!
    
    @IBOutlet var thicknesTf: UITextField!
    
    @IBOutlet var lengthTf: UITextField!
    
    @IBOutlet var weightTf: UITextField!
    
    
    @IBOutlet weak var lengthLabel: UILabel!
    
    @IBAction func question(_ sender: Any) {
        about()
    }
    
    @IBAction func diameterTextField(_ sender: Any) {
        massa()
    }
    
    @IBAction func thicknesTextField(_ sender: Any) {
        massa()
    }
    
    @IBAction func lengthTextField(_ sender: Any) {
        massa()
    }
    
    @IBAction func weightTextField(_ sender: Any) {
        massa()
    }
    
    @IBAction func segmentControl(_ sender: Any) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

//    private func massa() {
//        guard let diametr = Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")),
//              let stenka = Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")),
//              let metraj = Float(lengthTf.text!.replacingOccurrences(of: ",", with: "."))
//        else { return }
//        let massa1 = ((diametr - stenka) * stenka * 0.02466 * metraj) / 1000
//        let heightMetrs = ((diametr - stenka) * stenka * 0.02466 * 1) / 1000
//        let kg = (diametr - stenka) * stenka * 0.02466
//        meterLabel.text = "1 m weight = \(round(heightMetrs * 100000) / 100000) t = \(kg) kg."
////        heightMetr.animation = Animations.fadeIn.rawValue
////        heightMetr.animate()
//        weightTf.text = "\(round(massa1 * 100000) / 100000)"
//    }

//    private func length() {
//        guard let diametr = Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")),
//              let stenka = Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")),
//              let massa = Float(lengthTf.text!.replacingOccurrences(of: ",", with: "."))
//        else { return }
//        let metraj1 = massa * 1000 / ((diametr - stenka) * 0.0246 * stenka)
//        let heightMetrs = ((diametr - stenka) * stenka * 0.02466 * 1) / 1000
//        let kg = (diametr - stenka) * stenka * 0.02466
//        weightTf.text = "\(round(metraj1 * 100000) / 100000)"
//        meterLabel.text = "1 m weight = \(round(heightMetrs * 100000) / 100000) t = \(kg) kg."
//    }
    private func about() {
        if lengthLabel.text == "Длина, м " { alert() }
        else { alert1() }
    }
    
    
    
}

