//
//  Extensions.swift
//  PipeCalculatorApp
//
//  Created by tosy on 10.04.23.
//

import UIKit

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

protocol alert {
    func alert()
    func alert1()
}

extension ViewController: alert {
    func alert() {
        let alert = UIAlertController(title: "Формула расчета", message: """
                                      Трубный калькулятор рассчитывает
                                      вес круглой электросварной трубы по формуле:
                                      Вес трубы = ((диаметр трубы - толщина стенки) x толщина стенки x 0.02466 x длина трубы) / 1000
                                      """,

                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }

    func alert1() {
        let alert = UIAlertController(title: "Формула расчета", message: """
                                                                            Трубный калькулятор рассчитывает
                                                                            вес круглой электросварной трубы по формуле:                         Длина трубы = вес трубы * 1000 / ((диаметр трубы - толщина стенки) * 0.0246 * толщина стенки)
                                      """,
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}

protocol raschet {
    func massa()
    func length()
}

extension ViewController: raschet {
    func massa() {
        guard let diametr = Float(diameterTf.text!.replacingOccurrences(of: ",", with: ".")),
              let stenka = Float(thicknesTf.text!.replacingOccurrences(of: ",", with: ".")),
              let metraj = Float(lengthTf.text!.replacingOccurrences(of: ",", with: "."))
        else { return }
        let massa1 = ((diametr - stenka) * stenka * 0.02466 * metraj) / 1000
        let heightMetrs = ((diametr - stenka) * stenka * 0.02466 * 1) / 1000
        let kg = (diametr - stenka) * stenka * 0.02466
        meterLabel.text = "1 m weight = \(round(heightMetrs * 100000) / 100000) t = \(kg) kg."
//        heightMetr.animation = Animations.fadeIn.rawValue
//        heightMetr.animate()
        weightTf.text = "\(round(massa1 * 100000) / 100000)"
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
        meterLabel.text = "1 m weight = \(round(heightMetrs * 100000) / 100000) t = \(kg) kg."
    }
}
protocol segment {
    func segmentCaseOne()
    func segmentCaseTwo()
}
extension ViewController: segment {
    func segmentCaseOne() {
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
        checkMarkH.alpha = 0
    }

    func segmentCaseTwo() {
        checkMarkH.alpha = 0
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
