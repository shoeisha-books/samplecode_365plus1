import std.algorithm;
import std.random;

enum CardType{ Heart, Club, Diamond, Pike, Max, Joker = Max }
const int MaxNum = 13;
struct Card{int num; CardType type;}

class Dealer{
    this(int jokerNum = 0){
        initDeck(jokerNum); deck_.randomShuffle();
    }
    
    private void initDeck(int jokerNum){
        foreach(i; 0 .. MaxNum){
            foreach(j; 0 .. cast(int)CardType.Max){
                Card c = {num: i + 1, type: cast(CardType)j};
                deck_ ~= c;
            }
        }
        foreach(_; 0..jokerNum){
            Card c = {num:0, type:CardType.Joker};
            deck_ ~= c;
        }
    }
    
    Card[] deal(int num){
        Card[] hand = deck_[0..num]; deck_ = deck_[num..$];
        return hand;
    }
   
    private Card[] deck_;
}
