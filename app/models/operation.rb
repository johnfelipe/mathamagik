class Operation < ActiveRecord::Base
  before_save :create_clientkey
  attr_accessible :bottom, :top
  serialize :top
  serialize :bottom
  serialize :options

  private
    def create_clientkey
      self.cookie = SecureRandom.urlsafe_base64
    end
end
