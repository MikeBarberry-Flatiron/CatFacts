require 'curb'
require 'json'
require_relative 'api'

class Cat < API
     
    attr_accessor :description, :lifespan, :origin, :temperament, :wikilink

    def self.showAllBreeds
        @@data.each do |x|
            puts x["name"]
        end 
    end 

    def self.validateBreedInput(input) 
       validation =  @@data.any? {|element| element["name"] === input} 
    end 

    def getBreedInfo(breed)
        @@data.each do |x|
            if x["name"] === breed
                @description = x["description"]
                @lifespan =  x["life_span"]
                @origin = x["origin"]
                @temperament = x["temperament"]
                @wikilink = x["wikipedia_url"]
            end 
        end 
    end 

    def showBreedInfo
       puts "Description: #{@description}\nLifespan: #{@lifespan}\nOrigin: #{@origin}\nTemperament: #{@temperament}"
    end 

    def showWikiLink
        puts "You can find more info here: #{@wikilink}"
    end
end 

