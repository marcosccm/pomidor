$: << File.expand_path("../../lib", __FILE__)
module Pomidor
  autoload :API, 'pomidor/api'
  autoload :Project, 'pomidor/project'
  autoload :Projects, 'pomidor/projects'
  autoload :Tasks, 'pomidor/tasks'
  autoload :PomodoroTracker, 'pomidor/pomodoro_tracker'
end

