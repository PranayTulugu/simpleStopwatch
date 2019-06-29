//
//  ViewController.swift
//  Stopwatch
//
//  Created by Pranay on 6/25/19.
//  Copyright © 2019 Pranay. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    //initialization of variables
    var startTime = Double(-1)
    var timer = Timer()
    var isRunning:Bool = false
    var theString = ""
    var labelText = "00:00:00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add white circle around the buttons
        startButton.layer.borderWidth = 1
        let white = UIColor.init(white: 1, alpha: 1)
        startButton.layer.borderColor = white.cgColor
        startButton.layer.cornerRadius = 50
      
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = white.cgColor
        resetButton.layer.cornerRadius = 50
        
    }
    
    
    @IBAction func startButtonPush(_ sender: Any) {
        
        //if in the timerloop
        if(isRunning) {
            //mark as false meaining we pushed after starting/stoping first time
            startButton.setTitle("Start", for: .normal)
            isRunning = false;
            timer.invalidate()
            //get time after stopping so we can resume
            labelText = timeLabel.text!
        } else {
            startButton.setTitle("Stop", for: .normal)
            startTime = Date.timeIntervalSinceReferenceDate
            //call tick() every 0.01 sec
            timer = Timer.scheduledTimer(timeInterval: 0.01 , target: self,
                                         selector:#selector(self.tick), userInfo: nil, repeats: true)
        }
        
    }
    
    
    @IBAction func resetButtonPush(_ sender: Any) {
        startButton.setTitle("Start", for: .normal)
        timer.invalidate()
        timeLabel.text = "00:00:00"
        isRunning = false
        theString = ""
        labelText = "00:00:00"
    }
    
    @objc func tick() {
        
        let currentTime = Date.timeIntervalSinceReferenceDate
        let update = currentTime - startTime
        let updateString = String(format:"%.02f", update)
        
        //get the deciseconds, seconds and minutes
        let initTimeArr = updateString.components(separatedBy: ".")
        var fracSec = Int(initTimeArr[1])!
        var sec = Int(initTimeArr[0])! % 60
        var minutes = Int(initTimeArr[0])! / 60
        
        //add the previous label (adding 0s if first time)
        let prevTimeArr = labelText.components(separatedBy: ":")
        fracSec += Int(prevTimeArr[2])!
        //sec += sec + overflow deciseconds
        sec = sec + Int(prevTimeArr[1])! + fracSec/100
        //minutes += minutes + overflow seconds
        minutes = minutes + Int(prevTimeArr[0])! + sec/60
        //truncate seconds and fracSec
        fracSec = fracSec % 100
        sec = sec % 60
        
        //format and update label
        theString = String(format:"%02d", minutes) + ":" +
            String(format:"%02d",sec) + ":" + String(format:"%02d", fracSec)
        timeLabel.text = theString
        
        //change boolean
        if(!isRunning) {
            isRunning = true
        }
    }
    

}

