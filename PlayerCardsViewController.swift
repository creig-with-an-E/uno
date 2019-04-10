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
    //players cards
    var discardPile: [String] = []
     var cpuCards:[String] = []
    
    @IBAction func PLAYCARDS(_ sender: Any) {
        
        
        // print("What have I done")
        //  if(delegate != nil){
        //  print(SelectedCards)
        //   }
        //GameViewController.
        //delegate?.getSelectedCards(val/ueSent: self.SelectedCards)
        let getPlayerController = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        if(SelectedCards.count>0){
            for i in 0...SelectedCards.count-1{
                // if playerCards.contains(sender.view.tag) {
                //  print("yes remove")
                //     playerCards.remove(at: SelectedCards[i])
                // }
                playerCards = playerCards.filter{ $0 != SelectedCards[i] }
                //   playerCards[playerCards]
            }
        }
        getPlayerController.SelectedCards = self.SelectedCards
        getPlayerController.playerCards = self.playerCards
        getPlayerController.discardPile =  self.discardPile + self.SelectedCards
         getPlayerController.cpuCards =  self.cpuCards + self.cpuCards
        // print( getPlayerController.playerCards)
        self.navigationController?.pushViewController(getPlayerController, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //ß   print(GameViewController.playerCards)
        // Do any additional setup after loading the view.
        

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
        
      print(playerCards)
        
    }
    /*
    @objc func connected(_ sender:AnyObject){
        print("you tap image number : \(sender.view.tag)")
        if(sender.view.frame.minX != 200){
        sender.view.frame = CGRect(x: 200, y: sender.view.frame.minY, width: sender.view.frame.width, height: sender.view.frame.height)
        }else{
            sender.view.frame = CGRect(x: 150, y: sender.view.frame.minY, width: sender.view.frame.width, height: sender.view.frame.height)
        }
    }*/

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
            // print(sender.view.tag)
            //print(SelectedCards[0])
            
        }else{
            if SelectedCards.contains(playerCards[sender.view.tag]) {
                // print("yes remove")
                SelectedCards = SelectedCards.filter{ $0 != playerCards[sender.view.tag] }
            }
            sender.view.frame = CGRect(x: 150, y: sender.view.frame.minY, width: sender.view.frame.width, height: sender.view.frame.height)
        }
    }
    /*@objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        print("Image Tapped123")
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Here you can initiate your new ViewController
            
        }
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
