class UserHasNote < ActiveRecord::Base
  belongs_to :user
  belongs_to :note
end
