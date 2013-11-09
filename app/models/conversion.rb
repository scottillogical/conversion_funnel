class Conversion
  include Mongoid::Document
  has_one :arrival
  has_many :answers
end
