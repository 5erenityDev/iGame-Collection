//
//  ViewControllerBlackjack.swift
//  iGameCollection
//
//  Created by Rhoton, Andrew on 11/12/22.
//

import UIKit

class ViewControllerBlackjack: UIViewController {

    @IBOutlet weak var lblDealer: UILabel!
    @IBOutlet weak var lblPlayer: UILabel!
    @IBOutlet weak var lblDeal: UILabel!
    @IBOutlet weak var lblPlay: UILabel!
    
    @IBOutlet weak var btnHit: UIButton!
    @IBOutlet weak var btnStand: UIButton!
    @IBOutlet weak var btnPlyAga: UIButton!
    @IBOutlet weak var btnBTMM: UIButton!
    
    var playerHand = 0
    var dealerHand = 0
    
    
    @IBAction func prsHit(_ sender: Any) {
        drawCard(player: 1)
        lblPlayer.text = "\(playerHand)"
        if (checkBust(player: 1))
        {
            lblDeal.text = "Bust! Dealer wins..."
            btnHit.isHidden = true
            btnStand.isHidden = true
            btnPlyAga.isHidden = false
            btnBTMM.isHidden = false
        }
    }
    
    @IBAction func prsStand(_ sender: Any) {
        while (dealerHand < 17)
        {
            drawCard(player: 2)
        }
        lblDealer.text = "\(dealerHand)"
        if (dealerHand > 21)
        {
            lblDeal.text = "Dealer busted! Player Wins!"
            btnHit.isHidden = true
            btnStand.isHidden = true
            btnPlyAga.isHidden = false
            btnBTMM.isHidden = false
        }else{
            lblDeal.text = checkWin()
            btnHit.isHidden = true
            btnStand.isHidden = true
            btnPlyAga.isHidden = false
            btnBTMM.isHidden = false
        }

    }

    @IBAction func prsPlayAgain(_ sender: Any) {
        btnHit.isHidden = false
        btnStand.isHidden = false
        btnPlyAga.isHidden = true
        btnBTMM.isHidden = true
        lblDeal.text = "Dealer:"
        prepGame()
    }
    
    func drawCard(player:Int) {
        if(player == 1) {
            let card = Int.random(in: 1...11)
            playerHand = playerHand + card
        }
        else if(player == 2) {
            let card = Int.random(in: 1...11)
            dealerHand = dealerHand + card
        }
    }
    
    func checkBust(player:Int) -> Bool {
        if(player == 1) {
                if(playerHand > 21) {
                    return true
                }else{
                    return false
                }
        }
        else if(player == 2) {
            if(dealerHand > 21) {
                return true
            }else{
                return false
            }
        }
        else{
            return false
        }
    }
    
    func checkWin() -> String {
        let playerBust = checkBust(player:playerHand)
        let dealerBust = checkBust(player:dealerHand)
        
        if(playerHand > dealerHand) {
            if(playerBust == false) {
                playerHand = 0
                dealerHand = 0
                return "Player Wins!"
            }else{
                playerHand = 0
                dealerHand = 0
                return "Dealer Wins..."
            }
        }
        else if(playerHand == dealerHand){
            return "Draw!"
        }
        if(dealerBust == true)
        {
            playerHand = 0
            dealerHand = 0
            return "Player Wins!"
        }else{
            playerHand = 0
            dealerHand = 0
            return "Dealer Wins..."
            
        }
    }
    
    func getHand(player:Int) -> Int {
        if(player == 1) {
            return playerHand
        }else if(player == 2) {
        return dealerHand
        }else{
            return -1
        }
    
    }
    func prepGame(){
        repeat{
            playerHand = 0
            dealerHand = 0
            drawCard(player: 1)
            drawCard(player: 1)
            drawCard(player: 2)
        }while(playerHand >= 21)

        lblDealer.text = "\(dealerHand)"
        lblPlayer.text = "\(playerHand)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepGame()

    }
    
}
