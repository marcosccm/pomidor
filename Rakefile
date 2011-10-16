# tasks are located on the lib/tasks folder
task_files = File.join(File.dirname(__FILE__), "lib", "tasks", "**", "*.rake")
Dir[task_files].each { |task| load task }

task :default => :spec

