class User < ActiveRecord::Base
  authenticates_with_sorcery!

  def schedule
    if @schedule.nil?
      @schedule = PaulsCoolGem::UserAvailability.new(self.name)
    end
    return @schedule
  end
end
