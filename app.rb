require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    @analyzed_text = TextAnalyzer.new(text_from_user)
    @most_common_occurs = @analyzed_text.most_used_letter.values.first
    @most_common_letter = @analyzed_text.most_used_letter.key(@most_common_occurs)
    erb :results
  end
end
