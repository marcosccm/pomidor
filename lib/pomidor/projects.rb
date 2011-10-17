module Pomidor
  class Projects
    class << self
      def all
        data = $redis.keys("projects:*")
        data.map { |d| map_project(d) }
      end

      def find(id)
        data = $redis.hgetall("projects:#{id}")
        data.empty? ? nil : map_project(data) 
      end

      def count
        $redis.get("projects").to_i
      end

      def add(name)
        id = $redis.incr("projects")
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
