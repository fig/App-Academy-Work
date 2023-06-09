# == Schema Information
#
# Table name: seeds
#
#  id         :integer(8)      not null, primary key
#  count      :integer         not null
#  plant_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null

class Seed < ApplicationRecord
  belongs_to :plant,
    class_name: 'Plant',
    foreign_key: :plant_id, #seeds table 
    primary_key: :id
end


