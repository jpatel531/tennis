require 'tennis'

describe Player do 
	let(:player) {Player.new}
	let(:opponent) {Player.new}

	context "when created" do
		it "has a score of 0"  do
			expect(player.score).to eq "love"
		end
	end

	context "can have a score of" do

		it "15" do 
			player.beat opponent
			expect(player.score).to eq "fifteen"
		end

		it "30" do 
			2.times {player.beat opponent}
			expect(player.score).to eq "thirty"
		end

		it "40" do 
			3.times {player.beat opponent}
			expect(player.score).to eq "forty"
		end
	end

	context "can win a game" do
		it "a player can win a game" do 
			4.times {player.beat opponent}
			expect(player.games_won).to eq 1
		end
	end

	context "in deuce" do
	before(:each) {3.times {player.beat opponent} ; 3.times {opponent.beat player}}	

		it "will share a score of 40 with the opponent" do
			expect(player.score).to eq "deuce"
		end

		it "can win an advantage" do 
			player.beat opponent
			expect(player.score).to eq "advantage"
		end	

		it "will score deuce if opponent wins advantage" do
			player.beat opponent
			expect(opponent.score).to eq "deuce"
		end

		it "will win the game if he wins on advantage" do 
			2.times {player.beat opponent}
			expect(player.games_won).to eq 1
		end

		it "will score deuce if he loses his advantage" do
			player.beat opponent
			opponent.beat player
			expect(player.score).to eq "deuce"
			expect(opponent.score).to eq "deuce"
		end
	end
end