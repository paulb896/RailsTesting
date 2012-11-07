class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :user_available
  attr_accessible :schedule_helper

  def schedule
    if @schedule_helper.nil?
      self.load_schedule
    end

    return @schedule_helper.availability
  end
  def load_schedule
    @schedule_helper = PaulsCoolGem::UserAvailability.new(self.username)
    # Load in schedule from db into helper object
    self.user_available.each do |entry|
      @schedule_helper.make_available(entry.start_time, entry.end_time)
    end
  end
  def save
    self.save_schedule_to_db
    super
  end
  def save_schedule_to_db
    # self.user_available.empty
    # empty user availabilty in db
    require "date"
    if !@schedule_helper.nil?
      @schedule_helper.availability.each do |date|
        puts date.start_date.to_datetime
        puts date.end_date.to_datetime
        puts "\nISTHEDATEEND"
        new_date = self.user_available.new(:start_time => date.start_date.to_datetime, :end_time => date.end_date.to_datetime)
        new_date.save
      end
    end 
  end
  
  def get_helper
    return @schedule_helper
  end
end
