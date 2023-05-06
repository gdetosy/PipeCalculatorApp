//
//  Models.swift
//  PipeCalculatorApp
//
//  Created by tosy on 13.04.23.
//

import Foundation
//let strings = Strings()
struct Strings {
    let heightTxt = "Вес, тн"
    let lengthTxt = "Длина, м"
    let alertTitle = "Формула расчета"
    let alertText1 = """
    Трубный калькулятор рассчитывает
    вес круглой электросварной трубы по формуле:
    Вес трубы = ((диаметр трубы - толщина стенки) x толщина стенки x 0.02466 x длина трубы) / 1000
    """
    
    let alertText2 = """
    Трубный калькулятор рассчитывает
    длину электросварной трубы по формуле:
    Длина трубы = вес трубы x 1000 / ((диаметр трубы - толщина стенки) x 0.0246 x толщина стенки)
    """
}
