module Pomidor
  class API < Grape::API
    resource :project do
      get do
        Project.all
      end
    end
  end
end
