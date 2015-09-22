class Movie < ActiveRecord::Base
  validates :title, :description, :movie_length, :rating, presence: true
end
