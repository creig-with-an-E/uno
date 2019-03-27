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

    override func viewDidLoad() {
        super.viewDidLoad()
     //ß   print(GameViewController.playerCards)
        // Do any additional setup after loading the vießßßßw.
        
        var count: Int
        count = 50
        
        for i in 0...playerCards.count-1{
            
        let imageName = playerCards[i]
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 150, y: count, width: 100, height: 100)
        view.addSubview(imageView)
            count+=140
        }
        
      print(playerCards)
        
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
