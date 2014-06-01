require 'tennis'

describe Player do 
	let(:player) {Player.new}
	let(:opponent) {Player.new}

	it "has a score of 0 when initialized" do
		expect(player.score).to eq "love"
	end

	it "can have a score of 15 after beating an opponent" do 
		player.beat opponent
		expect(player.score).to eq "fifteen"
	end

	it "can have a score of 30 after beating an opponent twice" do 
		2.times {player.beat opponent}
		expect(player.score).to eq "thirty"
	end

	it "can have a score of 40 after beating an opponent thrice" do 
		3.times {player.beat opponent}
		expect(player.score).to eq "forty"
	end

	it "will go to deuce when theirs and the opponent scores are both 40" do
		3.times {player.beat opponent}
		3.times {opponent.beat player}
		expect(player.score).to eq "deuce"
	end

	it "will have an advantage if it wins a point on deuce" do 
		3.times {player.beat opponent}
		3.times {opponent.beat player}
		player.beat opponent
		expect(player.score).to eq "advantage"
	end	

	it "will have a score of deuce if the opponent has the advantage" do
		3.times {player.beat opponent}
		3.times {opponent.beat player}
		player.beat opponent
		expect(opponent.score).to eq "deuce"
	end

	it "will win the game if the player on advantage wins the point" do 
		3.times {player.beat opponent}
		3.times {opponent.beat player}
		2.times {player.beat opponent}
		expect(player.games_won).to eq 1
	end

	it "will go back to deuce if a player loses his advantage" do
		3.times {player.beat opponent}
		3.times {opponent.beat player}
		player.beat opponent
		opponent.beat player
		expect(player.score).to eq "deuce"
		expect(opponent.score).to eq "deuce"
	end

	it "a player can win a game without deuce" do 
		4.times {player.beat opponent}
		expect(player.games_won).to eq 1
	end


end