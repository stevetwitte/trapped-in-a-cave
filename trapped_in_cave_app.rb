# Trapped in a cave
# This is a text adventure REPL game
# The game starts with you waking up in a cave
# You don't remember how you got there
# You don't know how to get out
# There is a spider guarding the entrance

require "./trapped_in_cave_mods"
require "./trapped_in_cave_rooms"
include TrappedRooms
include TrappedMethods




#This is what happens when you beat the game
def end_game
	print_paragraph("You made it out alive and all before lunch.\nCongratulations on your victory!")
	puts "Would you like to play again? (Y/N)"	
	play_again = gets.chomp
	play_again.downcase!
	if play_again == "y"
		game_start
	else
		exit
	end
end

#Checks to see if the player would like to try again after dying 
def player_dead
	puts "Would you care to try again? (Y/N)"
	play_again = gets.chomp
	play_again.downcase!
	if play_again == "y"
		game_start
	else
		exit
	end
end

#clears the screen and starts the game
def game_start

	clear_screen

	print_paragraph("Welcome to Trapped In A Cave.\nGuess what? You're trapped in a cave...
Can you make it out alive?\n(For a list of commands type help at anytime.)")

start_room

end


game_start #calls the method that starts the game