class Skill < ApplicationRecord

	include Placeholder

	validates :title, :percent_utilized, presence: true

	after_initialize :set_defaults

  def set_defaults
  	puts "SELF DENTRO DE set_defaults es igual a #{self}" * 3
  	self.badge ||= Placeholder.image_generator(height: "250", width: "250")
  end

end
