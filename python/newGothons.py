# Skeleton Code for the Game Engine
#
import pudb #ipdb #pudb
pudb.set_trace() #pudb.set_trace()
from sys import exit
from random import randint

class Scene(object):
    
    #def __init__(self, my_scene):
    #    self.my_scene = my_scene

    def enter(self):
        print "This scene is not yet configured"
#        exit(1)

    def close(self):
        print "The close of the scene is not yet configured"

class Engine(object):
    def __init__(self, a_map):
        # self.map = mapObj.map
#        self.a_map = a_map
#        self.map = a_map.map
        self.scenes = [Death(),CentralCorridor(),LaserWeaponArmory(),TheBridge(),EscapePod()]
        
    def play(self):

#        self.current_scene_num = a_map.scene_count

#        while self.current_scene_num < len(self.scenes):
        for scene_num in range(0,5):
            
            a_map.next_scene(scene_num)
            #self.current_scene_num = a_map.scene_count
            self.current_scene = self.scenes[scene_num]
            
            # be sure to print out the last scene
            self.current_scene.enter()
            #FINISH PLAY PROCESS
            self.current_scene.close()
            print "In Loop: ", scene_num
        return 0

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

class LaserWeaponArmory(Scene):

    def __init__(self, scene_name = "LaserWeaponArmory"):
        self.scene_name = scene_name

    def action(self):
        print "This is the Laser Weapon Armor scene."



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
        # self.start_scene = start_scene
        self.scene_count = 0
        self.map_name = map_name
        self.map_dic = {'Death':0, 'CentralCorridor':1, 'LaserWeaponArmory':2, 'TheBridge':3, 'EscapePod':4}
        self.map_dic_rev = {0:'Death', 1:'CentralCorridor', 2:'LaserWeaponArmory', 3:'TheBridge', 4:'EscapePod'}
#        self.map = self.map_dic[self.map_name]

    def next_scene(self, scene_count):
        self.map_name  = self.map_dic_rev[scene_count]
#        self.scene_count += 1
#        self.map = self.map_dic[self.map_name]


'''    def opening_scene(self):
        self.scene_count = 0
        self.map_name  = 'CentralCorridor'
        self.map = self.map_dic[self.map_name]
'''

a_map = Map('CentralCorridor')
a_game =  Engine(a_map)
a_game.play()
