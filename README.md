# DeckOfCards-Swift
Basic structure of matching card game

Features:
- struct "Card" with properties for card color and die roll associated with card color
- struct "Deck": 
  - deals card on the top of the deck and returns its value
  - checks if deck is empty
  - randomly reorders the deck's cards
- struct "Player":
  - draws card from deck, adds it to their own hand, and returns its value (passing by reference)
  - rolls dice (returns random number between 1 and 6)
  - counts all the cards the player has which matches a given card and roll
