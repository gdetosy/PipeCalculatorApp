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
    
    @IBOutlet var lengthLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBAction func question(_ sender: Any) {
        about()
    }
    
    @IBAction func diameterTextField(_ sender: Any) {
        diametr()
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
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
//            bigView.animation = Animations.shake.rawValue
//            bigView.force = 0.25
//            bigView.animate()
            segmentCaseOne()
        case 1:
            segmentCaseTwo()
//            bigView.animation = Animations.shake.rawValue
//            bigView.force = 0.25
//            bigView.animate()
        default: print("eror")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    private func about() {
        if lengthLabel.text == "Длина, м " { alert() }
        else { alert1() }
    }
    private func diametr() {
      
        guard let diametr = Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")),
              diametr > 0, diametr <= 325
        else { diameterTf.text?.removeAll(); meterLabel.text = " "
//            diametrTextField.animation = Animations.shake.rawValue
//            diametrTextField.force = 0.25
//            diametrTextField.animate()
            weightTf.text?.removeAll()
            checkMarkD.alpha = 0
            return
        }
        checkMarkD.alpha = 1
        if lengthLabel.text == "Длина, м" {
            massa()
        } else
        { length() }
    }
    
    
}



