import math.abs

object session {

  val tolerance = 0.0001
  def isCloseEnough(x: Double, y: Double) =
    abs((x - y)/ x) /x < tolerance
  def fixedPoint(f: Double => Double)(firstGuess: Double) = {
    def iterate(guess: Double): Double = {
      val next = f(guess)
      if (isCloseEnough(guess, next)) next
      else iterate(next)
    }
    iterate(firstGuess)
  }

  fixedPoint(x => 1 + x/2)(1)







  def mapreduce(f: Int => Int, combine: (Int, Int) => Int, zero: Int )(a: Int, b: Int): Int = {
    if (a > b) zero
    else combine(f(a), mapreduce(f, combine, zero)(a+1, b))

    def product2(f: Int => Int)(a: Int, b: Int): Int = mapreduce(f,  (x, y) => x*y, 1)(a, b)

    // product2( x => x * x)(3,4)


    def product(f: Int => Int)(a: Int, b: Int): Int = {
      if (a > b) 1
      else f(a) * product(f)(a+1, b)

    }

    product(x => x*x)(3,4)

    def factorial(f: Int => Int)(a: Int): Int = {
      product(x => x)(1,a)

    }

    // factorial(3)


  }







  def countChange(money: Int, coins: List[Int]): Int = {

    def countIter(moneyLeft: Int, coinsLeft: List[Int]): Int =
      if (moneyLeft == 0 ) 1
      else if (coinsLeft.isEmpty) 0
      else if (moneyLeft >= coinsLeft.head) countIter(moneyLeft - coinsLeft.head, coinsLeft) + countIter(moneyLeft, coinsLeft.tail)
      else countIter(moneyLeft, coinsLeft.tail)


    countIter(money, coins)

  }

  val money: Int = 4
  val coins: List[Int] = List(1,2)
  //  countChange(money, coins)


  def sqrt(x: Double) = {

    def sqrtIter(guess: Double): Double =
      if (isGoodEnough(guess)) guess
      else sqrtIter(improve(guess))

    def isGoodEnough(guess: Double) =
      (guess * guess - x) < 0.001*x

    def improve(guess: Double) =
      (guess + x / guess) / 2

    sqrtIter(1.0)
  }


  def factorial(n: Int): Int = {
    def loop(acc: Int, n: Int): Int =
      if (n==0) acc
      else loop(acc * n, n - 1)
    loop(1, n)
  }

