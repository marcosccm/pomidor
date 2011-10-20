Before do
  @redis = Redis.new
  @redis.flushall
end

Given /^a project called "([^"]*)"$/ do |project_name|
  result = system "pomidor project create '#{project_name}'"
  result.should be_true
end

Then /^there should be a project called "([^"]*)"$/ do |project_name|
  values =  @redis.keys("pomidor:projects:*").inject([]) do |values, key|
    values.concat @redis.hvals(key)
  end
  values.should include(project_name)
end

Then /^there should be (\d+) projects$/ do |project_count|
  @redis.llen("pomidor:projects").should == project_count.to_i
end
