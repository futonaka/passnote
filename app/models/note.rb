class Note < ActiveRecord::Base
  has_many :user_has_notes
  has_many :users, :through => :user_has_notes
  has_many :entries
end
