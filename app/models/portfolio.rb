class Portfolio < ApplicationRecord
	puts "SELF DENTRO DE Portfolio Class es igual a #{self}  " * 3
	validates :title, :body, :main_image, :thumb_image, presence: true

	after_initialize :set_defaults

	def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  def set_defaults
  	puts "SELF DENTRO DE set_defaults es igual a #{self}" * 3
  	self.main_image ||= "http://placehold.it/600x400"
		self.thumb_image ||= "http://placehold.it/350x200"
  end

end
