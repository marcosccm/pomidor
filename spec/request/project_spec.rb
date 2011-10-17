require "spec_helper"

describe "Project API"  do
  describe "GET /project" do
    it "returns 200" do
      get "/project"
      last_response.status.should == 200
    end

    it "returns a list of projects" do
      Pomidor::Projects.should_receive(:all).and_return("json")
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
        Pomidor::Projects.should_receive(:find).with("1").and_return("json")
        get "/project/1"
        last_response.body.should == '"json"'
      end
    end
  end

  describe "POST /project" do
    context "with valid project data" do
      before :each do
        Pomidor::Projects.should_receive(:create).and_return true
      end

      it "responds 201" do
        post "/project", :project => { :name => "test" }
        last_response.status.should == 201
      end

      it "adds a project" do
        post "/project", :project => { :name => "test" }
      end
    end
  end
end
