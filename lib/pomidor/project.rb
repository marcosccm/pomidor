module Pomidor
  class Project
    attr_accessor :name, :id

    def initialize(id=nil, name)
      @id = id
      @name = name
    end

    def description
      "#{id} - #{name}"      
    end

    def to_json(encoder=Yajl::Encoder.new)
      encoder.encode({ "name" => @name })
    end

    class << self
    end
  end
end
