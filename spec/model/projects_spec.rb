require "spec_helper"

describe Pomidor::Projects do
  describe "#add" do
    it "persists a project" do
      id = Pomidor::Projects.add("test")
      Pomidor::Projects.find(id).name.should == "test"
    end

    it "returns the objects id" do
      Pomidor::Projects.add("test").should_not be_nil
    end
  end

  describe "#count" do
    it "returns the project count" do
      Pomidor::Projects.add("test 1")
      Pomidor::Projects.add("test 2")
      Pomidor::Projects.count.should == 2
    end
  end

  describe "#find" do
    context "when the project with that id" do
      it "returns the project count" do
        id = Pomidor::Projects.add("test 1")
        Pomidor::Projects.find(id).name.should == "test 1"
      end
    end

    context "when the id does not exist" do
      it "returns nil" do
        Pomidor::Projects.find(999).should be_nil
      end
    end
  end

  describe "#all" do
    it "returns all projects" do
      Pomidor::Projects.add("test 1")
      Pomidor::Projects.add("test 2")
      Pomidor::Projects.all.count.should == 2
    end
  end
end
