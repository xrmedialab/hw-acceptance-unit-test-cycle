require 'rails_helper'

RSpec.describe Movie, :type => :model do
    it "find correct movies by the same director" do
        new_movies = [{"title": "Die Hard", "director": "John McTiernan"}, 
        {"title": "Die Hard with a Vengeance", "director": "John McTiernan"}, 
        {"title": "Wonder Boys", "director": "Curtis Hanson"}]
        new_movies.each do |new_movie|
            Movie.create(new_movie)
        end

        result = Movie.by_same_director("John McTiernan")

        expect(result.length()).to eq(2)

        result = result.as_json
        expect(result[0]["director"]).to eq("John McTiernan")
        expect(result[1]["director"]).to eq("John McTiernan")
    end

end  