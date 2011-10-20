module Pomidor
  class PomodoroTracker
    fattr(:redis) { Redis.new } 

    def project_names 
      redis.keys("pomidor:projects:*").inject([]) do |values, key|
        values.concat redis.hvals(key)
      end
    end
  end
end
