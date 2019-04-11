/*  Read following and append as needed.
 
    Game Controller->this handles all game logic
 
    when game first created the loadCards function shall be called to share out all the cards
    The showCards function is used to populate the onscreen imageViews
    jsonFile is read at game load to check if there is any saved game-> this is implemented in the function readJSONData within gameController
    Game data is in the form of a struct
*/
import UIKit
import Foundation

class GameViewController: UIViewController {

    @IBOutlet var playercardImageView: [UIImageView]!   //array of the player cards image view.
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var discardPileImageView: UIImageView!   //reference to the discard pile
    public var MachineSelectedCard: [String] = []
    public var MachineCard: [String] = []
    //array for the cards left in deck

    static var gameState: [String:AnyObject] = [:]
    
    var deck: [String] = []             //array of all cards
    var SelectedCards: [String] = []
    var playerCards: [String] = []      //players cards
    var cpuCards:[String] = []          //cpu cardss
    var discardPile: [String] = []      //array of played cards
    
    let cardSuits = ["green","yellow","blue","red"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        //card tap recognizer

        
        if(self.playerCards.count == 0){
            showCard()
        }else{
            
            for i in 0...playerCards.count-1{
                

                playercardImageView[i].image = UIImage(named: playerCards[i] )
                discardPileImageView.image = UIImage(named: discardPile[discardPile.count-1])
                machinePlayer()
            }
            
        }
        if(SelectedCards.count > 0){
            let alertC = UIAlertController(title: "Game State", message: "Your cards has been played.", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alertC.addAction(action)
            self.present(alertC, animated: true, completion: nil)
        }
        menuView.isHidden = true
        
        
        
        let jsonArray = GameViewController.readJSONFromFile(fileName: "Game")
        _ = Game(jsonArray as! [String : Any])

        
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
            cpuCards.append(deck.remove(at: Int(arc4random_uniform(UInt32(deck.count)-1))))

        }
        
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
            vc?.cpuCards = self.cpuCards
        }
    }
    
    public func machinePlayer(){
       // var number: Int = 0
        var number: [[Any]] = []
        number.append( [] )
         number.append( [] )
        number.append( [] )
        number.append( [] )
         number.append( [] )
         number.append( [] )
         number.append( [] )
        number.append( [] )
        
        //print(discardPile[discardPile.count-1])
       // print(discardPile.count)
        print(discardPile)
        print(cpuCards)
        number[2].append(Int.parse(from: discardPile[discardPile.count-1])!)
        number[3].append(String.parse(from: discardPile[discardPile.count-1])!)
        number[4].append(0)
        number[4].append(0)
         number[7].append(0)
       // print(number[0])
         //print(cpuCards)
        for i in 0...cpuCards.count-1 {
            
          // discardPile[discardPile.count-1] = UIImage(named: playerCards[i] )
            //let number = Int.parse(from: cpuCards[i])
          //  number = Int.parse(from: cpuCards[i])!
            number[0].append(Int.parse(from: cpuCards[i])!)
            number[1].append(String.parse(from: cpuCards[i])!)
                // Do something with this number
               // print(number)
            
          //  print(number)
        }
        //print(
        // number[5].append("no");
        for i in 0...cpuCards.count-1 {
            //number[0].contains(number[2][1])
            /*if(number[2].contains(where: { $0 == number[0][i] })){
                var
            }*/
            //var getany: Any = number[0][i]
            //getany = number[2][0]
          //  print(isEqual(type: Int.self, a: number[2][0], b: number[0][i]))
             //number[5].append("no");
            //number[4]
            if(isEqual(type: Int.self, a: number[2][0], b: number[0][i])) {
               // print("damn")
                number[4][0] =  1;
                //number[5][i] =  "yes";
                number[5].append("yes");
            }else{
               //  number[5][i] =  "yes";
                number[5].append("no");
            }
            /*number[0].append(Int.parse(from: cpuCards[i])!)
            number[1].append(String.parse(from: cpuCards[i])!)*/
            
        }
        for i in 0...cpuCards.count-1 {
            //number[0].contains(number[2][1])
            /*if(number[2].contains(where: { $0 == number[0][i] })){
             var
             }*/
            //var getany: Any = number[0][i]
            //getany = number[2][0]
       //     print(isEqual(type: Int.self, a: number[3][0], b: number[1][i]))
            //number[5][i] =  "no";
            if(isEqual(type: String.self, a: number[3][0], b: number[1][i])) {
              //  print("damn1")
                
                number[4][1] =  1;
                //number[6][i] =  "yes";
                 number[6].append("yes");
            }else{
                 number[6].append("no");
            }
            /*number[0].append(Int.parse(from: cpuCards[i])!)
             number[1].append(String.parse(from: cpuCards[i])!)*/
            
        }
        
        if(isEqual(type: Int.self, a:  number[4][1], b: 1) && isEqual(type: Int.self, a:  number[4][0], b: 1)){
            
            number[7][0] = randomInt(min: 1, max: 2)
      
        }else{
            if(isEqual(type: Int.self, a:  number[4][1], b: 1) && isEqual(type: Int.self, a:  number[4][0], b: 1) == false ){
                number[7][0] = 2;
            }else{
                if(isEqual(type: Int.self, a:  number[4][1], b: 1)==false && isEqual(type: Int.self, a:  number[4][0], b: 1) ){
                    number[7][0] = 1;
                 
                }else{
                    
                }
            }
        }
        
        if(isEqual(type: Int.self, a:  number[7][0], b: 1) ){
            
             for i in 0...cpuCards.count-1 {
                if(isEqual(type: String.self, a: number[5][i], b: "yes")){
                    MachineSelectedCard.append(cpuCards[i])
                }
            }
            
        }else{
        if(isEqual(type: Int.self, a:  number[4][1], b: 1) ){
            for i in 0...cpuCards.count-1 {
                //number[0].contains(number[2][1])
                /*if(number[2].contains(where: { $0 == number[0][i] })){
                 var
                 }*/
                //var getany: Any = number[0][i]
                //getany = number[2][0]
                //     print(isEqual(type: Int.self, a: number[3][0], b: number[1][i]))
               // number[5][i] =  "no";
                if(isEqual(type: String.self, a: number[6][i], b: "yes")) {
                   // print("damn1")
                  
                     MachineSelectedCard.append(cpuCards[i])
                    
                   // number[4][1] =  1;
                    //number[5][i] =  "yes";
                }

                
            }
    }
        }

        print(number[7][0])
        print(MachineSelectedCard)
        
        discardPile = discardPile+MachineSelectedCard
        discardPileImageView.image = UIImage(named: discardPile[discardPile.count-1])
    }
    
    func isEqual<T: Equatable>(type: T.Type, a: Any, b: Any) -> Bool {
        guard let a = a as? T, let b = b as? T else { return false }
        
        return a == b
    }
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
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
