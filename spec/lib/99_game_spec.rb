require "spec_helper"
require "99_game"
describe "converter" do
	context "when a number" do
		subject {converter ?5}
		it {is_expected.to eq 5}
	end
	context "when an abbreveation" do
		subject {converter ?K}
		it {is_expected.to eq "King"}
	end
end
