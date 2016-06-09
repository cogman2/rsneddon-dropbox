# Skeleton Code for the Game Engine
#
import pdb
pdb.set_trace()
from sys import exit
from random import randint

class Scene(object):
    
    def __init__(self, my_scene):
        self.my_scene = my_scene

    def enter(self):
        pass

class Engine(object):
    def __init__(self, mapObj):
        self.map = mapObj.map
        self.map_name = mapObj.map_name
        self.action = {'Death':'Big monster', 'CentralCorridor':'Many Doors', 'LaserWeaponArmory':'Lots of Weapons', 'TheBridge':'Spock is waiting', 'EscapePod':'You made it!'}

    def play(self):
        print self.action[map]
        if map_name == 'Death':
            self.my_scene = Death()
        elif map_name == 'CentralCorridor':
            self.my_scene = CentralCorridor()
        elif map_name == 'LaserWeaponArmory':
            self.my_scene = LaserWeaponArmory()
        elif map_name == 'TheBridge':
            self.my_scene = TheBridge()
        else:
            self.my_scene = EscapePod()
        self.my_scene.action()
    

class Death(Scene):

    def __init__(self, scene_name = "Death"):
        self.scene_name = scene_name

    def action(self):
        print "This is the Death Scene."

class CentralCorridor(Scene):

    def __init__(self, scene_name = "CentralCorridor"):
        self.scene_name = scene_name

    def action(self):
        print "This is the Central Corridor scene."

class TheBridge(Scene):

    def __init__(self, scene_name = "TheBridge"):
        self.scene_name = scene_name

    def action(self):
        print "This is TheBridge scene."

class EscapePod(Scene):

    def __init__(self, scene_name = "EscapePod"):
        self.scene_name = scene_name

    def action(self):
        print "This is the EscapePod scene."

class Map(object):

    def __init__(self, map_name):
        self.start_scene = start_scene
        self.map_name = map_name
        self.map_dic = {'Death':0, 'CentralCorridor':1, 'LaserWeaponArmory':2, 'TheBridge':3, 'EscapePod':4}
        self.map = self.map_dic[self.map_name]

    def next_scene(self, scene_name):
        self.map_name = scene_name
        self.map = self.map_dic[self.map_name]

    def opening_scene(self):
        self.map_name  = 'CentralCorridor'
        self.map = self.map_dic[self.map_name]

a_map = Map('cenral_corridor')
a_game =  Engine(a_map)
a_game.play()
