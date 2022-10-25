//
//  UIColor+Extensions.swift
//  MonalisaStoryboard
//
//  Created by Eliane Regina Nicácio Mendes on 25/10/22.
//

import UIKit

extension UIColor {
    
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return(red * 255, green * 255, blue * 255, alpha * 100)
    }
}
