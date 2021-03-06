require 'dbcfaker'
class User < ActiveRecord::Base
	has_many :days, dependent: :destroy
	has_many :activities, through: :days
	has_one :authorization, dependent: :destroy

	def weight
	  lbs = self.weight_kgs * 2.2
	  lbs.round
	end

	def height
	  inches_height = self.height_meters * 39
	  rounded_inches = inches_height.round
	  feet_and_inches(rounded_inches)
	end

	def feet_and_inches(inches)
	  feet_inches = inches.divmod(12)
	  "#{feet_inches[0]}'#{feet_inches[1]}\""
	end

	def set_gender
	  if self.gender == true
	  	return "Female"
	  else
	  	return "Male"
	  end
	end

	def display_life_expectancy
    self.days.last.life_expectancy.to_s + " years"
  end

	# def daily_goal
	# 	DbcFaker::Goal.goal
	# end

	def motivational_quote
		DbcFaker::Quote.quote
	end

	def resource_title
		DbcFaker::Resource.title
	end

	def resource_link
		DbcFaker::Resource.link
	end

	def just_the_tip_title
		DbcFaker::Tip.title
	end

	def just_the_tip_link
		DbcFaker::Tip.link
	end
end

