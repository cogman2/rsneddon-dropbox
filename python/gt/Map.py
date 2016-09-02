#
# The interface for the game
from Rooms import *
from random import randint
import pudb

rooms = {
        'lobby': Lobby(),
        'hallway': Hallway(),
        'sinking': Sinking(),
        'spiked_ceiling': Spiked_ceiling(),
        'dungeon': Dungeon(),
        'moving_walls': Moving_walls(),
        'escape_tunnel': Escape_tunnel()
    }

rooms_list = [
        'lobby',
        'hallway',
        'sinking',
        'spiked_ceiling',
        'dungeon',
        'moving_walls',
        'escape_tunnel' ]
    
class Map(object):

    def __init__(self, start_room_name):
        self.start_room_name = start_room_name
        self.position = rooms_list.index(start_room_name)

    def get_room(self, room_name):
        self.position = rooms_list.index(room_name)
#        print "In get_room, the room is: ", room_name, rooms[room_name]
        return rooms[room_name]

    def next_room(self):
        if self.position >= len(rooms_list):
            print  "At the end"
        else:
#            print "In Map object, position is: ", self.position
            room_name = rooms_list[self.position + 1]
        return self.get_room(room_name)

    def get_position(self):
        return self.position

    def get_last_position(self):
        return len(rooms_list)-1
