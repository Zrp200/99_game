require "spec_helper"
require "99_game"
describe "converter" do
	context "when a number" do
		it "should return the input as a number" do
			expect(converter("5")).to eq 5
		end
	end
	context "when an abbreveation" do
		it "should expand it" do
			expect(converter("K")).to eq "King"
		end
	end
end
