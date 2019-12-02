require 'sinatra/base'
require 'json'
require_relative "./api_snippets"

module ExpenseTracker
  class API < Sinatra::Base

    post '/expenses' do
      expense = JSON.parse(request.body.read)
      binding.pry
      result = @ledger.record(expense)
      JSON.generate('expense_id' => result.expense_id)
    end

    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end