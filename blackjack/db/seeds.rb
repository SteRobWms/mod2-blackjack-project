# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.destroy_all 
Game.destroy_all
Card.destroy_all
Dealer.destroy_all
PlayerHand.destroy_all
DealerHand.destroy_all
PlayerHandCard.destroy_all 
DealerHandCard.destroy_all 


suit = ["diamonds (♦)", "clubs (♣)", "hearts (♥)","spades (♠)"]
value = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]

#game table
g1 = Game.create(min_bet: 20, max_bet: 50)

g2 = Game.create(min_bet: 30, max_bet: 70)

g3 = Game.create(min_bet: 30, max_bet: 70)

#card table 
value.each do |v| 
  suit.each do |s| 
    Card.create(suit: s, value: v )
  end
end

#player table 
p1 = Player.create(name: "player 1", age: 20, bank: 20000)
p2 = Player.create(name: "player 2", age: 22, bank: 30000)
p3 = Player.create(name: "player 3", age: 21, bank: 40000)
p4 = Player.create(name: "player 4", age: 24, bank: 90000)

#dealer table

d1 = Dealer.create(name: "dealer 1", age: 30, years_experience: 10, casino: "Casino 1")


#player hand
p_h1 = PlayerHand.create(player_id: p1.id, game_id: g1.id)
p_h2 = PlayerHand.create(player_id: p2.id, game_id: g1.id)
p_h3 = PlayerHand.create(player_id: p3.id, game_id: g1.id)
p_h4 = PlayerHand.create(player_id: p4.id, game_id: g1.id)

p_h5 = PlayerHand.create(player_id: p1.id, game_id: g2.id)
p_h6 = PlayerHand.create(player_id: p2.id, game_id: g2.id)
p_h7 = PlayerHand.create(player_id: p3.id, game_id: g2.id)
p_h8 = PlayerHand.create(player_id: p4.id, game_id: g2.id)

p_h9 = PlayerHand.create(player_id: p1.id, game_id: g3.id)

#dealer hand
d_h1 = DealerHand.create(dealer_id: d1.id, game_id: g1.id)

d_h2 = DealerHand.create(dealer_id: d1.id, game_id: g2.id)

d_h3 = DealerHand.create(dealer_id: d1.id, game_id: g3.id)

#player1 hand card 
PlayerHandCard.create(player_hand_id: p_h1.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h1.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h5.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h5.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h9.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h9.id , card_id: Card.all.sample.id)

#player2 hand card 
PlayerHandCard.create(player_hand_id: p_h2.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h2.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h6.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h6.id , card_id: Card.all.sample.id)

#player3 hand card 
PlayerHandCard.create(player_hand_id: p_h3.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h3.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h7.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h7.id , card_id: Card.all.sample.id)

#player4 hand card 
PlayerHandCard.create(player_hand_id: p_h4.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h4.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h8.id , card_id: Card.all.sample.id)

PlayerHandCard.create(player_hand_id: p_h8.id , card_id: Card.all.sample.id)

#dealer1 hand card 
DealerHandCard.create(dealer_hand_id: d_h1.id , card_id: Card.all.sample.id)

DealerHandCard.create(dealer_hand_id: d_h1.id , card_id: Card.all.sample.id)

DealerHandCard.create(dealer_hand_id: d_h2.id , card_id: Card.all.sample.id)

DealerHandCard.create(dealer_hand_id: d_h2.id , card_id: Card.all.sample.id)

DealerHandCard.create(dealer_hand_id: d_h3.id , card_id: Card.all.sample.id)

DealerHandCard.create(dealer_hand_id: d_h3.id , card_id: Card.all.sample.id)