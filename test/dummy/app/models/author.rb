class Author < ActiveRecord::Base
  has_many :books

  validates :name, :presence => true

  attr_accessible :books_attributes, :name, :country, :birthday

  accepts_nested_attributes_for :books, :allow_destroy => true
end
