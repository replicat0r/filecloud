class Folder < ActiveRecord::Base
  acts_as_tree
  belongs_to :user
  has_many :cabinets, :dependent => :destroy
end
