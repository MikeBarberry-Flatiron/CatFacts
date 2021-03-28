require 'curb'
require 'json'

class Cats 
    @@data = {}

    def initialize()
        c = Curl::Easy.perform("https://cat-fact.herokuapp.com/facts")
        d = c.body_str 
        e = JSON.parse(d)
        @@data = e
    end 
    
    def showData()
        puts @@data
    end 

    def showFacts()
       @@data.each do |x|
        puts x["text"]
       end 
    end 
end 
