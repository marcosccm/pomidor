Before do
  @redis = Redis.new
  @redis.flushall
end

Given /^the following projects$/ do |projects|
  projects.hashes.each do |project|
    create_project(project['name'])
  end
end

Given /^a project called "([^"]*)"$/ do |project_name|
  create_project(project_name)
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

def create_project(name) 
  result = system "pomidor project create '#{name}'"
  result.should be_true
end
