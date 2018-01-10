import Foundation

struct Card {
    var Color: String // holds the color values associated with the card (Red, Blue, or Green)
    var Roll: Int // holds a random value that represents the side of the die that will trigger that card
    
    
}

class Deck {
    var cards = [Card]()
    
    init() {
        for _ in 1...10 {
            let card = Card(Color: "Blue", Roll: Int(arc4random_uniform(2) + 1))  // Blue cards should have a roll value of either 1 or 2
            cards.append(card)
        }
        for _ in 1...10 {
            let card = Card(Color: "Red", Roll: Int(arc4random_uniform(2) + 3))   // Red cards should have a roll value of either 3 or 4
            cards.append(card)
        }
        for _ in 1...10 {
            let card = Card(Color: "Green", Roll: Int(arc4random_uniform(3) + 4)) // Green cards should have a roll value between 4 and 6
            cards.append(card)
        }
    }
    
    func removeTop() -> Card {
        let topCard = cards.count - 1
        let temp = cards[topCard]
        cards.remove(at: topCard)
        return temp
    }
    
    func isEmpty() -> Bool {
        if cards.count == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func shuffle() -> Any {
        for _ in 1 ... 30 {
            let randomNum1 = Int(arc4random_uniform(UInt32(cards.count - 1)))
            let randomNum2 = Int(arc4random_uniform(UInt32(cards.count - 1)))
            let temp = cards[randomNum1]
            cards[randomNum1] = cards[randomNum2]
            cards[randomNum2] = temp
        }
        
        return deck.cards
    }
}

var deck = Deck()

class Player {
    var name: String
    var hand: [Card] = []
    
    init(name: String) {
        self.name = name
    }
    
    func draw(deck: Deck) -> Card {
        let drawCard = deck.removeTop()
        self.hand.append(drawCard)
        return drawCard
    }
    
    func rollDice() -> Int {     // random number between 1 and 6
        let diceValue = Int(arc4random_uniform(5) + 1)
        return diceValue
    }
    
    func matchCards(roll: Int, color: String) -> Int {
        var matchCount = 0
        for i in hand {
            if (roll == i.Roll && color == i.Color) {
                matchCount = matchCount + 1
            }
        }
        return matchCount
    }
}

// test case

var player1: Player = Player(name: "John")
deck.shuffle()
print(player1.draw(deck: deck))
print(player1.matchCards(roll: 5, color: "Green"))


