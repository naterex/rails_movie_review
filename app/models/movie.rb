class Movie < ActiveRecord::Base
  validates :title, :description, :director, :movie_length, :rating, presence: true
end
