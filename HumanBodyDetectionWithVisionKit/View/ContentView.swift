//
//  ContentView.swift
//  HumanBodyDetectionWithVisionKit
//
//  Created by admin on 08/12/22.
//

import SwiftUI
import Vision

struct ContentView: View {
    @StateObject var bodyDetection = BodyDetection()
    let sequenceHandler = VNSequenceRequestHandler()
    @State var bodyParts = [VNHumanBodyPoseObservation.JointName : VNRecognizedPoint]()
    
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { geo in
                    CameraViewWrapper(bodyPoseEstimator: bodyDetection)
                    BodyStickFigureView(bodyPartsEstimates: bodyDetection, size: geo.size)
                        .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                }
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
