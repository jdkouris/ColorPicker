//
//  ColorWheel.swift
//  ColorPicker
//
//  Created by John Kouris on 9/25/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class ColorWheel: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        isUserInteractionEnabled = false
        
        clipsToBounds = true
        
        let radius = frame.width / 2.0
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 1
        
        for y in stride(from: 0, to: bounds.maxY, by: size) {
            for x in stride(from: 0, to: bounds.maxX, by: size) {
                // Determine which color should be used for a given pixel location
//                let color =
            }
        }
    }
    
    func color(for location: CGPoint) -> UIColor {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dy = location.y - center.y
        let dx = location.x - center.x
        let offset = CGPoint(x: dx / center.x, y: dy / center.y)
        
    }

}
