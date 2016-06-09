import pdb
pdb.set_trace()
## Animal is-a object (yes, sort of confusing) look at the extra credit
animal_list = ['cat','dog', 'horse', 'hedgehog']
animal_dic = {'Fechner':'cat', 'Tal':'dog', 'Rosie':'horse'}




class Animal(object):
    def __init__(self, name):
        self.name = name
        self.animal_list = animal_list
        self.animal_dic = animal_dic

    def add_animal(self, animal_kind):
        self.animal_list.append(animal_kind)

    def what_animal(self, pet_name):
        print self.animal_dic[pet_name]

## class Dog is-a Animal
class Dog(Animal):
    
    def __init__(self, name, breed):
        super(Dog, self).__init__(name)
        self.breed = breed

    def set_age(self,age):
        self.age = age
        
    def have_birthday(self):
        self.age += 1

## class Cat is-a Animal
class Cat(Animal):
    
    def __init__(self, name):
        ## Cat has-a attribute named name
        self.name = name

## Person is-a object
class Person(object):

    def __init__(self, name):
        ## class Person has-a attribute named name
        self.name = name
        ## Person has-a pet of some kind
        self.pet = None

    def add_age(self, age):
        self.age = age
    
    def add_last_name(self, last_name):
        self.last_name = last_name

    def add_pet(self, pet):
        self.pet = pet


## class Employee is-a Person
class Employee(Person):
    
    def __init__(self, name, salary):
        ## class Employee has-a __init__ that is-a method of class Person
        super(Employee, self).__init__(name)
        ## class employee has-a attribute named salary
        self.salary = salary

    def get_raise(self, percent):
        self.salary = 0.01 * (100 + percent) * self.salary
        print "Your new salary is: ", self.salary

## class Fish is-a object
class Fish(object):
    def __init__(self, age, location):
        self.age = age
        self.location = location

## class Salmon is-a Fish
class Salmon(Fish):
    def __init__(self, age, location, type):
        super(Salmon, self).__init__(age, location)
        self.type = type

    def spawn(self):
        self.swim_upstream = True
        self.age += 1
        self.type = "Fresh water"

## class Halibut is-a Fish
class Halibut(Fish):
    def __init__(self, age, location, type):
        ## class Employee has-a __init__ that is-a method of class Person
        super(Halibut, self).__init__(age, location)
        ## class employee has-a attribute named salary
        self.type = type
    

## rover is-a Dog
rover = Dog("Rover", "Golden Retriever")

## Satan is-a Cat
satan = Cat("Satan")

## Mary is a Person
mary = Person("Mary")

## mary has-a  attribute pet and set it to object satan
mary.pet = satan

## frank is-a EMployee
frank = Employee('Frank', 120000)

## frank has-a attribute pet that is-a Dog object named rover
frank.pet = rover

## flipper is-a Fish
flipper = Fish(5,"San Diego")

## crouse is-a Salmon
crouse = Salmon(1,"Seattle","Fresh Water")

## harry is-a Halibut
harry = Halibut(2,"Scotland", "Salt Water")

