require_relative 'scoring_rules'

class Player

include ScoringRules

	attr_accessor :score, :points_won, :games_won, :deuce

	def initialize
		@points_won = 0
		@games_won = 0
		@deuce = false
	end

	def deuce?
		@deuce
	end

	def points_won
		@points_won
	end

	def score
		if deuce? == false
			@score = NORMAL_SCORING[points_won]
		else
			@score = DEUCE_SCORING[points_won]
		end
	end

	def deuce_with opponent
		self.points_won == 3 && opponent.points_won == 3
	end

	def advantage_over opponent
		self.points_won == 5 && opponent.points_won == 4
	end

	def loses_advantage_over opponent
		self.points_won == 1 && opponent.points_won == 1
	end

	def wins_game_over opponent
		self.games_won += 1
		self.points_won = 0
		opponent.points_won = 0
	end

	def games_won
		@games_won
	end

	def advantage_match_point_versus opponent
			deuce? && (self.points_won == 2)
	end

	def normal_match_point_versus(opponent)
		self.points_won == 4 && opponent.points_won < 4
	end

	def match_point_versus opponent
		(advantage_match_point_versus opponent) || (normal_match_point_versus opponent)
	end

	def beat opponent
		self.points_won += 1
		if deuce_with opponent
			self.deuce = true
			opponent.deuce = true
			self.points_won = 0
			opponent.points_won = 0
		elsif self.loses_advantage_over opponent
			self.points_won -= 1
			opponent.points_won -= 1
		elsif match_point_versus(opponent)
			self.wins_game_over opponent
		end
	end

end