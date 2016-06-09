# a first class
import random

class Song(object):

    def __init__(self, lyrics):
        self.lyrics = lyrics

    def sing_me_a_song(self):
        for line in self.lyrics:
            print line

    def sing_me_a_song_backwards(self):
#        for i in range(len(self.lyrics)-1,-1,-1):
#            print i
        for i in range(len(self.lyrics)-1,-1,-1):
            print self.lyrics[i]

    def sing_me_a_song_randomly(self):
        for i in range(0,len(self.lyrics)):
            flip = random.randint(0,len(self.lyrics)-1)
            print self.lyrics[flip]

happy_bday = Song(["Happy birthday to you", \
                   "I don't want to get sued", \
                   "So I'll stop right there"])

bulls_on_parade = Song(["They rally around tha family", \
                        "With pockets full of shells"])

tv_party_tonight_lyrics = ["TV party tonight, TV party tonight", \
                         "We're going to have a TV party tonight"]

raw_power_lyrics = ["Dance to the beat of the livin dead", \
                  "lose sleep baby, and stay away from bed" ]


tv_party_tonight = Song(tv_party_tonight_lyrics)

raw_power = Song(raw_power_lyrics)

tv_party_tonight.sing_me_a_song_randomly()

raw_power.sing_me_a_song_randomly()


