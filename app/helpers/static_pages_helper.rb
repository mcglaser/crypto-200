module StaticPagesHelper
    
    
    def total_market_cap
      @market_caps.inject(0){|sum,x| sum + x }
        
    end
    
    
    def calculated_market_weights
        @market_weights = []
        @market_caps.each do |cap|
            fixed_cap = cap * 100
            weight = fixed_cap.fdiv(total_market_cap)
            #weight = (cap.to_f / total_market_cap.to_f).round(10)
            @market_weights << weight
        end
        return @market_weights
    end
    
    
    def crypto_two_hundred
        @crypto_two_hundred_values = []
        calculated_market_weights.each_with_index do |weight, index|
            weight_fixed = weight.round(4) / 100 
            calculation = weight_fixed * @percent_changes[index]
            @crypto_two_hundred_values << calculation
        end
        return @crypto_two_hundred_values.sum.round(2)
    end
    
    
    def in_the_green
        @percent_changes.select {|x| x > 0}.count
    end
    
    def green_percentage
        result = in_the_green.to_f / 200.0
        return result * 100
        
    end
    
       def in_the_red
        @percent_changes.select {|x| x <= 0}.count
       end
    
    def red_percentage
        result = in_the_red.to_f / 200.0
        return result * 100
        
    end
    
    
     def biggest_gainer_name
         biggest_gainer_index = @percent_changes.each_with_index.max[1]
         return @names[biggest_gainer_index]
     end
     
     def biggest_gainer_percentage
         @percent_changes.max
     end
    
     def biggest_loser_name
       biggest_loser_index = @percent_changes.each_with_index.min[1]
       return @names[biggest_loser_index]
     end
     
     def biggest_loser_percentage
         @percent_changes.min
     end
    
  
end