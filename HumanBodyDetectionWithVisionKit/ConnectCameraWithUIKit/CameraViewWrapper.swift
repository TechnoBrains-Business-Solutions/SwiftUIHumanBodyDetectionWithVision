import Foundation
import SwiftUI
import AVFoundation
import Vision

struct CameraViewWrapper: UIViewControllerRepresentable {
    var bodyPoseEstimator: BodyDetection
    func makeUIViewController(context: Context) -> some UIViewController {
        let objCameraView = CameraViewController()
        objCameraView.delegate = bodyPoseEstimator
        return objCameraView
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
