module TrappedMethods

	

	# This method prints the help commands so the user knows what to do.
	def help
		puts
		puts "You can navigate the world by using \"go\" and a direction."
		puts "\"look\" will describe your surroundings"
		puts "\"take\" will allow you to take an item in the room."
		puts "\"use\" will allow you to use something in the room."
		puts "\"quit\" will quit the game... you wimp!"
		prompt
	end
	# This clears the screen of existing text
	def clear_screen
		200.times { puts }
	end
	
	# A method to print a paragraph of text with an extra line above and below 
	def print_paragraph(ptext)
		puts
		puts ptext
		puts
	end

	#This module gets the imput from the user and then returns it
	def prompt
		# action_list = ["go north","go west","go east","go south","look","take","use","open","quit"]

		puts
		puts "What would you like to do?"
		user_action = gets.chomp
		clear_screen
		user_action.downcase!  #makes sure the input is lowercase
		
		if user_action == "help"
			help
		elsif user_action == "quit" #check to see if the user really wants to quit
			puts "Are you sure you want to quit? (Y/N)"
			answer = gets.chomp
			answer.downcase!
			
			if answer == "y"
				exit
			else
				prompt	
			end		
		else
			user_action #returns the user action unless it is a help request
		end

	end

end
