def start_game
	@code = [rand(0..3).to_s, rand(0..3).to_s, rand(0..3).to_s, rand(0..3).to_s]
	$round = 12
	puts "-- NEW GAME --"

	turn
end

def turn
	if $round == 0
		puts "You ran out of turns. You lose."
		start_game
	end

	puts "Enter the code. #{$round} turns remaining."
	guess = gets.chomp
	@guess_array = guess.split("")
	p @guess_array
	$round -= 1

	check_code
	turn
end

def check_code
	hint = ""
	
	(0..@code.size-1).each do |i|
		if @guess_array[i] == @code[i]
			hint.insert(0, "O") #this inserts "O" at the 0th position of hint
		elsif @guess_array[i] == @code[0].to_s || @guess_array[i] == @code[1].to_s || @guess_array[i] == @code[2].to_s || @guess_array[i] == @code[3].to_s
			hint << "X"	
		end
	end

	until hint.length == 4
		hint << "-"
	end
	puts hint
	if hint == "OOOO"
		puts "You cracked the code, YOU WIN!" 
		start_game
	end
end

start_game