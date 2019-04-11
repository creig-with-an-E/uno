//
//  PlayerCardsViewController.swift
//  Uno Game
//
//  Created by Fortune Creig on 2019-03-27.
//  Copyright © 2019 laptop. All rights reserved.
//

import UIKit

class PlayerCardsViewController: UIViewController {

   /* vc.playerCards = "Hammock lomo literally microdosing street art pour-over"*/
    public var playerCards: [String] = []
    public var SelectedCards: [String] = []
    var noCards: [String] = []
    //players cards
    var discardPile: [String] = []
     var cpuCards:[String] = []
    
    @IBAction func PLAYCARDS(_ sender: Any) {
        
        
        let getPlayerController = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        
        //checking if move valid
        var cards = SelectedCards
        cards.append(discardPile[discardPile.count-1])
        if(GameMediator.compare(cards)){
            //if move permitted this block is executed
            print("executing")
            if(SelectedCards.count>0){
                for i in 0...SelectedCards.count-1{
                    playerCards = playerCards.filter{ $0 != SelectedCards[i] }
                }
            }
            getPlayerController.SelectedCards = self.SelectedCards
            getPlayerController.playerCards = self.playerCards
            getPlayerController.cpuCards =  self.cpuCards + self.cpuCards
            getPlayerController.discardPile =  self.discardPile + self.SelectedCards
            // print( getPlayerController.playerCards)
            navigationController?.pushViewController(getPlayerController, animated: true)
            
        }else{

            navigationController?.popViewController(animated: true)
//            self.navigationController?.pushViewController(getPlayerController, animated: true)

            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //  print(GameViewController.playerCards)
    //   Do any additional setup after loading the view.

        var count: Int
        count = 50
        
        for i in 0...playerCards.count-1{
            
        let imageName = playerCards[i]
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
            
            
        imageView.frame = CGRect(x: 150, y: count, width: 100, height: 100)
            
             imageView.tag = i
            
            imageView.isUserInteractionEnabled = true
                    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PlayerCardsViewController.connected(_:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
            
        view.addSubview(imageView)
            
            count+=140
        }
        
        
    }


    @objc func connected(_ sender:AnyObject){
        //print("you tap image number : \(sender.view.tag)")
        if(sender.view.frame.minX != 200){
            sender.view.frame = CGRect(x: 200, y: sender.view.frame.minY, width: sender.view.frame.width, height: sender.view.frame.height)
            
            if(1 > SelectedCards.count){
                SelectedCards.append(playerCards[sender.view.tag]);
            }else{
                if SelectedCards.contains(playerCards[sender.view.tag]) {
                    //  print("yes not add")
                }else{
                    SelectedCards.append(playerCards[sender.view.tag]);
                }
            }

            
        }else{
            if SelectedCards.contains(playerCards[sender.view.tag]) {
                SelectedCards = SelectedCards.filter{ $0 != playerCards[sender.view.tag] }
            }
            sender.view.frame = CGRect(x: 150, y: sender.view.frame.minY, width: sender.view.frame.width, height: sender.view.frame.height)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
