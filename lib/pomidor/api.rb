module Pomidor
  class API < Grape::API
    get "/project" do
      Project.all
    end
  end
end
