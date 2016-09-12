package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }


  def pascal(c: Int, r: Int): Int = {

    def pasIter(i: Int, j: Int): Int =
      if (i == 0 || i == j) 1
      else pasIter(i - 1, j - 1) + pasIter(i, j - 1)

    pasIter(c, r)

  }

  def balance(chars: List[Char]): Boolean = {

    def balIter(lparen: Int, rparen: Int, charIter: List[Char]): Boolean =

      if (rparen > lparen) false
      else if(charIter.isEmpty) {
        if (lparen == rparen) true
        else false }
      else if (charIter.head == '(') { balIter(lparen+1,rparen, charIter.tail) }
      else if (charIter.head == ')') { balIter(lparen,rparen+1, charIter.tail) }
      else { balIter(lparen, rparen, charIter.tail) }

    balIter(0, 0, chars)

  }

  def countChange(money: Int, coins: List[Int]): Int = {

    def countIter(moneyLeft: Int, coinsLeft: List[Int]): Int =
      if (moneyLeft == 0 ) 1
      else if (coinsLeft.isEmpty) 0
      else if (moneyLeft >= coinsLeft.head) countIter(moneyLeft - coinsLeft.head, coinsLeft) + countIter(moneyLeft, coinsLeft.tail)
      else countIter(moneyLeft, coinsLeft.tail)


    countIter(money, coins)

  }

  }
