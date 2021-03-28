require 'curb'
require 'json'

class Cats 
    @@data = {}

    def initialize()
        c = Curl::Easy.perform("https://api.thecatapi.com/v1/breeds") do |curl|
            curl.headers['x-api-key'] = "7ee9d6b7-120d-475e-899d-7c5cb2353ef9"
        end 
        d = c.body_str
        e = JSON.parse(d)
        @@data = e
    end 
    
    def showData()
        puts @@data
    end 

    def showBreeds()
       @@data.each do |x|
        puts x["name"]
       end 
    end 

    def showBreedInfo(breed)
        @@data.each do |x|
            if x["name"] === breed
                puts "About " + breed + " cats: " + x["description"]
                puts "Lifespan: " + x["life_span"]
                puts "Origin: " + x["origin"]
                puts "Temperament: " + x["temperament"]
            end 
        end 
    end 

    def showWikiLink(breed)
        @@data.each do |x|
            if x["name"] === breed
                puts "Visit this link: " + x["wikipedia_url"]
            end 
        end 
    end 
end 
