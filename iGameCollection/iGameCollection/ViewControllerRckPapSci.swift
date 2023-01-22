//
//  ViewControllerRckPapSci.swift
//  iGameCollection
//
//  Created by 溝口明寿美 on 2022/11/08.
//

import UIKit

class ViewControllerRckPapSci: UIViewController {
    @IBOutlet weak var winningStreak: UILabel!
    
    @IBOutlet weak var monsterWord: UILabel!
    @IBOutlet weak var monsterImage: UIImageView!
    @IBOutlet weak var monsterHand: UIImageView!
    @IBOutlet weak var selectImageView: UIImageView!
    
    @IBOutlet weak var btnRck: UIButton!
    @IBOutlet weak var btnPap: UIButton!
    @IBOutlet weak var btnSci: UIButton!
    
    @IBOutlet weak var btnPlyAga: UIButton!
    @IBOutlet weak var btnBTMM: UIButton!
    
    @IBAction func playSelect(_ sender: Any) {
        hideButtons(isGameOver: false)
        monsterWord.text = "Let's play!"
        setMonsterImage(imageView: monsterImage, imageNumber: Int.random(in: 0..<4))
        selectImageView.image = UIImage(named:"handRock")
        monsterHand.image = UIImage(named:"handRock")
    }
    
    @IBAction func rockSelect(_ sender: Any) {
        RPSAction(selectNumber: 0)
        hideButtons(isGameOver: true)
    }
    @IBAction func paperSelect(_ sender: Any) {
        RPSAction(selectNumber: 2)
        hideButtons(isGameOver: true)
    }
    @IBAction func scissorsSelect(_ sender: Any) {
        RPSAction(selectNumber: 1)
        hideButtons(isGameOver: true)
    }
    
    fileprivate func hideButtons(isGameOver:Bool)
    {
        btnRck.isHidden = isGameOver
        btnPap.isHidden = isGameOver
        btnSci.isHidden = isGameOver
        btnPlyAga.isHidden = !isGameOver
        btnBTMM.isHidden = !isGameOver
    }
    var count = 0
    //
    fileprivate func RPSAction(selectNumber: Int) {
        //show monster's hand
        let monsterNumber: Int = Int.random(in: 0..<3)
        
        
        if monsterNumber == 0{
            monsterHand.image = UIImage(named:"handRock")
        }else if monsterNumber == 1{
            monsterHand.image = UIImage(named:"handScissors")
        }else if monsterNumber == 2{
            monsterHand.image = UIImage(named:"handPaper")
        }
        
        //indicate hands which you choose
        if selectNumber == 0{
            selectImageView.image = UIImage(named:"handRock")
        }else if selectNumber == 1{
            selectImageView.image = UIImage(named:"handScissors")
        }else if selectNumber == 2{
            selectImageView.image = UIImage(named:"handPaper")
        }
        
        //result rps
            if selectNumber == monsterNumber{
                monsterWord.text = "Draw"
            }else if (selectNumber == 0 && monsterNumber == 1) ||
                        (selectNumber == 1 && monsterNumber == 2) ||
                        (selectNumber == 2 && monsterNumber == 0) {
                count = count + 1
                monsterWord.text = "You win!"
                if (count > 0 && count < 4){
                    winningStreak.text = "Winning Streak: \(count)\nKeep it up!"
                }else if (count > 3){
                    winningStreak.text = "Winning Streak: \(count)\n100% lucky!"
                }
            }else if (selectNumber == 0 && monsterNumber == 2) ||
                        (selectNumber == 1 && monsterNumber == 0) ||
                (selectNumber == 2 && monsterNumber == 1) {
                monsterWord.text = "You lose..."
                count = 0
                winningStreak.text = "Winning Streak: \(count)"
           }
        }
    
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
    
       //help with setting the image
       
       func setMonsterImage(imageView:UIImageView, imageNumber:Int){
           switch imageNumber{
           case 0:
               imageView.image = UIImage(named: "monsterPurple")
           case 1:
               imageView.image = UIImage(named: "monsterBlue")
           case 2:
               imageView.image = UIImage(named: "monsterRed")
           case 3:
               imageView.image = UIImage(named: "monsterYellow")
           default:
               print("error")
           }
       }
   }

