//
//  ViewController2.swift
//  PipeCalculatorApp
//
//  Created by tosy on 15.04.23.
//

import UIKit

class DeveloperViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
    viewSettings()
        }
       private func viewSettings(){
           textView.layer.cornerRadius = 15
           overrideUserInterfaceStyle = .light
           let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
           backgroundImage.image = UIImage(named: "pipe")
           backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
           self.view.insertSubview(backgroundImage, at: 0)
        }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
