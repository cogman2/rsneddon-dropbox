#
# The interface for the game
#
from random import randint
class Runner(object):
    
    def __init__(self)__:
        self.my_points = 100
        

    def roll(self, size):
        self.result = randint(1,size)
        return self.result


    def update_points(self, damage):
        self.my_points -= damage
        if self.my_points <= 0:
            print "you're dead"
            exit(1)
        else:
            print "ouch!"
        

    def combat(self):
        swing = self.roll(20)
        if swing > 14:
            print "you win"
        else:
            self.update_points(10)
            print "too lazy to practice huh?"
            

    def dodge(self):
        move = self.roll(8)
        if move > 6:
            print "you dodged it!"
        else:
            self.update_points(5)
            print "Clumsy, aren't you!"


    def shoot(self):
        aim = self.roll(12)
        if aim > 7:
            print "good shot!"
        else:
            self.update_points(20)
            print "You took a bullet, that's got to hurt."

