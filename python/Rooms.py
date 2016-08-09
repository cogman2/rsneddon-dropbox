#
# This is the Class Rooms which gives the rooms data for the game.
#

class Rooms(object):

    def __init__(self):
        self.rooms_map = {'lobby':Lobby(), 'hallway':Hallway(), 'sinking':Sinking(), 'spiked_ceiling':Spiked_ceiling(), 'dungeon':Dungeon(), 'moving_walls':Moving_walls, 'escape_tunnel':Escape_tunnel()}

#    @abstractmethod
    def play(self):
        pass


class Lobby(Rooms):

    def __init__(self):
        pass

    def play(self):
        pass

class Hallway(Rooms):

    def __init__(self):
        pass

    def play(self):
        pass


class Sinking(Rooms):

    def __init__(self):
        pass

    def play(self):
        pass


class Spiked_ceiling(Rooms):

    def __init__(self):
        pass

    def play(self):
        pass


class Dungeon(Rooms):

    def __init__(self):
        pass

    def play(self):
        pass


class Moving_walls(Rooms):

    def __init__(self):
        pass

    def play(self):
        pass


class Escape_tunnel(Rooms):

    def __init__(self):
        pass

    def play(self):
        pass
