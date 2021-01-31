//
//  ViewController.swift
//  ICE1
//
//  Created by Juliana de Carvalho on 2021-01-31.
//  Copyright © 2021 Juliana de Carvalho. All rights reserved.
//  Student Id: 301137060

import UIKit

class ViewController: UIViewController {

    var playerCredit = 600
    var winningAmount = 0
    var currentJackpot = 5000
    var playerBet = 10
    var grapes = 0
    var bananas = 0
    var oranges = 0
    var cherries = 0
    var bars = 0
    var bells = 0
    var sevens = 0
    var blanks = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func SpinBtn(_ sender: UIButton) {
        
        spinReels()
        determineWinnings()
        resetCounts()
        
    }
    
    func spinReels()
    {
        print("currentJackpot: " + String(currentJackpot))
        print("player Credit: " + String(playerCredit))
        print("player Bet: " + String(playerBet))
       
        
        var betLine = [" ", " ", " "]
        var outCome = [0, 0, 0]

        for spin in 0...2
        {
            outCome[spin] = Int(floor((Double.random(in: 0...1) * 65) + 1))
            switch (outCome[spin])
            {
            case  _checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):  // 41.5% probability
                    betLine[spin] = "Blank"
                     blanks += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37): // 15.4% probability
                    betLine[spin] = "Grapes"
                     grapes += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46): // 13.8% probability
                    betLine[spin] = "Banana"
                     bananas += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54): // 12.3% probability
                    betLine[spin] = "Orange"
                     oranges += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59): //  7.7% probability
                    betLine[spin] = "Cherry"
                     cherries += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62): //  4.6% probability
                    betLine[spin] = "Bar"
                     bars += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64): //  3.1% probability
                    betLine[spin] = "Bell"
                     bells += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65): //  1.5% probability
                    betLine[spin] = "Seven"
                     sevens += 1
                    break
            default:
                print ("Default")
            }
        }
        print(betLine)
    }

    //This function calculates the player's winnings.
    func determineWinnings()
    {
        if ( blanks == 0)
        {
            if ( grapes == 3)
            {
                 winningAmount =  playerBet * 10
            }
            else if ( bananas == 3)
            {
                 winningAmount =  playerBet * 20
            }
            else if ( oranges == 3)
            {
                 winningAmount =  playerBet * 30
            }
            else if ( cherries == 3)
            {
                 winningAmount =  playerBet * 40
            }
            else if ( bars == 3)
            {
                 winningAmount =  playerBet * 50
            }
            else if ( bells == 3)
            {
                 winningAmount =  playerBet * 75
            }
            else if ( sevens == 3)
            {
                 winningAmount =  playerBet * 100
            }
            else if ( grapes == 2)
            {
                 winningAmount =  playerBet * 2
            }
            else if ( bananas == 2)
            {
                 winningAmount =  playerBet * 2
            }
            else if ( oranges == 2)
            {
                 winningAmount =  playerBet * 3
            }
            else if ( cherries == 2)
            {
                 winningAmount =  playerBet * 4
            }
            else if ( bars == 2)
            {
                 winningAmount =  playerBet * 5
            }
            else if ( bells == 2)
            {
                 winningAmount =  playerBet * 10
            }
            else if ( sevens == 2)
            {
                 winningAmount =  playerBet * 20
            }
            else if ( sevens == 1)
            {
                 winningAmount =  playerBet * 5
            }
            else
            {
                 winningAmount =  playerBet * 1
            }
            print("WIN! :) ")
            print("Winning Amount: " + String(winningAmount))
            
            playerCredit = playerCredit + winningAmount
        }
        else
        {
            print("LOSS! :( ")
            currentJackpot = currentJackpot + playerBet
            playerCredit = playerCredit - playerBet
        }
        
         print(" ------------- ")

    }
    
    
    
    //Utility function to check if a value falls within a range of bounds
    func _checkRange(value: Int, lowerBounds: Int, upperBounds: Int)-> Int
    {
        return (value >= lowerBounds && value <= upperBounds) ? value : -1
    }
    
    func resetCounts()
    {
        grapes = 0
        bananas = 0
        oranges = 0
        cherries = 0
        bars = 0
        bells = 0
        sevens = 0
        blanks = 0
    }
  
}

