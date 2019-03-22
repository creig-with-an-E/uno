//
//  GameViewController.swift
//  Uno Game
//
//  Created by laptop on 2019-03-21.
//  Copyright © 2019 laptop. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var playercardImageView: [UIImageView]!   //array of the player cards image view.
    
    
    @IBOutlet weak var discardPileImageView: UIImageView!   //reference to the discard pile
    
    var deck: [String] = []             //array of all cards
    var playerCards: [String] = []      //players cards
    var cpuCards:[String] = []          //cpu cards
    var discardPile: [String] = []      //array of played cards
    
    let cardSuits = ["green","yellow","blue","red"]
    
    override func viewWillAppear(_ animated: Bool) {
        showCard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCards(){
        for suits in cardSuits{
            for i in 1...9{
                //integer values appended to each card suit
                deck.append("\(suits)\(i)")
            }
        }
        
        //share to player 1
        for _ in 1...playercardImageView.count{
            playerCards.append(deck.remove(at: Int.random(in: 1...deck.count-1)))
        }
        
        //share to cpu
        
        
        //top card
        discardPile.append(deck.remove(at: Int.random(in: 1..<deck.count)))
        
    }
    
    
    
    func showCard(){
        loadCards()
        print(playerCards)
        for i in 0...playercardImageView.count-1 {
               playercardImageView[i].image = UIImage(named: playerCards[i] )
        }
        discardPileImageView.image = UIImage(named: discardPile[0])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
