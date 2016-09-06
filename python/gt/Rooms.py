#
# This is the Class Rooms which is the interface.
# The various rooms are called by the Engine class.
# Here, they are initialized for relevant data and
# then interact with the player.
# The essential method is 'enter' where the player interacts with the game.
#

import pudb
from random import randint

class Rooms(object):


    def play(self):
        pass


class Lobby(Rooms):

    def __init__(self):
        self.name  = raw_input("What is your name Weakling? ")

    def enter(self):
        print "You are in the Lobby"
        print "This is rather boring and you'd much rather be scared."
        print "Weaking, whom you call",self.name, "do you want to go to the Hallway of Terror?"
        response = raw_input("Answer 'yes' if you want to go to the Hallway. ")
        if response != 'yes':
            print "COWARD!"
            quit()
        else:
            print "Maybe you are not such a Weakling",self.name

class Hallway(Rooms):

    def __init__(self):
        self.doors = {1:"LION!", 3:"MAGIC SWORD", 2:"LION!"}
        self.new_doors = {1:2, 3:randint(1,2), 2:1}

    def enter(self):
        print "You are in the Hallway"
        print "You are in the Hallway of terror."
        print "You see three doors."
        print "Behind two of the doors is a hungry lion. The other door has a magic sword."
        door = 0
        while door != '1' and door != '2' and door != '3':
            door = raw_input("Choose number 1, 2 or 3: ")
        change_door = raw_input("Do you want to change doors? ")
        if change_door != 'yes': 
            if door == '1' or door == '2':
                print "LION!!!"
                print "You're dead, loooser!"
                quit()
            else:
                print "You found the sword!"
        else:
            print "You live!"
            

class Sinking(Rooms):

    def __init__(self):
        self.monsters = {1:"Alligators", 2:"Pirahnas", 3:"Sharks"}
        self.my_monster = self.monsters[randint(1,3)]
        self.mommy = {1:"Mommy wisks you to the next room, safe from the ", 2:"Mommy ignores you and you are eaten by the "}
        self.prayer = {1:"The gods aren't listening today and you are eaten by ", 2:"Zeus is in a good mood and pulls you into the next room safe from the "}
        self.exit = {1:"You don't find the exit and are eaten by ", 2:"You find the exit and swim to the next room, save from the "}
    def enter(self):
        print "You are in the Sinking room"
        print "Sinking slowly into a pool of dangerous ",self.my_monster
        print "You have three choices"
        print "1 Scream for you Mommy"
        print "2 Tread water and pray"
        print "3 Hold your breath and look for an underwater exit"
        answer = raw_input("Choose 1, 2 or 3")
        choice = randint(1,2)
        if answer == '1':
            print self.mommy[choice],self.my_monster
            if choice == 2:
                print "Goodbye, Mommy never liked you"
                quit()
            else:
                print "great job!"

        elif answer == '2':
            print self.prayer[choice],self.my_monster
            if choice == 1:
                print "Goodbye, have fun in Hades"
                quit()
            else:
                print "great job!"

        elif answer == '3':
            print self.exit[choice],self.my_monster
            if choice == 1:
                print "Goodbye, Chum-san"
                quit()
            else:
                print "great job!"
        else:
            print "Damn you're slow, you are eaten by the ",self.my_monster
            print "Goodbye!"
            quit()


class SpikedCeiling(Rooms):

    def __init__(self):
        pass

    def enter(self):
        print "You are in the Spiked Ceiling room"


class Dungeon(Rooms):

    def __init__(self):
        pass

    def enter(self):
        print "You are in the Dungeon"


class MovingWalls(Rooms):

    def __init__(self):
        pass

    def enter(self):
        print "You are in the Moving Walls room"


class EscapeTtunnel(Rooms):

    def __init__(self):
        pass

    def enter(self):
        print "You are in the Escape Tunnel"
        print "You run for the sunlight, survivig the horrors behind you."
        print "You did it!"
