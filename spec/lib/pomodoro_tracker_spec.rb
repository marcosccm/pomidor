require "spec_helper" 

describe Pomidor::PomodoroTracker do
  let(:redis) { stub }

  before :each do
    Redis.stub!(:new) { redis }
  end

  context "adding a task" do
    it "adds a task to with the name" do
      subject.stub!(:current_id) { 1 }
      redis.should_receive(:llen).with("pomidor:tasks").and_return 0
      redis.should_receive(:hset).with("pomidor:tasks:1", "name", "potato")
      redis.should_receive(:hset).with("pomidor:tasks:1", "id", 1)
      redis.should_receive(:hset).with("pomidor:tasks:1", "project_id", 1)
      subject.add_task("potato")
    end
  end
end
