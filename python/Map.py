#
# The interface for the game
from Rooms import *
from random import randint
class Map(object):
    scenes = {
        'lobby': Lobby(),
        'hallway': Hallway(),
        'sinking': Sinking(),
        'spiked_ceiling': Spiked_ceiling(),
        'dungeon': Dungeon(),
        'moving_walls': Moving_walls(),
        'escape_tunnel': Escape_tunnel()
    }

    def __init__(self, start_scene):
        self.start_scene = start_scene

    def next_scene(self, scene_name):
        val = Map.scenes.get(scene_name)
        return val

    def opening_scene(self):
        return self.next_scene(self.start_scene)
