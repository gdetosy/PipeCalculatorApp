//
//  AboutViewController.swift
//  PipeCalculatorApp
//
//  Created by tosy on 15.04.23.
//

import UIKit

final class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
viewSettings()
        // Do any additional setup after loading the view.
    }
   private func viewSettings(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "about")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}
