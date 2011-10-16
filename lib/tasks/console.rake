desc "loads the api environment on a irb session"
task :console do
  system("irb -r './environment'")
end
