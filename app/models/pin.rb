class Pin < ActiveRecord::Base
  attr_accessible :Description

  validates :Description, presence: true
end