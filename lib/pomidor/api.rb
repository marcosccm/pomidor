module Pomidor
  class API < Grape::API
    resource :project do
      get do
        Project.all
      end

      get "/:id" do 
        Project.find(params[:id]) 
      end

      post do
        Project.create(params[:project]) 
      end
    end
  end
end
