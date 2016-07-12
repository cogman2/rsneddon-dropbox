class Parent(object):

    
    def implicit(self):

        print "PARENT implicit()"

    def override(self):

        print "PARENT override()"

    def altered(self):

        print "PARENT altered()"


class Child(object):


    def __init__(self):

        self.parent = Parent()

    def implicit(self):

        self.parent.implicit()

    def override(self):

        print "CHILD override()"

    def altered(self):

        print "CHILD, BEFORE PARENT altered()"
        #super(Child, self).altered()
        self.parent.altered()
        print "CHILD, AFTER PARENT altered()"



parent = Parent()
child = Child()
parent.implicit()
child.implicit()
parent.override()
child.override()
parent.altered()
child.altered()
