require "spec_helper"

describe "Project API"  do
  describe "GET /project" do
    it "returns 200" do
      get "/project"
      last_response.status.should == 200
    end

    it "returns a list of projects" do
      Project.should_receive(:all).and_return("json")
      get "/project"
      last_response.body.should == '"json"'
    end
  end  

  describe "GET /project/:id" do
    context "for a known id" do
      it "returns 200" do
        get "/project/1"
        last_response.status.should == 200
      end

      it "returns the requested project" do
        Project.should_receive(:find).with("1").and_return("json")
        get "/project/1"
        last_response.body.should == '"json"'
      end
    end
  end
end
