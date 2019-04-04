/*  Read following and append as needed.
 
    Game Controller->this handles all game logic
 
    when game first created the loadCards function shall be called to share out all the cards
    The showCards function is used to populate the onscreen imageViews
    jsonFile is read at game load to check if there is any saved game-> this is implemented in the function readJSONData within gameController
    Game data is in the form of a struct
*/
import UIKit


class GameViewController: UIViewController {

    public var SelectedCards: [String] = []

    @IBOutlet var playercardImageView: [UIImageView]!   //array of the player cards image view.
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var discardPileImageView: UIImageView!   //reference to the discard pile
    
    
    //array for the cards left in deck
    var deck: [String] = []             //array of all cards
    
    //initializing dictionary for game state
    static var gameState: [String:AnyObject] = [:]
    
    var playerCards: [String] = []      //players cards
    var cpuCards:[String] = []          //cpu cards
    var discardPile: [String] = []      //array of played cards
    
    let cardSuits = ["green","yellow","blue","red"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        //card tap recognizer

        
        if(self.playerCards.count == 0){
            showCard()
        }else{
            
            //var count: Int
            //count = playerCards.count
            print(playerCards.count)
            //var x = 30
            for i in 0...playerCards.count-1{
                
                
                //  let imageName = playerCards[i]
                //let image = UIImage(named: imageName)
                // let imageView = UIImageView(image: image!)
                playercardImageView[i].image = UIImage(named: playerCards[i] )
                discardPileImageView.image = UIImage(named: discardPile[discardPile.count-1])
                print(discardPile)
                
                /*  if(i == 0){
                 imageView.frame = CGRect(x: x, y: 550, width: 40, height: 80)
                 
                 }else{
                 imageView.frame = CGRect(x: x, y: 550, width: 60, height: 80)
                 }
                 imageView.tag = i
                 
                 imageView.isUserInteractionEnabled = true
                 let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PlayerCardsViewController.connected(_:)))
                 imageView.addGestureRecognizer(tapGestureRecognizer)*/
                
                // view.addSubview(imageView)
                //print(imageView)
                //   count+=
                //   x+=60
            }
            
        }
        if(SelectedCards.count > 0){
            //  self.SelectedCards.append(valueSent.)
            // self.SelectedCards = SelectedCards + valueSent
            let alertC = UIAlertController(title: "Game State", message: "Your cards has been played.", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alertC.addAction(action)
            self.present(alertC, animated: true, completion: nil)
        }
        menuView.isHidden = true
        let jsonArray = GameViewController.readJSONFromFile(fileName: "Game")
        var model = Game(jsonArray as! [String : Any])
        print(model.userCards)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func userCardTap(sender:UITapGestureRecognizer? = nil){
        print("card clicked")
    }
    
    static func readJSONFromFile(fileName: String) -> Any?
    {
        //function reads game state from Game.json file at the start of game
        //data is stored as key value pairs
        var json: Any?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                // Handle error here
            }
        }
        return json
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
            playerCards.append(deck.remove(at: Int(arc4random_uniform(UInt32(deck.count)-1))))
           
        }
        
        //share to cpu
        
        
        //top card
        discardPile.append(deck.remove(at: Int.random(in: 1..<deck.count)))
        
    }
    
    
    
    func showCard(){
        //calls loadcards method
        //and shares all the cards
        loadCards()
       // print(playerCards)

        for i in 0...playercardImageView.count-1 {
               playercardImageView[i].image = UIImage(named: playerCards[i] )
        }
        discardPileImageView.image = UIImage(named: discardPile[0])
        
    }
    
    
    @IBAction func menuButton(_ sender: Any) {
        menuView.isHidden = !menuView.isHidden
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PlayerCardsViewController
        {
            let vc = segue.destination as? PlayerCardsViewController
            vc?.playerCards = self.playerCards
             vc?.discardPile = self.discardPile
        }
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
