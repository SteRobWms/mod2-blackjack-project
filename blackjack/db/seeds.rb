# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.destroy_all 
Game.destroy_all
Deck.destroy_all
Card.destroy_all
Dealer.destroy_all
PlayerHand.destroy_all
DealerHand.destroy_all
PlayerHandCard.destroy_all 
DealerhandCard.destroy_all 


suit = ["diamonds (♦)", "clubs (♣)", "hearts (♥)","spades (♠)"]
value = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
#deck tabel
d1 = Deck.create(game_id: g1.id)
#card table 
value.each do |v| 
  suit.each do |s| 
    Card.create(suit: s, value: v , deck_id: d.id)
  end
end

#player table 
p1 = Player.create(name: "player 1", age: 20, bank: 20000)
p2 = Player.create(name: "player 2", age: 22, bank: 30000)
p3 = Player.create(name: "player 3", age: 21, bank: 40000)
p4 = Player.create(name: "player 4", age: 24, bank: 90000)

#dealer table

d1 = Dealer.create(name: "dealer 1", age: 30, years_experience: 10, casino: "Casino 1")

#game table
g1 = Game.create(min_bet: 20, max_bet: 50, deck_id: d1.id)

#player hand
p_h1 = PlayerHand.create(player_id: p1.id, game_id: g1.id)
p_h2 = PlayerHand.create(player_id: p2.id, game_id: g1.id)
p_h3 = PlayerHand.create(player_id: p3.id, game_id: g1.id)
p_h4 = PlayerHand.create(player_id: p4.id, game_id: g1.id)

#dealer hand
d_h1 = DealerHand.create(dealer_id: d1.id, game_id: g1.id)

#player1 hand card 
p_h_c1 = PlayerHandCard.create(player_hand_id: p_h1.id , card_id: Card.all[0].id)

p_h_c2 = PlayerHandCard.create(player_hand_id: p_h1.id , card_id: Card.all[1].id)

#player2 hand card 
p_h_c4 = PlayerHandCard.create(player_hand_id: p_h2.id , card_id: Card.all[2].id)

p_h_c5 = PlayerHandCard.create(player_hand_id: p_h2.id , card_id: Card.all[3].id)

#player3 hand card 
p_h_c6 = PlayerHandCard.create(player_hand_id: p_h3.id , card_id: Card.all[4].id)

p_h_c7 = PlayerHandCard.create(player_hand_id: p_h3.id , card_id: Card.all[5].id)

#player4 hand card 
p_h_c8 = PlayerHandCard.create(player_hand_id: p_h4.id , card_id: Card.all[6].id)

p_h_c9 = PlayerHandCard.create(player_hand_id: p_h4.id , card_id: Card.all[7].id)

#dealer1 hand card 
d_h_c1 = DealerHandCard.create(dealer_hand_id: d_h1.id , card_id: Card.all[8].id)

d_h_c2 = DealerHandCard.create(dealer_hand_id: d_h1.id , card_id: Card.all[9].id)