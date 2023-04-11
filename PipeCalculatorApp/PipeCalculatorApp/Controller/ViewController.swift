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
        default: print("lol")
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
    
    private func segmentCaseOne() {
        lengthLabel.text = "Длина, м"
        weightLabel.text = "Вес, тн"
        diameterTf.text?.removeAll()
        thicknesTf.text?.removeAll()
        lengthTf.text?.removeAll()
        weightTf.text?.removeAll()
        weightTf.attributedPlaceholder = NSAttributedString(
            string: "тн")
        lengthTf.attributedPlaceholder = NSAttributedString(
            string: "м")
        meterLabel.text = " "
//        heightMetr.animation = Animations.fadeOut.rawValue
//        heightMetr.animate()
//        height()
        checkMarkS.alpha = 0
        checkMarkD.alpha = 0
        checkMarkL.alpha = 0
    }

    private func segmentCaseTwo() {
        checkMarkS.alpha = 0
        checkMarkD.alpha = 0
        checkMarkL.alpha = 0
        lengthLabel.text = "Вес, тн"
        weightLabel.text = "Длина, м"
        diameterTf.text?.removeAll()
        thicknesTf.text?.removeAll()
        lengthTf.text?.removeAll()
        weightTf.text?.removeAll()
        weightTf.attributedPlaceholder = NSAttributedString(
            string: "м")
        lengthTf.attributedPlaceholder = NSAttributedString(
            string: "тн")
        meterLabel.text = " "
//        heightMetr.animation = Animations.fadeOut.rawValue
//        heightMetr.animate()
//        height()
    }

    
    
    
}
