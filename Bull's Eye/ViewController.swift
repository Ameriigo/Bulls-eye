//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Macbook on 04/04/2017.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var currentValue: Int = 50
    var score = 0
    var round = 0
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50 //targetValue
        slider.value = Float(currentValue)
        
        
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    override func viewDidLoad() {
        //super.viewDidLoad()
        //currentValue = lroundf(slider.value)
        // slider.value = Float(currentValue) STAČÍ ZMĚNIT INT A JE TO :)
        //targetValue = 1 + Int(arc4random_uniform(100))
    
        
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    @IBAction func showAlert() {
        /********************************************
         var difference = currentValue - targetValue
         if difference < 0 {
         difference = difference * -1 
         *********************************************/
        
        /******************************************
         var difference: Int
         if currentValue > targetValue {
         difference = currentValue - targetValue
         } else if targetValue > currentValue {
         difference = targetValue - currentValue
         } else {
         difference = 0 
         }
         *****************************************/
        let difference = abs (targetValue - currentValue)
        
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
             points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
         score += points
        
        let message = "You scored \(points) points"
            
            /***********************************************
                "The value of the slider is: \(currentValue)"
                    + "\nThe target value is: \(targetValue)"
                    + "\nThe difference is: \(difference)"
            ***********************************************/
       
        //let message = "The value of the slider is now: \(currentValue)"
        
        let alert = UIAlertController(title: title,
                                      message: message, // changed
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: { action in
                                                self.startNewRound()
                                                self.updateLabels()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        // startNewRound()
        // updateLabels()
    }
    @IBAction func sliderMoved(_ slider: UISlider) {

        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }

}

