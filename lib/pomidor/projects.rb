module Pomidor
  class Projects
    class << self
      def all
        ids = $redis.lrange("projects", 0, -1).reverse
        ids.map { |id| find(id) } 
      end

      def find(id)
        data = $redis.hgetall("projects:#{id}")
        data.empty? ? nil : map_project(data) 
      end

      def count
        $redis.llen("projects").to_i
      end

      def add(name)
        id = count + 1
        $redis.lpush("projects", id)
        $redis.hset("projects:#{id}", "id", id)
        $redis.hset("projects:#{id}", "name", name)
        id
      end

      private
      def map_project(data)
        Project.new(data["name"])
      end
    end
  end
end
