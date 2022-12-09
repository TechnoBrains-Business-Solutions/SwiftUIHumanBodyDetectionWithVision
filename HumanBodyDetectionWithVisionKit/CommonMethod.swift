//
//  CommonMethod.swift
//  HumanBodyDetectionWithVisionKit
//
//  Created by admin on 08/12/22.
//

import UIKit

func calculateDistance(point1: CGPoint?, point2: CGPoint?) -> CGFloat? {
    guard let point1 = point1, let point2 = point2 else {
        return nil
    }
    return point1.distance(to: point2)
}

func getDistance(point1: CGPoint?, point2: CGPoint?) -> CGFloat? {
    guard let point1 = point1, let point2 = point2 else {return nil}
    return point1.distanceWithHypot(to: point2)
}

