class SettingsController < ApplicationController
	def self.nextindex
		@@index ||= Setting.first
		@@index = @@index +1 
	end
end
