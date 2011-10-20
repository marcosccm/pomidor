require "spec_helper"

describe "Tasks API" do
  describe "GET /project/:id/tasks" do
    let(:tasks) { "tasks json" } 
    before(:each) { Pomidor::Tasks.should_receive(:of_project).and_return(tasks) }

    it "returns 200" do
      get "/project/7/tasks"
      last_response.status.should == 200
    end

    it "returns the projects tasks" do
      get "/project/7/tasks"
      last_response.body.should == '"tasks json"'
    end
  end
end
