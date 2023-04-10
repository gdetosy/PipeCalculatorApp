//
//  ViewController.swift
//  PipeCalculatorApp
//
//  Created by tosy on 9.04.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var checkMarkD: UIImageView!
    
    @IBOutlet var checkMarkS: UIImageView!
    
    @IBOutlet var checkMarkL: UIImageView!
    
    @IBOutlet var checkMarkH: UILabel!
   
    @IBOutlet var meterLabel: UILabel!
    
    @IBOutlet var znPipeLabel: UILabel!
    
    @IBAction func diameterTextField(_ sender: Any) {}
    
    @IBAction func thicknesTextField(_ sender: Any) {}
    
    @IBAction func lengthTextField(_ sender: Any) {}
    
    @IBAction func weightTextField(_ sender: Any) {}
    
    @IBAction func segmentControl(_ sender: Any) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
