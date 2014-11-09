class Collection < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  validates_presence_of :item_id, :user_id
  validates_uniqueness_of :item_id, scope: :user_id
end
