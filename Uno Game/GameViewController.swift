/*  Read following and append as needed.
 
    Game Controller
 
    this handles all game logic
 
    when game first created the loadCards function shall be called to share out all the cards
    The showCards function is used to populate the onscreen imageViews
*/
import UIKit


class GameViewController: UIViewController {

    public var SelectedCards: [String] = []

    @IBOutlet var playercardImageView: [UIImageView]!   //array of the player cards image view.
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var discardPileImageView: UIImageView!   //reference to the discard pile
    @IBOutlet weak var cardCount: UILabel!
    @IBOutlet weak var drawCard: UIButton!
    @IBOutlet weak var pickCard: UIButton!
    
    //array for the cards left in deck
    var deck: [String] = []             //array of all cards
    
    //initializing dictionary for game state
    static var gameState: [String:AnyObject] = [:]
    
    var playerCards: [String] = []      //players cards
    var cpuCards:[String] = []          //cpu cards
    var discardPile: [String] = []      //array of played cards
    
    let cardSuits = ["green","yellow","blue","red"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        menuView.isHidden = true
        cardCount.text = String(deck.count) //show how many cards left in draw deck
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCard()
        let jsonData = GameViewController.readJSONFromFile(fileName: "Game")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //read JSON data
    
    static func readJSONFromFile(fileName: String) -> Any?
    {
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
            for i in 0...12{
                //integer values appended to each card suit
                deck.append("\(suits)\(i)")
            }
            for k in 1...12{
                //duplicates
                deck.append("\(suits)\(k)")
            }
            deck.append("wildC")
            deck.append("wildPlus")
        }
        
        //share to player 1
        for _ in 1...playercardImageView.count{
            playerCards.append(deck.remove(at: Int(arc4random_uniform(UInt32(deck.count)-1))))
           
        }
        
        //share to cpu
        
        
        //top card
        discardPile.append(deck.remove(at: Int(arc4random_uniform(UInt32(deck.count)-1))))
        
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
    
    func cardTap(gesture: UIGestureRecognizer) {
        //show pick card button when user clicks on a player card
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
