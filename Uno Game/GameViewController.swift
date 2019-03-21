//
//  GameViewController.swift
//  Uno Game
//
//  Created by laptop on 2019-03-21.
//  Copyright © 2019 laptop. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    
    var deck = Set<String>()
    
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
        for i in 1...9{
          deck.insert("blue\(i)")
          deck.insert("green\(i)")
            
        }
        
    }
    
    func showCard(){
        loadCards()
        imageView.image = UIImage(named:deck.removeFirst())
        imageView2.image = UIImage(named:deck.removeFirst())
        image3.image = UIImage(named:deck.removeFirst())
        imageView4.image = UIImage(named:deck.removeFirst())
        imageView5.image = UIImage(named:deck.removeFirst())
        imageView6.image = UIImage(named:deck.removeFirst())
        imageView7.image = UIImage(named:deck.removeFirst())

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
