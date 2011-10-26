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
      redis.lpush("pomidor:projects", id)
      redis.hset("pomidor:projects:#{id}", "name", name)
      set_current(id)
    end

    def set_current(id)
      redis.set("pomidor:current_project", id)
    end

    def current
      last_id = redis.get("pomidor:current_project")
      name = redis.hget("pomidor:projects:#{last_id}", "name")
    end
  end
end
