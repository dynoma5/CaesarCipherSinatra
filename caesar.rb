require 'sinatra'
require 'sinatra/reloader'
def caesar_cipher (string, number) 
	new_string = Array.new
	string.each_char do |char| 
		
		if char.ord >= 65 and char.ord <= 90
			new = char.ord + number
	
			if new > 90
				new = new -90+64
				
			end
			
		elsif char.ord >= 97 and char.ord <= 122
			new = char.ord + number
			
			if new > 122
				new = new - 122 + 96
				
			end
		else
			new = char.ord
		end
		
		char = new.to_i.chr
		
		new_string.push(char)
	end
	
	something = new_string.join
	return something
end	
get '/' do
	string = params['sentence'].to_s
	number = params['shift'].to_i
	new_message = caesar_cipher(string,number)
	
	erb :index, :locals =>{:message => new_message}
end
	