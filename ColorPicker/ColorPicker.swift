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
    
    var color: UIColor = .white
    var colorWheel: ColorWheel!
    var brightnessSlider: UISlider!
    
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
        
        // Brightness slider
        brightnessSlider = UISlider()
        brightnessSlider.minimumValue = 0
        brightnessSlider.maximumValue = 1
        brightnessSlider.value = 0.8
        
        brightnessSlider.translatesAutoresizingMaskIntoConstraints = false
        brightnessSlider.addTarget(self, action: #selector(changeBrightness), for: .valueChanged)
        
        addSubview(brightnessSlider)
        NSLayoutConstraint.activate(
            [brightnessSlider.topAnchor.constraint(equalTo: colorWheel.bottomAnchor, constant: 10),
             brightnessSlider.leadingAnchor.constraint(equalTo: leadingAnchor),
             brightnessSlider.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    @objc func changeBrightness() {
        colorWheel.brightness = CGFloat(brightnessSlider.value)
    }
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        color = colorWheel.color(for: touchPoint)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            color = colorWheel.color(for: touchPoint)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            color = colorWheel.color(for: touchPoint)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        defer { super.cancelTracking(with: event) }
        
        sendActions(for: [.touchCancel])
    }
    
}
