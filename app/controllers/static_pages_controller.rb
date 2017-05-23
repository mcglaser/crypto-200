require 'httparty'

class StaticPagesController < ApplicationController



  def home
    @names = []
    @market_caps = []
    @percent_changes = []
    response = HTTParty.get('https://api.coinmarketcap.com/v1/ticker/?limit=200')
    @json = JSON.parse(response.body)  
    
    @json.each do |hash|
      hash.each do |k, v|
        
        if k == "name"
          @names << v
        end
        
        if k == "market_cap_usd"
          @market_caps << v.to_i
        end
        
        if k == "percent_change_24h"
          @percent_changes << v.to_f
        end
          
       end
     end
  end
  
  
  
end