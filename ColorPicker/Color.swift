//
//  Color.swift
//  ColorPicker
//
//  Created by John Kouris on 9/25/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

struct Color {
    static func getHueSaturation(at offset: CGPoint) -> (hue: CGFloat, saturation: CGFloat) {
        if offset == CGPoint.zero {
            return (hue: 0, saturation: 0)
        } else {
            // the further from the center you are, the more saturated the color
            let saturation = sqrt(offset.x * offset.x + offset.y * offset.y)
            // the offset angle is used to determine the hue within the full spectrum of colors
            var hue = acos(offset.x / saturation) / (2.0 * CGFloat.pi)
            if offset.y < 0 {
                hue = 1.0 - hue
            }
            return (hue: hue, saturation: saturation)
        }
    }
}
