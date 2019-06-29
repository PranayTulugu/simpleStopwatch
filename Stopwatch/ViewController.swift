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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startButton.layer.borderWidth = 1
        let white = UIColor.init(white: 1, alpha: 1)
        startButton.layer.borderColor = white.cgColor
        startButton.layer.cornerRadius = 50
      
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = white.cgColor
        resetButton.layer.cornerRadius = 50
        
    }


}

