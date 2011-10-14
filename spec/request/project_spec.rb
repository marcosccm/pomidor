require "spec_helper"

describe "Project API"  do
  describe "GET /project" do
    it "returns 200" do
      get "/project"
      last_response.status.should == 200
    end

    it "returns a list of projects" do
      Project.stub(:all).and_return("test")
      get "/project"
      last_response.body.should == '"test"'
    end
  end  
end
