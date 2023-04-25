//
//  Extensions.swift
//  PipeCalculatorApp
//
//  Created by tosy on 10.04.23.
//

import UIKit
import Spring
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

protocol Alert {
    func alert()
    func alert1()
    func alertImage()
}

extension ViewController: Alert {
    func alert() {
        let alert = UIAlertController(title: strings.alertTitle, message: strings.alertText1,

                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        let height = NSLayoutConstraint(item: alert.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        let width = NSLayoutConstraint(item: alert.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 280)
        alert.view.addConstraint(height)
        alert.view.addConstraint(width)
        self.present(alert, animated: true, completion: nil)
    }

    func alert1() {
        let alert = UIAlertController(title: strings.alertTitle, message: strings.alertText2,
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        let height = NSLayoutConstraint(item: alert.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        let width = NSLayoutConstraint(item: alert.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 280)
        alert.view.addConstraint(height)
        alert.view.addConstraint(width)
        self.present(alert, animated: true, completion: nil)
    }

    func alertImage() {
        let showAlert = UIAlertController(title: "Параметры трубы", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 48, y: 50, width: 200, height: 165))
        imageView.image = UIImage(named: "pipe-round") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 280)
        let width = NSLayoutConstraint(item: showAlert.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 280)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        }))
        self.present(showAlert, animated: true, completion: nil)
    }
}

protocol Raschet {
    func massa()
    func length()
}

extension ViewController: Raschet {
    func massa() {
        guard let diametr = Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")),
              let stenka = Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")),
              let metraj = Float(lengthTf.text!.replacingOccurrences(of: ",", with: "."))
        else { return }
        let massa1 = ((diametr - stenka) * stenka * 0.02466 * metraj) / 1000
        let heightMetrs = ((diametr - stenka) * stenka * 0.02466 * 1) / 1000
        let kg = (diametr - stenka) * stenka * 0.02466

        meterLabel.text = "Вес 1 м = \(round(heightMetrs * 100000) / 100000) тн = \(kg) кг."
        let roundWeight = round(massa1 * 100000) / 100000
        weightTf.text = "\(roundWeight)"
    }

    func length() {
        guard let diametr = Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")),
              let stenka = Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")),
              let massa = Float(lengthTf.text!.replacingOccurrences(of: ",", with: "."))
        else { return }
        let metraj1 = massa * 1000 / ((diametr - stenka) * 0.0246 * stenka)
        let heightMetrs = ((diametr - stenka) * stenka * 0.02466 * 1) / 1000
        let kg = (diametr - stenka) * stenka * 0.02466
        weightTf.text = "\(round(metraj1 * 100000) / 100000)"
        meterLabel.text = "Вес 1 м = \(round(heightMetrs * 100000) / 100000) тн = \(kg) кг."
    }
}

protocol Segment {
    func segmentCaseOne()
    func segmentCaseTwo()
}

extension ViewController: Segment {
    func segmentCaseOne() {
        lengthLabel.text = strings.lengthTxt
        weightLabel.text = strings.heightTxt
        diameterTf.text?.removeAll()
        thicknesTf.text?.removeAll()
        lengthTf.text?.removeAll()
        weightTf.text?.removeAll()
        weightTf.attributedPlaceholder = NSAttributedString(
            string: "тн")
        lengthTf.attributedPlaceholder = NSAttributedString(
            string: "м")
        meterLabel.text = ""
        weight()
        checkMarkS.alpha = 0
        checkMarkD.alpha = 0
        checkMarkL.alpha = 0
        checkMarkH.alpha = 0
    }

    func segmentCaseTwo() {
        checkMarkH.alpha = 0
        checkMarkS.alpha = 0
        checkMarkD.alpha = 0
        checkMarkL.alpha = 0
        lengthLabel.text = strings.heightTxt
        weightLabel.text = strings.lengthTxt
        diameterTf.text?.removeAll()
        thicknesTf.text?.removeAll()
        lengthTf.text?.removeAll()
        weightTf.text?.removeAll()
        weightTf.attributedPlaceholder = NSAttributedString(
            string: "м")
        lengthTf.attributedPlaceholder = NSAttributedString(
            string: "тн")
        meterLabel.text = ""
        weight()
    }
}

protocol Calculation {
    func diameter()
    func thicknes()
    func lengths()
    func weight()
}

extension ViewController: Calculation {
    func diameter() {
        guard let diametr = Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")),
              diametr > 0, diametr <= 325
        else { diameterTf.text?.removeAll(); meterLabel.text = " "
            diameterTf.animation = Animations.shake.rawValue
            diameterTf.force = 0.25
            diameterTf.animate()
            weightTf.text?.removeAll()
            checkMarkD.alpha = 0
            meterLabel.text = ""
            return
        }
        checkMarkD.alpha = 1
        if lengthLabel.text == strings.lengthTxt {
            massa()
        } else
        { length() }
    }

    func thicknes() {
        guard let dmtr = Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")),
              Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")) ?? 0 < Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")) ?? 0,
              Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")) ?? 0 <= dmtr / 2,
              Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")) != nil

        else {
            thicknesTf.animation = Animations.shake.rawValue
            thicknesTf.force = 0.25
            thicknesTf.animate()
            checkMarkS.alpha = 0
            thicknesTf.text?.removeAll()
            checkMarkH.alpha = 0
            weightTf.text?.removeAll()
            meterLabel.text = ""
            return
        }

        checkMarkS.alpha = 1

        if lengthLabel.text == strings.lengthTxt {
            massa()
        } else
        { length() }
    }

    func lengths() {
        guard Float(lengthTf.text!.replacingOccurrences(of: ",", with: ".")) != nil,
              Float(lengthTf.text!.replacingOccurrences(of: ",", with: ".")) ?? 0 <= 100
        else {
            lengthTf.animation = Animations.shake.rawValue
            lengthTf.force = 0.25
            lengthTf.animate()
            lengthTf.text?.removeAll()
            weightTf.text?.removeAll()
            checkMarkL.alpha = 0
            return
        }
        checkMarkL.alpha = 1
        if lengthLabel.text == strings.lengthTxt {
            massa()
        } else
        { length() }
    }

    func weight() {
        if
            diameterTf.text!.isEmpty || thicknesTf.text!.isEmpty || lengthTf.text!.isEmpty
        {
            checkMarkH.alpha = 0

        } else {
            checkMarkH.alpha = 1
        }
    }
}
