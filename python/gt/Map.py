#
# The interface for the game
#  Map give the ordering of the rooms in the game via 'rooms_list'
# and walks players through the rooms via 'next_room'
#
from Rooms import *
from random import randint
import pudb

rooms = {
        'lobby': Lobby(),
        'hallway': Hallway(),
        'sinking': Sinking(),
        'escape_tunnel': EscapeTunnel()
    }

rooms_list = [
        'lobby',
        'hallway',
        'sinking',
        'escapetunnel' ]
    
class Map(object):

    def __init__(self, start_room_name):
        self.start_room_name = start_room_name
        self.position = rooms_list.index(start_room_name)

    def get_room(self, room_name):
        self.position = rooms_list.index(room_name)
        return rooms[room_name]

    def next_room(self):
        if self.position >= len(rooms_list):
            print  "At the end"
        else:
            room_name = rooms_list[self.position + 1]
        return self.get_room(room_name)

    def get_position(self):
        return self.position

    def get_last_position(self):
        return len(rooms_list)-1
