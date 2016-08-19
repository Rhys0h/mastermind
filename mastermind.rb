def start_game
	puts "Do you want to write the code or crack the code? (write/crack)"
	humancomputer = gets.chomp
	if humancomputer == "write"
		puts "Enter a four-digit code:"
		@code = gets.chomp
		$round = 12
		computerturn
	elsif humancomputer == "crack"
		@code = [rand(0..3).to_s, rand(0..3).to_s, rand(0..3).to_s, rand(0..3).to_s]
		$round = 12
		puts "-- NEW GAME --"
		turn
	else
		puts "Type write or crack"
		start_game
	end
end

def turn
	if $round == 0
		puts "You ran out of turns. The code was #{@code}. You lose."
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

def computerturn
	if $round == 0
		puts "Computer failed to guess. You win"
		start_game
	end
	computer_guess = [rand(0..3).to_s, rand(0..3).to_s, rand(0..3).to_s, rand(0..3).to_s]
	puts "#{$round} rounds remain. Computer guesses #{computer_guess}"
	if computer_guess == @code
		puts "Computer guesses correctly. You lose"
		start_game
	else
		$round -= 1
		computerturn
	end
end

start_game