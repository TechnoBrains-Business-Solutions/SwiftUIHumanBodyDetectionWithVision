import Foundation
import UIKit
import AVFoundation
import Vision
import SwiftUI

final class CameraViewController: UIViewController {
    // MARK: - Variables and constant
    var delegate: AVCaptureVideoDataOutputSampleBufferDelegate?
    private var cameraSession: AVCaptureSession?
    private var cameraView: CameraView { view as! CameraView }
    private let cameraQueue = DispatchQueue(
        label: "CameraOutput",
        qos: .userInteractive
    )
    
    // MARK: - View Life Cycle
    override func loadView() {
        view = CameraView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        do {
            if cameraSession == nil {
                try prepareAVSession()
                cameraView.previewLayer.session = cameraSession
                cameraView.previewLayer.videoGravity = .resizeAspectFill
            }
            cameraSession?.startRunning()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Setup Camera
    func prepareAVSession() throws {
        let session = AVCaptureSession()
        session.beginConfiguration()
        session.sessionPreset = .high
        
        guard let videoDevice = AVCaptureDevice.default(
            .builtInWideAngleCamera,
                for: .video,
                position: .back)
        else { return debugPrint("No Device Found....") }
        
        guard let deviceInput = try? AVCaptureDeviceInput(device: videoDevice)
        else { return }
        
        guard session.canAddInput(deviceInput)
        else { return }
        
        session.addInput(deviceInput)
        
        let dataOutput = AVCaptureVideoDataOutput()
        if session.canAddOutput(dataOutput) {
            session.addOutput(dataOutput)
            dataOutput.setSampleBufferDelegate(delegate, queue: cameraQueue)
        } else { return }
        
        session.commitConfiguration()
        cameraSession = session
    }
}
