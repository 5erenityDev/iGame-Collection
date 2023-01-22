//
//  ViewControllerMemMatch.swift
//  iGameCollection
//
//  Created by Blankenship, Sean A. on 11/12/22.
//

import UIKit

class ViewControllerMemMatch: UIViewController {

    var matArr = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 4)
    var ranArr = [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
    var firstGuess = -1
    var secondGuess = -1
    var correctCount = 0
    
    @IBOutlet weak var lblMatch: UILabel!
    
    @IBOutlet weak var btnPlyAga: UIButton!
    @IBOutlet weak var btnBTMM: UIButton!
    @IBOutlet weak var btnReady: UIButton!

    @IBOutlet weak var btnOneOne: UIButton!
    @IBOutlet weak var btnOneTwo: UIButton!
    @IBOutlet weak var btnOneThree: UIButton!
    
    @IBOutlet weak var btnTwoOne: UIButton!
    @IBOutlet weak var btnTwoTwo: UIButton!
    @IBOutlet weak var btnTwoThree: UIButton!
    
    @IBOutlet weak var btnThreeOne: UIButton!
    @IBOutlet weak var btnThreeTwo: UIButton!
    @IBOutlet weak var btnThreeThree: UIButton!
    
    @IBOutlet weak var btnFourOne: UIButton!
    @IBOutlet weak var btnFourTwo: UIButton!
    @IBOutlet weak var btnFourThree: UIButton!
    
    
    @IBAction func prsPlyAga(_ sender: Any) {
        btnPlyAga.isHidden = true
        btnBTMM.isHidden = true
        btnReady.isHidden = false
        prepGame()
    }
    
    @IBAction func prsRdy(_ sender: Any) {
        btnReady.isHidden = true
        hideButtons(isGameOver: false)
        lblMatch.text = "Select A Square!"
    }
    
    @IBAction func prsOneOne(_ sender: Any) {
        determineVictory(row: 0, col: 0)
        btnOneOne.isEnabled = false
        setAnimalImage(button: btnOneOne, imageNum: matArr[0][0])
    }
    @IBAction func prsOneTwo(_ sender: Any) {
        determineVictory(row: 0, col: 1)
        btnOneTwo.isEnabled = false
        setAnimalImage(button: btnOneTwo, imageNum: matArr[0][1])
    }
    @IBAction func prsOneThree(_ sender: Any) {
        determineVictory(row: 0, col: 2)
        btnOneThree.isEnabled = false
        setAnimalImage(button: btnOneThree, imageNum: matArr[0][2])
    }
    
    @IBAction func prsTwoOne(_ sender: Any) {
        determineVictory(row: 1, col: 0)
        btnTwoOne.isEnabled = false
        setAnimalImage(button: btnTwoOne, imageNum: matArr[1][0])
    }
    @IBAction func prsTwoTwo(_ sender: Any) {
        determineVictory(row: 1, col: 1)
        btnTwoTwo.isEnabled = false
        setAnimalImage(button: btnTwoTwo, imageNum: matArr[1][1])
    }
    @IBAction func prsTwoThree(_ sender: Any) {
        determineVictory(row: 1, col: 2)
        btnTwoThree.isEnabled = false
        setAnimalImage(button: btnTwoThree, imageNum: matArr[1][2])
    }
    
    @IBAction func prsThreeOne(_ sender: Any) {
        determineVictory(row: 2, col: 0)
        btnThreeOne.isEnabled = false
        setAnimalImage(button: btnThreeOne, imageNum: matArr[2][0])
    }
    @IBAction func prsThreeTwo(_ sender: Any) {
        determineVictory(row: 2, col: 1)
        btnThreeTwo.isEnabled = false
        setAnimalImage(button: btnThreeTwo, imageNum: matArr[2][1])
    }
    @IBAction func prsThreeThree(_ sender: Any) {
        determineVictory(row: 2, col: 2)
        btnThreeThree.isEnabled = false
        setAnimalImage(button: btnThreeThree, imageNum: matArr[2][2])
    }
    
    @IBAction func prsFourOne(_ sender: Any) {
        determineVictory(row: 3, col: 0)
        btnFourOne.isEnabled = false
        setAnimalImage(button: btnFourOne, imageNum: matArr[3][0])
    }
    @IBAction func prsFourTwo(_ sender: Any) {
        determineVictory(row: 3, col: 1)
        btnFourTwo.isEnabled = false
        setAnimalImage(button: btnFourTwo, imageNum: matArr[3][1])
    }
    @IBAction func prsFourThree(_ sender: Any) {
        determineVictory(row: 3, col: 2)
        btnFourThree.isEnabled = false
        setAnimalImage(button: btnFourThree, imageNum: matArr[3][2])
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepGame()
        hideButtons(isGameOver: true)
        btnPlyAga.isHidden = true
        btnBTMM.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    func prepGame()
    {
        lblMatch.text = "Memorize The Animals!"
        ranArr.shuffle()
        matArr[0][0] = ranArr[0]
        matArr[0][1] = ranArr[1]
        matArr[0][2] = ranArr[2]
        
        matArr[1][0] = ranArr[3]
        matArr[1][1] = ranArr[4]
        matArr[1][2] = ranArr[5]
        
        matArr[2][0] = ranArr[6]
        matArr[2][1] = ranArr[7]
        matArr[2][2] = ranArr[8]
        
        matArr[3][0] = ranArr[9]
        matArr[3][1] = ranArr[10]
        matArr[3][2] = ranArr[11]
        
        setAnimalImage(button: btnOneOne, imageNum: matArr[0][0])
        setAnimalImage(button: btnOneTwo, imageNum: matArr[0][1])
        setAnimalImage(button: btnOneThree, imageNum: matArr[0][2])
        
        setAnimalImage(button: btnTwoOne, imageNum: matArr[1][0])
        setAnimalImage(button: btnTwoTwo, imageNum: matArr[1][1])
        setAnimalImage(button: btnTwoThree, imageNum: matArr[1][2])
        
        setAnimalImage(button: btnThreeOne, imageNum: matArr[2][0])
        setAnimalImage(button: btnThreeTwo, imageNum: matArr[2][1])
        setAnimalImage(button: btnThreeThree, imageNum: matArr[2][2])
        
        setAnimalImage(button: btnFourOne, imageNum: matArr[3][0])
        setAnimalImage(button: btnFourTwo, imageNum: matArr[3][1])
        setAnimalImage(button: btnFourThree, imageNum: matArr[3][2])
        
        firstGuess = -1
        secondGuess = -1
        correctCount = 0
    }
    
    func setAnimalImage(button:UIButton, imageNum:Int){
        switch imageNum{
        case 0:
            button.setBackgroundImage(UIImage(named: "chicken"), for: .normal)
        case 1:
            button.setBackgroundImage(UIImage(named: "cow"), for: .normal)
        case 2:
            button.setBackgroundImage(UIImage(named: "donkey"), for: .normal)
        case 3:
            button.setBackgroundImage(UIImage(named: "horse"), for: .normal)
        case 4:
            button.setBackgroundImage(UIImage(named: "pig"), for: .normal)
        case 5:
            button.setBackgroundImage(UIImage(named: "sheep"), for: .normal)
        default:
            print("error")
        }
    }
    
    func determineVictory(row:Int, col:Int)
    {
        switch(checkMatch(r: row, c: col))
        {
        case -1:
            lblMatch.text = "Not a match! You lose..."
            correctCount = 0
            hideButtons(isGameOver: true)
            print("wrong")
        case 1:
            lblMatch.text = "Good job! Keep going!"
            correctCount += 1
            print("match")
        default:
            lblMatch.text = "Select the Matching Square!"
            print("inPlay")
        }
        if(correctCount == 6)
        {
            lblMatch.text = "Fantastic Job! You Win!"
            hideButtons(isGameOver: true)
        }
    }
    
    func checkMatch(r:Int, c:Int) -> Int
    {
        if(firstGuess == -1)
        {
            firstGuess = matArr[r][c]
            return 0
        }
        else
        {
            secondGuess = matArr[r][c]
            if (firstGuess == secondGuess)
            {
                firstGuess = -1
                secondGuess = -1
                return 1
            }
            else
            {
                firstGuess = -1
                secondGuess = -1
                return -1
            }
        }
    }
    
    func hideButtons(isGameOver:Bool)
    {
        btnOneOne.isEnabled = !isGameOver
        btnOneTwo.isEnabled = !isGameOver
        btnOneThree.isEnabled = !isGameOver
        
        btnTwoOne.isEnabled = !isGameOver
        btnTwoTwo.isEnabled = !isGameOver
        btnTwoThree.isEnabled = !isGameOver
        
        btnThreeOne.isEnabled = !isGameOver
        btnThreeTwo.isEnabled = !isGameOver
        btnThreeThree.isEnabled = !isGameOver

        btnFourOne.isEnabled = !isGameOver
        btnFourTwo.isEnabled = !isGameOver
        btnFourThree.isEnabled = !isGameOver

        btnPlyAga.isHidden = !isGameOver
        btnBTMM.isHidden = !isGameOver
        
        if(!isGameOver)
        {
            btnOneOne.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnOneTwo.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnOneThree.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnTwoOne.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnTwoTwo.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnTwoThree.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnThreeOne.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnThreeTwo.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnThreeThree.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnFourOne.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnFourTwo.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            btnFourThree.setBackgroundImage(UIImage(named: "barn"), for: .normal)
            
        }
    }
}
