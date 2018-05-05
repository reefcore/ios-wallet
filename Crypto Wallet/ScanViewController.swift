//
//  ScanViewController.swift
//  Crypto Wallet
//
//  Created by Anindya on 3/20/18.
//  Copyright © 2018 Setup Technology. All rights reserved.
//

import UIKit
import AVFoundation

class ScanViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet var preView: UIView!
    @IBOutlet var squareImageView: UIImageView!
    var session: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session = AVCaptureSession()
        
        // define capture device
        let captureDevice=AVCaptureDevice.default(for: AVMediaType.video)
        
        do{
            let input=try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }catch{
            print("Error")
        }
        
        // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
        let output=AVCaptureMetadataOutput()
        session.addOutput(output)
        
        // Set delegate and use the default dispatch queue to execute the call back
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes=output.availableMetadataObjectTypes
        
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = preView.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        preView.layer.addSublayer(previewLayer)
        // Move the square Imageview to the top view
        preView.bringSubview(toFront: squareImageView)
        
        // Start video capture.
        session.startRunning()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Change the status bar style
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent // white color
    }
    
    // Called when AVCaptureMetadataOutput objects detect a QR code
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        session.stopRunning()
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            let ac = UIAlertController(title: "Scanned Code", message: stringValue, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            //print(stringValue)
        }
        
    }
    
    // Back to privious screen
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // To Turn on the Flash light use this action
    @IBAction func flashLightAction(_ sender: Any) {
        
        // Code goes here
    }
    
    // To rotate camera mode - Back and front
    @IBAction func rotateCameraAction(_ sender: Any) {
        // Code goes here
    }
    
    
}
