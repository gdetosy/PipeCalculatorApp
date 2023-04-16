//
//  ViewController.swift
//  PipeCalculatorApp
//
//  Created by tosy on 9.04.23.
//

import UIKit
import Spring
final class ViewController: UIViewController {
    @IBOutlet var info: UIImageView!
    
    @IBOutlet var parameterView: SpringView!
    
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
    
    @IBOutlet var weightLabel: UILabel!
    
    @IBAction func question(_ sender: Any) {
        about()
    }

    @IBAction func diameterTextField(_ sender: Any) {
        diameter()
    }
    
    @IBAction func thicknesTextField(_ sender: Any) {
        thicknes()
    }
    
    @IBAction func lengthTextField(_ sender: Any) {
        lengths()
    }
    
    @IBAction func weightTextField(_ sender: Any) {
        weight()
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            parameterView.animation = Animations.shake.rawValue
            parameterView.force = 0.25
            parameterView.animate()
            segmentCaseOne()
        case 1:
            segmentCaseTwo()
            parameterView.animation = Animations.shake.rawValue
            parameterView.force = 0.25
            parameterView.animate()
        default: print("eror")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        self.hideKeyboardWhenTappedAround()
        lengthLabel.text = strings.lengthTxt
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedMe))
        info.addGestureRecognizer(tap)
        info.isUserInteractionEnabled = true
    }

    private func about() {
        if lengthLabel.text == strings.lengthTxt { alert() }
        else { alert1() }
    }
    
    private func viewSettings() {
        parameterView.layer.cornerRadius = 17
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "about")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }

    @objc func tappedMe() {
        alertImage()
    }
}
