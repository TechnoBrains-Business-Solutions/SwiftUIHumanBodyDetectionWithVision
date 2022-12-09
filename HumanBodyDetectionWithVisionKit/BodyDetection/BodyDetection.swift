//
//  BodyDetection.swift
//  HumanBodyDetectionWithVisionKit
//
//  Created by admin on 08/12/22.
//

import AVFoundation
import Vision

 class BodyDetection: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate, ObservableObject {
    let sequenceHandler = VNSequenceRequestHandler()
    @Published var bodyParts = [VNHumanBodyPoseObservation.JointName : VNRecognizedPoint]()
    @Published var bodyPartsGroup = [VNHumanBodyPoseObservation.JointsGroupName : VNRecognizedPoint]()
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let humanBodyRequest = VNDetectHumanBodyPoseRequest(completionHandler: detectedBodyPose)
        do {
            try sequenceHandler.perform(
              [humanBodyRequest],
              on: sampleBuffer,
                orientation: .right)
        } catch {
          print(error.localizedDescription)
        }
    }
    
    func detectedBodyPose(request: VNRequest, error: Error?) {
        guard let bodyPoseResults = request.results as? [VNHumanBodyPoseObservation]
        else { return self.removeBodyPartsFromArray()}
        guard let bodyParts = try? bodyPoseResults.first?.recognizedPoints(.all) else { return self.removeBodyPartsFromArray()}
        DispatchQueue.main.async {
            self.bodyParts = bodyParts
        }
    }
     
     func removeBodyPartsFromArray()  {
         DispatchQueue.main.async {
             self.bodyParts.removeAll()
         }
     }
}

