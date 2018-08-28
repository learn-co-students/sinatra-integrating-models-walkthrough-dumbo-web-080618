require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end
  #let's take the data from params[user_text] (in the post '/' do route) and feed it into a new instance of theTextAnalyzer class:
  #We now have the instance of TextAnalyzer saved to an instance variable called @analyzed_text. This means that we can call it and its methods from the results.erb view that is being rendered, using erb tags!
  post '/' do
    text_from_user = params[:user_text]
    @analyzed_text = TextAnalyzer.new(params[:user_text])

    erb :results
  end
end
