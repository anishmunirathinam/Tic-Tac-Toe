//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Anish on 17/01/17.
//  Copyright © 2017 Idea Bubbles. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var gameOver: UILabel!
    
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8], [2,4,6]]
    
    @IBOutlet weak var button: UIButton!

    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainAction(sender: AnyObject)
    {
        gameOver.hidden = true
        
        playAgain.hidden = true
        
        gameActive = true
        
        activePlayer = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button: UIButton
        
        for var i = 0; i < 9; i++ {
        
            button = view.viewWithTag(i) as! UIButton
            
            button.setImage(nil, forState: .Normal)
        }
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject)
    {
        if gameState[sender.tag] == 0 && gameActive == true
        {
            playAgain.hidden = false
            
            var image = UIImage()
        
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1
            {
                image = UIImage(named: "x.png")!
            
                activePlayer = 2
            }
            else
            {
                image = UIImage(named: "o.png")!
            
                activePlayer = 1
            }
        
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations{
            
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                {
                    print("We have a winner")
                    
                    if gameState[combination[0]] == 1
                    {
                        print("Crosses have won!")
                        
                        self.gameOver.hidden = false
                        self.gameOver.alpha = 0.0
                        
                        UIView.animateWithDuration(1.6, animations: {
                            
                            self.gameOver.text = "\"XXX\"Crosses have won!"
                            self.gameOver.alpha = 1.0
                        })
                    }
                    else
                    {
                        print("Noughts have won!")
                        
                        self.gameOver.hidden = false
                        self.gameOver.alpha = 0.0
                        
                        UIView.animateWithDuration(1.6, animations: {
                            
                            self.gameOver.text = "\"OOO\"Noughts have won!"
                            self.gameOver.alpha = 1.0
                        })
                    }
                    gameActive = false
                }
                
            }
            
            
            
        }
        
    }
    
    override func viewDidLayoutSubviews()
    {
        self.prefersStatusBarHidden()
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.gameOver.hidden = true
        
        self.playAgain.hidden = true
        
        self.playAgain.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

