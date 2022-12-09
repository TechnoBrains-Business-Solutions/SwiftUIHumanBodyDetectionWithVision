//
//  Extenxsion.swift
//  HumanBodyDetectionWithVisionKit
//
//  Created by admin on 08/12/22.
//


import SwiftUI

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow(x - point.x, 2) + pow(y - point.y, 2))
    }
    
    func distanceWithHypot(to point: CGPoint) -> CGFloat {
        return hypot(point.x - x, point.y - y)
    }
}

extension Shape {
    func flipped() -> ScaledShape<Self> {
        scale(x: -1, y: 1, anchor: .center)
    }
}
