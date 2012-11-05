class User < ActiveRecord::Base
  authenticates_with_sorcery!

  #def 
    #@schedule = PaulsCoolGem::UserAvailability.new("User 1")
end
