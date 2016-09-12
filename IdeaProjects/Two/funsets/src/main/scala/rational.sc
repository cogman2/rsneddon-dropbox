
object session {

  println("Hello World")


  object rationals {
    val x = new Rational(1,2)
    val y = new Rational(5, 7)
    val z = new Rational(3, 2)
    x.numer
    x.denom
    //    x.sub(y).sub(z)

  }

  class Rational(x: Int, y: Int) {
    private def gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)
    private val g = gcd(x, y)
    def numer = x / g
    def denom = y / g

    def < (that: Rational) = numer * that.denom < that.numer * denom
    def max(that: Rational) = this.numer * that.denom < that.numer * this.denom

    def + (that: Rational) =
      new Rational(
        numer * that.denom + that.numer * denom,
        denom * that.denom)
  }

  val x = new Rational(1,2)
  val y = new Rational(2,3)
  x + y




}

