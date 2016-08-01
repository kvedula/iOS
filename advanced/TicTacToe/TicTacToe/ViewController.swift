//
//  ViewController.swift
//  TicTacToe
//
//  Created by Varun Shenoy on 7/20/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var one: UIButton!

    @IBOutlet weak var two: UIButton!

    @IBOutlet weak var three: UIButton!

    @IBOutlet weak var four: UIButton!

    @IBOutlet weak var five: UIButton!

    @IBOutlet weak var six: UIButton!

    @IBOutlet weak var seven: UIButton!

    @IBOutlet weak var eight: UIButton!

    @IBOutlet weak var nine: UIButton!

    @IBOutlet weak var statusLabel: UILabel!

    var currentlyXTurn = true

    var X = UIImage(named: "X")
    var O = UIImage(named: "O")

    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var currentBoard = ["", "", "", "", "", "", "", "" , ""]

    var gameIsOver = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func oneTapped(sender: AnyObject) {
        let img = one.imageForState(.Normal)
        if img == nil && gameIsOver == false {
            if currentlyXTurn {
                one.setImage(X, forState: .Normal)
                currentBoard[0] = "X"
            } else {
                one.setImage(O, forState: .Normal)
                currentBoard[0] = "O"
            }
            changeTurn()
        }
    }

    @IBAction func twoTapped(sender: AnyObject) {
        let img = two.imageForState(.Normal)
        if img == nil && gameIsOver == false {
            if currentlyXTurn {
                two.setImage(X, forState: .Normal)
                currentBoard[1] = "X"
            } else {
                two.setImage(O, forState: .Normal)
                currentBoard[1] = "O"
            }
            changeTurn()
        }
    }

    @IBAction func threeTapped(sender: AnyObject) {
        let img = three.imageForState(.Normal)
        if img == nil && gameIsOver == false {
            if currentlyXTurn {
                three.setImage(X, forState: .Normal)
                currentBoard[2] = "X"
            } else {
                three.setImage(O, forState: .Normal)
                currentBoard[2] = "O"
            }
            changeTurn()
        }
    }

    @IBAction func fourTapped(sender: AnyObject) {
        let img = four.imageForState(.Normal)
        if img == nil && gameIsOver == false {
            if currentlyXTurn {
                four.setImage(X, forState: .Normal)
                currentBoard[3] = "X"
            } else {
                four.setImage(O, forState: .Normal)
                currentBoard[3] = "O"
            }
            changeTurn()
        }
    }

    @IBAction func fiveTapped(sender: AnyObject) {
        let img = five.imageForState(.Normal)
        if img == nil && gameIsOver == false {
            if currentlyXTurn {
                five.setImage(X, forState: .Normal)
                currentBoard[4] = "X"
            } else {
                five.setImage(O, forState: .Normal)
                currentBoard[4] = "O"
            }
            changeTurn()
        }
    }

    @IBAction func sixTapped(sender: AnyObject) {
        let img = six.imageForState(.Normal)
        if img == nil && gameIsOver == false {
            if currentlyXTurn {
                six.setImage(X, forState: .Normal)
                currentBoard[5] = "X"
            } else {
                six.setImage(O, forState: .Normal)
                currentBoard[5] = "O"
            }
            changeTurn()
        }
    }

    @IBAction func sevenTapped(sender: AnyObject) {
        let img = seven.imageForState(.Normal)
        if img == nil && gameIsOver == false {
            if currentlyXTurn {
                seven.setImage(X, forState: .Normal)
                currentBoard[6] = "X"
            } else {
                seven.setImage(O, forState: .Normal)
                currentBoard[6] = "O"
            }
            changeTurn()
        }
    }

    @IBAction func eightTapped(sender: AnyObject) {
        let img = eight.imageForState(.Normal)
        if img == nil && gameIsOver == false {
            if currentlyXTurn {
                eight.setImage(X, forState: .Normal)
                currentBoard[7] = "X"
            } else {
                eight.setImage(O, forState: .Normal)
                currentBoard[7] = "O"
            }
            changeTurn()
        }
    }

    @IBAction func nineTapped(sender: AnyObject) {
        let img = nine.imageForState(.Normal)
        if img == nil && gameIsOver == false {
            if currentlyXTurn {
                nine.setImage(X, forState: .Normal)
                currentBoard[8] = "X"
            } else {
                nine.setImage(O, forState: .Normal)
                currentBoard[8] = "O"
            }
            changeTurn()
        }
    }

    func changeTurn() {
        print("tap")

        winCheck()
        if !gameIsOver {
            currentlyXTurn = !currentlyXTurn
            if !currentBoard.contains("") {
                statusLabel.textColor = UIColor(red:0.21, green:0.29, blue:0.36, alpha:1.00)
                statusLabel.text = "TIED GAME!"
                gameIsOver = true
            } else {
                if currentlyXTurn {
                    statusLabel.textColor = UIColor(red:0.84, green:0.26, blue:0.29, alpha:1.00)
                    statusLabel.text = "It is currently X's turn"
                } else {
                    statusLabel.textColor = UIColor(red:0.34, green:0.75, blue:0.53, alpha:1.00)
                    statusLabel.text = "It is currently O's turn"
                }
            }
        }
    }

    func winCheck() {
        var currentMove = ""
        if currentlyXTurn {
            currentMove = "X"
        } else {
            currentMove = "O"
        }
        
        for win in winningCombinations {
            print(currentBoard)
            if currentBoard[win[0]] == currentMove && currentBoard[win[1]] == currentMove && currentBoard[win[2]] == currentMove {
                statusLabel.text = "\(currentMove) WINS!"
                gameIsOver = true
            }
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    @IBAction func restartGame(sender: AnyObject) {
        currentlyXTurn = true
        gameIsOver = false
        currentBoard = ["", "", "", "", "", "", "", "" , ""]

        statusLabel.textColor = UIColor(red:0.84, green:0.26, blue:0.29, alpha:1.00)
        statusLabel.text = "It is currently X's turn"

        one.setImage(nil, forState: .Normal)
        two.setImage(nil, forState: .Normal)
        three.setImage(nil, forState: .Normal)
        four.setImage(nil, forState: .Normal)
        five.setImage(nil, forState: .Normal)
        six.setImage(nil, forState: .Normal)
        seven.setImage(nil, forState: .Normal)
        eight.setImage(nil, forState: .Normal)
        nine.setImage(nil, forState: .Normal)

    }

}
