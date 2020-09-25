//
//  ViewController.swift
//  Realtime Object Detection
//
//  Created by Anmol's Mac on 9/6/20.
//  Copyright © 2020 Anmol Basnet. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    override var prefersStatusBarHidden: Bool{
        
        return true
    }

    @IBOutlet weak var belowView: UIView!
    @IBOutlet weak var ObjectView: UILabel!
    @IBOutlet weak var Accuracy: UILabel!
    
    //var model=Resnet50().model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //camera
            let captureSession = AVCaptureSession()
            
        //guard is used instead of let statement where the required condition must be true for the code to get executed
         
            guard let captureDevice = AVCaptureDevice.default(for: .video)
            else {
                    return }
            guard let input = try? AVCaptureDeviceInput(device: captureDevice)
            else {
                    return }
            captureSession.addInput(input)
            
            captureSession.startRunning()
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            view.layer.addSublayer(previewLayer)
            previewLayer.frame = view.frame
        
            // The camera is now created!
            
            view.addSubview(belowView)
            
            belowView.clipsToBounds = true
            belowView.layer.cornerRadius = 15.0
            belowView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            
            
            let  dataOutput = AVCaptureVideoDataOutput()
            dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            captureSession.addOutput(dataOutput)
  
}

}
