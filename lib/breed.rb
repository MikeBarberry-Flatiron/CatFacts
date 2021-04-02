require_relative 'api'

class Breed 
    
    @@data = API.data

    attr_accessor :description, :lifespan, :origin, :temperament, :wikilink

    def initialize(breed)
        @@data.each do |x|
            if x["name"] === breed
                self.description = x["description"]
                self.lifespan =  x["life_span"]
                self.origin = x["origin"]
                self.temperament = x["temperament"]
                self.wikilink = x["wikipedia_url"]
            end 
        end
    end 

    def self.showAllBreeds
        @@data.map do |x|
            x["name"]
        end 
    end 

    def self.validateBreedInput(input) 
       validation =  @@data.any? {|element| element["name"] === input} 
    end 

    def getBreedInfo
        "Description: #{@description}\nLifespan: #{@lifespan}\nOrigin: #{@origin}\nTemperament: #{@temperament}"
    end 

    def showWikiLink
        "You can find more info here: #{@wikilink}"
    end
end 
