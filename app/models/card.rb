class Card < ActiveRecord::Base
  attr_accessible :back, :front
  belongs_to :deck # belongs_to is adding methods - here a method called deck - sql returns and then addes
end
