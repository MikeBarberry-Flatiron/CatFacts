require 'curb'
require 'json'

class API
    @@data = {}

    def initialize()
        c = Curl::Easy.perform("https://api.thecatapi.com/v1/breeds") do |curl|
            curl.headers['x-api-key'] = "7ee9d6b7-120d-475e-899d-7c5cb2353ef9"
        end 
        d = c.body_str
        e = JSON.parse(d)
        @@data = e
    end 
end 

