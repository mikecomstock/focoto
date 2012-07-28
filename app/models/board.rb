class Board < ActiveRecord::Base
  attr_accessible :name
  has_many :posts, :primary_key => :name, :foreign_key => :to_email
end
