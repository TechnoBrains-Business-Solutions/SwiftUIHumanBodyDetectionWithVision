//
//  Shapes.swift
//  HumanBodyDetectionWithVisionKit
//
//  Created by admin on 08/12/22.
//

import SwiftUI

/// Draw the shape by given Body parts location with PATH
struct Shapes: Shape {
    var bodyPoints: [CGPoint]
    var size: CGSize
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: bodyPoints[0])
        for point in bodyPoints {
            path.addLine(to: point)
        }
        return path.applying(CGAffineTransform(scaleX: size.width, y: size.height))  
    }
}

