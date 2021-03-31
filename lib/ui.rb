require_relative 'cat'

class UI 
    attr_accessor :response, :breed, :validate, :cat, :moreinfo

    def intro
        puts "Cat are cool! Want to learn more about different breeds?\ny/n"
        @response = gets.chomp
        if (@response === "y")
            puts "Here are some popular cat breeds: "
            Cat.showAllBreeds
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
        @validate = Cat.validateBreedInput(@breed)
        if @validate 
            @cat = Cat.new 
            @cat.getBreedInfo(@breed) 
            @cat.showBreedInfo
        else 
            puts "Please input a valid response."
            return self.chooseBreed
        end 
    end 

    def moreInfo?
        puts "puts Do you want to know more about #{@breed} cats?\ny/n"
        @moreinfo = gets.chomp 
        if (@moreinfo === "y")
            @cat.showWikiLink
        elsif (moreinfo === "n")
            puts "Had enough? OK, goodbye."
            exit 
        else  
            puts "Please input a valid response."
            return self.moreInfo?
        end 
    end 
end 