//
//  BodyStickFigure.swift
//  HumanBodyDetectionWithVisionKit
//
//  Created by admin on 08/12/22.
//

import SwiftUI


/// Draw the Shape on Detect Human Body figure
struct BodyStickFigureView: View {
    @ObservedObject var bodyPartsEstimates: BodyDetection
    var size: CGSize
    var body: some View {
        if bodyPartsEstimates.bodyParts.isEmpty == false {
            ZStack {
                
                // *** Neck to nose *** //
                Shapes(bodyPoints: [bodyPartsEstimates.bodyParts[.neck]!.location,  bodyPartsEstimates.bodyParts[.nose]!.location], size: size)
                    .stroke(lineWidth: 10)
                    .fill(Color.brown)
                
                // **** neck to root **** //
                Shapes(bodyPoints: [bodyPartsEstimates.bodyParts[.root]!.location, bodyPartsEstimates.bodyParts[.neck]!.location], size: size)
                    .stroke(lineWidth: 20)
                    .fill(Color.brown)
                
                // **** neck to root **** //
                Shapes(bodyPoints: [bodyPartsEstimates.bodyParts[.root]!.location, bodyPartsEstimates.bodyParts[.neck]!.location], size: size)
                    .stroke(lineWidth: 20)
                    .fill(Color.brown)
                
                // **** right arm **** //
                Shapes(bodyPoints: [bodyPartsEstimates.bodyParts[.rightWrist]!.location, bodyPartsEstimates.bodyParts[.rightElbow]!.location, bodyPartsEstimates.bodyParts[.rightShoulder]!.location, bodyPartsEstimates.bodyParts[.neck]!.location], size: size)
                    .stroke(lineWidth: 10.0)
                    .fill(Color.green)
                
                // **** left arm **** //
                Shapes(bodyPoints: [bodyPartsEstimates.bodyParts[.leftWrist]!.location, bodyPartsEstimates.bodyParts[.leftElbow]!.location, bodyPartsEstimates.bodyParts[.leftShoulder]!.location, bodyPartsEstimates.bodyParts[.neck]!.location], size: size)
                    .stroke(lineWidth: 10.0)
                    .fill(Color.green)
                
                // **** Right Leg **** //
                Shapes(bodyPoints: [bodyPartsEstimates.bodyParts[.rightAnkle]!.location, bodyPartsEstimates.bodyParts[.rightKnee]!.location, bodyPartsEstimates.bodyParts[.rightHip]!.location,
                                bodyPartsEstimates.bodyParts[.root]!.location], size: size)
                .stroke(lineWidth: 15.0)
                .fill(Color.brown)
                
                // **** Left Leg **** //
                Shapes(bodyPoints: [bodyPartsEstimates.bodyParts[.leftAnkle]!.location, bodyPartsEstimates.bodyParts[.leftKnee]!.location, bodyPartsEstimates.bodyParts[.leftHip]!.location,
                               bodyPartsEstimates.bodyParts[.root]!.location], size: size)
                .stroke(lineWidth: 15.0)
                .fill(Color.brown)
                
            }
            .onAppear {
                let bodyParts = bodyPartsEstimates.bodyParts
                let distance1 = calculateDistance(point1: bodyParts[.rightEar]?.location, point2: bodyParts[.leftEar]?.location)
                
                let distance2 = getDistance(point1: bodyParts[.leftEar]?.location, point2: bodyParts[.rightAnkle]?.location)
                
                print("(bodyPartsEstimates.bodyParts[.rightEye]?.location.x): \((bodyPartsEstimates.bodyParts[.rightEye]?.location.x))")
                
                debugPrint("Distance1: \(distance1 ?? 0.0)")
                debugPrint("Distance2: \(distance2 ?? 0.0)")
            }
        }
    }
    
    
}

