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
    
    @IBOutlet var checkMarkH: UIImageView!
   
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
        tolshina()
    }
    
    @IBAction func lengthTextField(_ sender: Any) {
       dlina()
    }
    
    @IBAction func weightTextField(_ sender: Any) {
        height()
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
        lengthLabel.text = "Длина, м"
    }

    private func about() {
        if lengthLabel.text == "Длина, м" { alert() }
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
    private func tolshina() {
        guard let dmtr = Float(diameterTf.text!),
              Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")) ?? 0 < Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")) ?? 0,
              Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")) ?? 0 <= dmtr / 2,
              Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")) != nil
                
        else {
//            tolshinaTextField.animation = Animations.shake.rawValue
//            tolshinaTextField.force = 0.25
//            tolshinaTextField.animate()
            checkMarkS.alpha = 0
            thicknesTf.text?.removeAll()
            
            checkMarkH.alpha = 0
            weightTf.text?.removeAll()
            meterLabel.text = " "
//            heightMetr.animation = Animations.fadeOut.rawValue
//            heightMetr.animate()
            return
        }
        
        checkMarkS.alpha = 1
        
        if lengthLabel.text == "Длина, м" {
            massa()
        } else
        { length() }
    }
    private func dlina() {
        guard Float(lengthTf.text!.replacingOccurrences(of: ",", with: ".")) != nil,
              Float(lengthTf.text!.replacingOccurrences(of: ",", with: ".")) ?? 0 <= 100
        
        else {
//            dlinaTextField.animation = Animations.shake.rawValue
//            dlinaTextField.force = 0.25
//            dlinaTextField.animate()
            lengthTf.text?.removeAll()
            weightTf.text?.removeAll()
            checkMarkL.alpha = 0
            return
        }
        checkMarkL.alpha = 1
        if lengthLabel.text == "Длина, м" {
            massa()
        } else
        { length() }
    }

    private func height() {
        if
            diameterTf.text!.isEmpty || thicknesTf.text!.isEmpty || lengthTf.text!.isEmpty
        {
            checkMarkH.alpha = 0
           
        } else {
            checkMarkH.alpha = 1
        }
    }
}
