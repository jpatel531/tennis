class Player

	attr_accessor :score, :points_won, :games_won

	def initialize
		@points_won = 0
		@games_won = 0
	end

	def score_cast
		["love","fifteen","thirty","forty", "deuce", "advantage"]
	end

	def points_won
		@points_won
	end

	def score
		@score = score_cast[points_won]
	end

	def deuce_with opponent
		self.points_won == 3 && opponent.points_won == 3
	end

	def advantage_over opponent
		self.points_won == 5 && opponent.points_won == 4
	end

	def loses_advantage_over opponent
		self.points_won == 5 && opponent.points_won == 5
	end

	def wins_game_over opponent
		self.games_won += 1
		self.points_won = 0
		opponent.points_won = 0
	end

	def games_won
		@games_won
	end

	def match_point_versus(opponent)
		(self.points_won == 4 && opponent.points_won < 4) || ((self.points_won == 6) && (opponent.points_won == 4))
	end

	def beat opponent
		self.points_won += 1
		if deuce_with opponent
			self.points_won += 1
			opponent.points_won += 1
		elsif self.loses_advantage_over opponent
			self.points_won -= 1
			opponent.points_won -= 1
		elsif match_point_versus(opponent)
			self.wins_game_over opponent
		end
	end

end