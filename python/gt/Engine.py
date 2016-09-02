# This is the "make the game" exercise.
# Do it well!
#
from Rooms import *  # the data
from Map import * # the interface
import pudb

class Engine(object): # the controller
   
    def __init__(self, map):
        self.map = map


    def play(self):
        position = self.map.get_position()
        self.room = self.map.get_room(self.map.start_room_name)
        self.room.enter()
        while position < self.map.get_last_position():
           self.room = self.map.next_room()
           self.room.enter()
           position = self.map.get_position()


my_map = Map('lobby')        
game = Engine(my_map)
game.play()
