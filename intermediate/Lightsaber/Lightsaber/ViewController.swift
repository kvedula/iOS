//
//  ViewController.swift
//  Lightsaber
//
//  Created by Varun Shenoy on 7/21/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var blade: UIView!
    
    @IBOutlet weak var hilt: UIImageView!
    
    
    @IBOutlet weak var bladeHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var lightsaberOpen = false
    
    var movementSounds = [AVAudioPlayer]()
    
    var onSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("LightsaberOn", ofType: "wav")!)
    var offSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("LightsaberOff", ofType: "wav")!)
    var hum = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("hum", ofType: "wav")!)
    
    var shakeSound1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("1", ofType: "wav")!)
    var shakeSound2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("2", ofType: "wav")!)
    var shakeSound3 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("3", ofType: "wav")!)
    var shakeSound4 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("4", ofType: "wav")!)
    var shakeSound5 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("5", ofType: "wav")!)
    
    var onSoundPlayer = AVAudioPlayer()
    var offSoundPlayer = AVAudioPlayer()
    var humPlayer = AVAudioPlayer()
    
    var shakePlayer1 = AVAudioPlayer()
    var shakePlayer2 = AVAudioPlayer()
    var shakePlayer3 = AVAudioPlayer()
    var shakePlayer4 = AVAudioPlayer()
    var shakePlayer5 = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do { self.onSoundPlayer = try AVAudioPlayer(contentsOfURL:self.onSound, fileTypeHint: nil) } catch _ { }
        do { self.offSoundPlayer = try AVAudioPlayer(contentsOfURL:self.offSound, fileTypeHint: nil) } catch _ { }
        do { self.shakePlayer1 = try AVAudioPlayer(contentsOfURL:self.shakeSound1, fileTypeHint: nil) } catch _ { }
        do { self.shakePlayer2 = try AVAudioPlayer(contentsOfURL:self.shakeSound2, fileTypeHint: nil) } catch _ { }
        do { self.shakePlayer3 = try AVAudioPlayer(contentsOfURL:self.shakeSound3, fileTypeHint: nil) } catch _ { }
        do { self.shakePlayer4 = try AVAudioPlayer(contentsOfURL:self.shakeSound4, fileTypeHint: nil) } catch _ { }
        do { self.shakePlayer5 = try AVAudioPlayer(contentsOfURL:self.shakeSound5, fileTypeHint: nil) } catch _ { }
        do { self.humPlayer = try AVAudioPlayer(contentsOfURL:self.hum, fileTypeHint: nil) } catch _ { }
        
        onSoundPlayer.prepareToPlay()
        offSoundPlayer.prepareToPlay()
        
        humPlayer.numberOfLoops = -1
        humPlayer.prepareToPlay()
        
        shakePlayer1.prepareToPlay()
        shakePlayer2.prepareToPlay()
        shakePlayer3.prepareToPlay()
        shakePlayer4.prepareToPlay()
        shakePlayer5.prepareToPlay()
        
        movementSounds.append(shakePlayer1)
        movementSounds.append(shakePlayer2)
        movementSounds.append(shakePlayer3)
        movementSounds.append(shakePlayer4)
        movementSounds.append(shakePlayer5)
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleLightsaber(sender: AnyObject) {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        if lightsaberOpen {
            offSoundPlayer.play()
            humPlayer.stop()
            self.bladeHeightConstraint.constant = 0
            UIView.animateWithDuration(0.3) {
                self.view.layoutIfNeeded()
            }
            #if arch(i386) || arch(x86_64)
                
            #else
                toggleTorch(on: false)
            #endif
        } else {
            onSoundPlayer.play()
            humPlayer.play()
            self.bladeHeightConstraint.constant = 375
            UIView.animateWithDuration(0.3) {
                self.view.layoutIfNeeded()
                self.infoLabel.alpha = 0
            }
            #if arch(i386) || arch(x86_64)
                
            #else
                toggleTorch(on: true)
            #endif
        }
        lightsaberOpen = !lightsaberOpen
    }
    
    func toggleTorch(on on: Bool) {
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                if on == true {
                    device.torchMode = .On
                } else {
                    device.torchMode = .Off
                }
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if(event.subtype == UIEventSubtype.MotionShake) && lightsaberOpen {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            let randomIndex = Int(arc4random_uniform(UInt32(movementSounds.count)))
            movementSounds[randomIndex].play()
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }


}

