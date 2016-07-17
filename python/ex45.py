# This is the "make the game" exercise.
# Do it well!
#
import Rooms  # the data
import Runner # the interface

class Engine(object): # the controller
   
    def __init__(self, rooms_map):
        self.rooms_map = rooms_map
        self.runner = Runner()

    def play(self):
        current_room = self.rooms_map.opening_scene()
        last_room = self.rooms_map.next_room('finished')
    
    current_room.enter()

rooms_map = Rooms()
game = Engine(rooms_map)
