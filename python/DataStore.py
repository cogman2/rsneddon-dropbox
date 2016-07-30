#
# The data store for the game
#
from random import randint
from Rooms import *
class DataStore(object):
    rooms = {'lobby':Lobby(), 'hallway':Hallway(), 'sinking':Sinking(), 'spiked_ceiling':Spiked_ceiling(), 'dungeon':Dungeon(), 'moving_walls':Moving_walls, 'escape_tunnel':Escape_tunnel()}
   

    def __init__(self, start_room):
        self.start_room = start_room

    def next_room(self, room_name):
        val = DataStore.rooms.get(room_name)
        return val

    def opening_room(self):
        return self.next_room(self.start_room)


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

