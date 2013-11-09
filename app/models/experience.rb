class Experience
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String,  :unique => true 
  field :author 
end
