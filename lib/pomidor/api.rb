module Pomidor
  class API < Grape::API
    resource :project do
      get do
        Projects.all
      end

      get "/:id" do 
        Projects.find(params[:id]) 
      end

      post do
        Projects.create(params[:project]) 
      end
    end

    get "project/:id/tasks" do
      Tasks.of_project(params[:id])
    end
  end
end
