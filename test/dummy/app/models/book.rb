class Book < ActiveRecord::Base
  belongs_to :author

  validates :title, :presence => true

  attr_accessible :pages, :references, :title
end
