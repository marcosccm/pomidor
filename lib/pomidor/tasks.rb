module Pomidor
  class Tasks
    class << self
      def all(project_id)
        []  
      end

      def add(project_id, description)
        id = $redis.incr("projects") 
        $redis.hset("projects:#{project_id}:tasks:#{id}", "id", id)
        $redis.hset("projects:#{project_id}:tasks:#{id}", "description", description)
        id
      end
    end

    private
    def map_object(data)
      Task.new(data["description"])
    end
  end
end
