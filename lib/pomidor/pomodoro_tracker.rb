module Pomidor
  class PomodoroTracker
    fattr(:redis) { Redis.new } 

    def project_names 
      redis.keys("pomidor:projects:*").inject([]) do |values, key|
        values.concat redis.hvals(key)
      end
    end

    def add_project(name) 
      id = redis.llen("pomidor:projects") + 1
      last_id = redis.set("pomidor:current_project", id)
      redis.lpush("pomidor:projects", id)
      redis.hset("pomidor:projects:#{id}", "name", name)
    end
  end
end
