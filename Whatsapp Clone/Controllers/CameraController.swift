//
//  CameraController.swift
//  Whatsapp Clone
//
//  Created by Suprianto Djamalu on 16/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CameraController: UIViewController {
    
    private let btnClose = UIButton(type: .system)
    private let btnCapture = UIButton(type: .system)
    private let btnSmile = UIButton(type: .system)
    
    private var videoDataOutput: AVCaptureVideoDataOutput!
    private var videoDataOutputQueue = DispatchQueue(label: "JKVideoDataOutputQueue")
    private var previewLayer: AVCaptureVideoPreviewLayer!
    private var captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    private var session: AVCaptureSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCamera()
    }
    
    @objc private func btnCloseTapped(){
        navigationController?.view.layer.add(TransitionHandler.topToBottom(), forKey: kCATransition)
        navigationController?.popViewController(animated: false)
    }
    
    @objc private func btnCaptureTapped(){
       
    }
    
    @objc private func btnSmileTapped(){
        
        session.beginConfiguration()
        let currentInput = session.inputs.first as! AVCaptureDeviceInput
        session.removeInput(currentInput)
        
        let newCameraDevice = currentInput.device.position == .back ? getCamera(with: .front) : getCamera(with: .back)
        let newVideoInput = try? AVCaptureDeviceInput(device: newCameraDevice!)
        session.addInput(newVideoInput!)
        session.commitConfiguration()
        
    }
    
    private func getCamera(with position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        
        let deviceDescoverySession = AVCaptureDevice.DiscoverySession.init(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera],mediaType: AVMediaType.video,position: position)
        
        for device in deviceDescoverySession.devices {
            if device.position == position {
                return device
            }
        }
        
        return nil
    }
    
    private func setupCamera(){
        
        videoDataOutput = AVCaptureVideoDataOutput()
        videoDataOutput.alwaysDiscardsLateVideoFrames = true
        videoDataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        videoDataOutput.connection(with: .video)?.isEnabled = true
        
        session = AVCaptureSession()
        session.sessionPreset = .vga640x480
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        
        do {
            guard let captureDevice = captureDevice else {
                let alert = UIAlertController(title: "Error", message: "Camera doesn't work on the simulator! You have to test this on an actual device!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { action in
                    self.btnCloseTapped()
                }))
                
                self.present(alert, animated: true)
                
                return
            }
            
            let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
            
            if session.canAddInput(deviceInput) {
                session.addInput(deviceInput)
            }
            
            if session.canAddOutput(videoDataOutput) {
                session.addOutput(videoDataOutput)
            }
            view.layer.masksToBounds = true
            view.layer.insertSublayer(previewLayer, at: 0)
            previewLayer.frame = view.bounds
            session.startRunning()
        } catch let error {
            debugPrint("\(self.self): \(#function) line: \(#line).  \(error.localizedDescription)")
        }
        
    }
    
    private func setupUI(){
        
        // view
        view.backgroundColor = .black
        view.addSubview(btnClose)
        view.addSubview(btnCapture)
        view.addSubview(btnSmile)
        
        // btnClose
        btnClose.translatesAutoresizingMaskIntoConstraints = false
        btnClose.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        btnClose.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        btnClose.setTitle("X", for: .normal)
        btnClose.setTitleColor(.white, for: .normal)
        btnClose.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        btnClose.addTarget(self, action: #selector(btnCloseTapped), for: .touchDown)
        
        // btnCapture
        btnCapture.translatesAutoresizingMaskIntoConstraints = false
        btnCapture.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        btnCapture.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnCapture.heightAnchor.constraint(equalToConstant: 96).isActive = true
        btnCapture.widthAnchor.constraint(equalToConstant: 96).isActive = true
        let image = UIImage(named: "img_circle")?.withRenderingMode(.alwaysOriginal)
        btnCapture.setImage(image, for: .normal)
        btnCapture.addTarget(self, action: #selector(btnCaptureTapped), for: .touchDown)
        
        // btnSmile
        btnSmile.translatesAutoresizingMaskIntoConstraints = false
        btnSmile.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        btnSmile.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        btnSmile.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnSmile.widthAnchor.constraint(equalToConstant: 50).isActive = true
        let imageSmile = UIImage(named: "img_smile")?.withRenderingMode(.alwaysOriginal)
        btnSmile.setImage(imageSmile, for: .normal)
        btnSmile.addTarget(self, action: #selector(btnSmileTapped), for: .touchDown)
        
    }
    
}

extension CameraController: AVCaptureVideoDataOutputSampleBufferDelegate {}
