class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :user_available

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
    if !@schedule_helper.nil?
      @schedule.availability.each do |date|
        self.user_available.new(date.start_date, date.end_date).save
      end
    end 
  end

  attr_accessible :schedule_helper
end
