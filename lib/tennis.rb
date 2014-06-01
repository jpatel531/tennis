class Player

	attr_accessor :score
	attr_accessor :games_won

	def initialize
		@games_won = 0
	end

	def score_cast
		["love","fifteen","thirty","forty"]
	end

	def games_won
		@games_won
	end

	def score
		@score = score_cast[games_won]
	end

	def beat opponent
		self.games_won += 1
	end

end