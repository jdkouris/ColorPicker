//
//  ColorPicker.swift
//  ColorPicker
//
//  Created by John Kouris on 9/25/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

@IBDesignable
class ColorPicker: UIControl {
    
    var colorWheel: ColorWheel!
    
    // for programmatic layouts
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    // for storyboard (xib) based layouts
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    func setUpSubviews() {
        backgroundColor = .clear
        
        // Color Wheel
        colorWheel = ColorWheel()
        colorWheel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(colorWheel)
        NSLayoutConstraint.activate(
            [colorWheel.topAnchor.constraint(equalTo: topAnchor),
             colorWheel.leadingAnchor.constraint(equalTo: leadingAnchor),
             colorWheel.trailingAnchor.constraint(equalTo: trailingAnchor),
             colorWheel.heightAnchor.constraint(equalTo: colorWheel.widthAnchor)
        ])
        
    }
    
}
