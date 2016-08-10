# This is the "make the game" exercise.
# Do it well!
#
from Rooms import *  # the data
from Map import * # the interface

class Engine(object): # the controller
   
    def __init__(self, start_map):
        self.start_map  = start_map
        self.rooms_map = Map('lobby')

    def play(self):
        current_room = self.rooms_map.opening_scene()
        last_room = self.rooms_map.next_room('finished')
    
    current_room.enter()

rooms_map = Map()
game = Engine(rooms_map)
