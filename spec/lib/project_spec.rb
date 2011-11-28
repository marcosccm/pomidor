require "spec_helper"

describe Pomidor::Project do
  it "shows the id and name as a description" do
    project = Pomidor::Project.new(1, "pomidor")
    project.description.should == "1 - pomidor"
  end 
end
