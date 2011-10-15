class Project
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_json(encoder=Yajl::Encoder.new)
    encoder.encode({ "name" => @name })
  end

  class << self
    def all
      [ Project.new("test"), Project.new("another")]
    end
  end
end
