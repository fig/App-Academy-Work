# == Schema Information
#
# Table name: movies
#
#  id          :integer(8)      not null, primary key
#  title       :string          not null
#  yr          :integer         not null
#  score       :float           not null
#  votes       :integer         not null
#  director_id :integer         not null

class Movie < ApplicationRecord
  belongs_to :director,
    class_name: :Actor,
    foreign_key: :director_id, #movies table
    primary_key: :id

  has_many :castings,
    class_name: :Casting,
    foreign_key: :movie_id, #castings table
    primary_key: :id

  has_many :actors,
    through: :castings,
    source: :actor
end


