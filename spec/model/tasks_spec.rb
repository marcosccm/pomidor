require "spec_helper"

describe Pomidor::Tasks do
  subject { Pomidor::Tasks }
  before :each do
    @project_id = Pomidor::Projects.add("test")
  end

  describe "retrieving tasks from a project" do
    it "returns the project tasks" do

    end
  end

  describe "adding tasks to a project" do
    it "associates a task with a project" do
      subject.add(@project_id, "a task")
      subject.all(@project_id).first.description.should == "a task"
    end
  end
end
