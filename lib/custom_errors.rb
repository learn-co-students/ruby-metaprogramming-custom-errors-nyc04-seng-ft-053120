class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person
    # PartnerError should be raised when argument passed in #get_married method is not an instance of the Person class
    if person.class != Person
      begin
        raise PartnerError
      rescue PartnerError => error
        # create an instance of PartnerError calling it error, then outputs the error.message; now the program will run with the message put out, and it won't break
        puts error.message 
      end
    else
      person.partner = self
    end
  end

  # defining a custom error class, PartnerError that inherits from StandardError; this code can be placed in side the Person class, like here, or outside, or in a module (and then we put the module inside this class 
  class PartnerError < StandardError
    # add a message to output when error is raised
    def message
        "you must give the get_married method an argument of an instance of the person class!"
    end
  end
end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z") #"Jay-Z" is a string, not an instance of the Person class

puts beyonce.name #Since the line above broke the program, this line won't run, unless we rescue our program when such an error is raised




