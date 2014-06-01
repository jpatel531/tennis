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

	it "will go to deuce when theirs and the opponent scores are both 40"


end