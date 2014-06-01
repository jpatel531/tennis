class Player

	attr_accessor :score, :points_won, #:deuce

	def initialize
		@points_won = 0
		# @deuce = false
	end

	def score_cast
		["love","fifteen","thirty","forty"]
	end

	def points_won
		@points_won
	end

	def score
		@score = score_cast[points_won] #unless deuce?
		# @score = tie_cast[points_won] if deuce?
	end

	def deuce!
		@deuce = true
	end

	def deuce?
		@deuce
	end

	def beat opponent
		self.points_won += 1
		# if self.points_won == 3 && opponent.points_won == 3
		# 	self.deuce!
		# end
	end

end