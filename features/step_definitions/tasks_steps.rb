Then /^there should be a task called "([^"]*)" under the project "([^"]*)"$/ do |task_name, project_name|
  t_name = @redis.hget("pomidor:tasks:1", "name")
  project_id = @redis.hget("pomidor:tasks:1", "project_id")
  p_name = @redis.hget("pomidor:projects:#{project_id}", "name")

  t_name.should == task_name
  p_name.should == project_name
end
