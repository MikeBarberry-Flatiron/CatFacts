require_relative 'breed'

class UI 
    attr_accessor :response, :breed, :validate, :instance, :moreinfo

    def initialize
        self.intro
        self.chooseBreed
    end 

    def intro
        puts "Cat are cool! Want to learn more about different breeds?\ny/n"
        @response = gets.chomp
        if (@response === "y")
            puts "Here are some popular cat breeds: "
            puts Breed.showAllBreeds
        elsif (response === "n")
            puts "Bye"
            exit 
        else  
            puts "Please input a valid response."
            return self.intro 
        end 
    end 

    def chooseBreed
        puts "Select a breed from the list to learn more about it."
        @breed = gets.chomp 
        @validate = Breed.validateBreedInput(@breed)
        if @validate 
            @instance = Breed.new(@breed)
            puts @instance.getBreedInfo
            self.moreInfo?
        else 
            puts "Please input a valid response."
            return self.chooseBreed
        end 
    end 

    def moreInfo?
        puts "Do you want to know more about #{@breed} cats?\ny/n"
        @moreinfo = gets.chomp 
        if (@moreinfo === "y")
            puts @instance.showWikiLink
            return self.chooseBreed
        elsif (moreinfo === "n")
            puts "Had enough? OK, goodbye."
            exit 
        else  
            puts "Please input a valid response."
            return self.moreInfo?
        end 
    end 
end 