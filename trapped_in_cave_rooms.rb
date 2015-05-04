require "./trapped_in_cave_mods"
include TrappedMethods

module TrappedRooms

	$inventory = [] # an array for holding the players inventory (the $ makes the variable global)
	$bridge_down = false # to set the bridge posistion in the water_room

	# The game is broken up into five rooms each of the rooms is in their own method
# The prompt method is called after a description of the room and its output is stored in the action variable
# A case/when handles the choices in each room and a help function is available from anywhere as well 



	def start_room
		print_paragraph("There is a torch on the wall giving off a small amount of light.
To the north you see a door and to the east there is a passage to another room.")
		action = prompt

		case action
		when "look"
			start_room
		when "go north"
			if $inventory.include?("key") # Checks to see if you have the key required to open the door
				sword_room
			else
				puts "The door is locked. Perhaps there is a key somewhere."
				start_room
			end
		when "go east"
			troll_room
		when "go south"
			puts "Rocks and boulders block that way."
			start_room
		when "go west"
			puts "There's nothing but a cave wall there."
			start_room
		else 
			puts "That wont work."
			start_room
		end

	end


	def sword_room
		print_paragraph("This room seems to have been a barracks of some sort.
It doesn't look if anyone has used it in a long time.
The only way in and out is to the south.")

		unless $inventory.include?("sword") # If you already have the sword it should not describe it as being in the room
			puts "On a table in the middle of the room you see one last sword."
		end	

		action = prompt

		case action
		when "look"
			sword_room
		when "go north"
			puts "There's nothing but a wall there."
			sword_room
		when "go east"
			puts "There's nothing but a wall there."
			sword_room
		when "go south"
			start_room
		when "go west"
			puts "There's nothing but a wall there."
			sword_room
		when "take sword"
			if $inventory.include?("sword") # Check to see if you already have the sword
				puts "You can't take what you already have."
			else
				puts "You think the sword might come in handy and take it with you."
				$inventory << "sword"
			end
			sword_room
		else 
			puts "That wont work."
			sword_room
		end

	end



	def troll_room
		print_paragraph("In the corner you see a troll sleeping by a small fire that is flickering off the walls.
To the south is another room and to the west is the room you came from. It seems all the other ways are blocked.")
		
		unless $inventory.include?("key") # Check for key
			puts "On the ground near the troll you can see a silver key glimmering in the firelight."
		end

		action = prompt

		case action
		when "look"
			troll_room
		when "go north"
			puts "You stumble around and awaken the troll.\nHe eats you for breakfast and complains the whole time."
			player_dead
		when "go east"
			puts "You stumble around and awaken the troll.\nHe eats you for breakfast and complains the whole time."
			player_dead
		when "go south"
			water_room		
		when "go west"
			start_room
		when "take key"
			if $inventory.include?("key")
				puts "You can't take what you already have."
			else
				puts "You quietly sneak up to the sleeping troll being sure not to wake him\nand with the skill of a master theif you take the key."
				$inventory << "key"
			end
			troll_room
		else 
			puts "That wont work."
			troll_room
		end

	end




	def water_room


		print_paragraph("This room is vast with the only light trickling through cracks in the ceiling.
The sound of bats makes you uneasy.")
		
		if $bridge_down #Changes the description of the room depending on the position of the plank
			puts "Now that you have created a bridge, the path to the east is clear."
		else
			puts "There is a chasm in the middle of the room.
You can hear rushing water in the distance but no mortal could survive that fall.
In the corner of your eye you see a plank of wood."
		end

		action = prompt

		case action
		when "look"
			water_room
		when "go north"
			troll_room
		when "go east"
			if $bridge_down
				spider_room
			else
				puts "You head east and soon fall to your death."
				player_dead
			end
		when "go south"
			puts "You stumble around in the dark, slip and fall to your untimely death."
			player_dead		
		when "go west"
			puts "You stumble around in the dark, slip and fall to your untimely death."
			player_dead
		when "use wood"
			if $bridge_down
				puts "You already used the plank of wood to create a bridge."
				water_room
			else
				puts "You carefully lay the plank of wood across the chasm creating a makeshift bridge."
				$bridge_down = true #sets the bridge to being down
				water_room
			end
		else 
			puts "That wont work."
			water_room
		end

	end



	def spider_room


		print_paragraph("Finally you can see the light of day.
It seems the cave opening is right down this passage, directly to the east.
There's only one problem... a giant spider is blocking your way.
You could always go back west.")
		
		action = prompt

		case action
		when "look"
			spider_room
		when "go north"
			puts "More stone here."
			spider_room
		when "go east"
			puts "You walk towards the light of day, hoping the spider doesn't see you.
But it seems this isn't your lucky day and the giant spider wraps you in it's web."
			player_dead
		when "go south"
			puts "Nothing hear but rocks."
			spider_room		
		when "go west"
			water_room
		when "use sword"
			if $inventory.include?("sword")
				puts "You take out the sword and sneak up on the spider.
Just as the beast senses your presence you drive the sword deep into the spider's brain,
killing it instantly."
				end_game #ends the game
			else
				puts "You can't use what you don't have."
			end
		else 
			puts "That wont work."
			spider_room
		end

	end


end