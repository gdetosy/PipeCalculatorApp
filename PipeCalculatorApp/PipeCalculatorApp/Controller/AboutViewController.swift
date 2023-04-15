//
//  AboutViewController.swift
//  PipeCalculatorApp
//
//  Created by tosy on 15.04.23.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
viewSettings()
    }
   private func viewSettings(){
       let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
       backgroundImage.image = UIImage(named: "bacl")
       backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
       self.view.insertSubview(backgroundImage, at: 0)
    }
}
