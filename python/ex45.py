# This is the "make the game" exercise.
# Do it well!
#
import rooms  # the data
import runner # the interface

class Engine(object): # the controller
   
    def __init__(self, rooms_map):
        self.rooms_map = rooms_map

    def play(self):
        current_room = self.rooms_map.opening_scene()
        last_room = self.rooms_map.next_room('finished')
    
    current_room.enter()
