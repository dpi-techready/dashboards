class CurrenciesController < ApplicationController
  def first_currency
    # get raw data
    raw_data = open("https://api.exchangerate.host/symbols").read
    # parse the data to JSON
    parsed_data = JSON.parse(raw_data)
    # make a hash with parsed data
    symbols_hash = parsed_data.fetch("symbols")
    # grab the keys/symbols from the hash and put them in an array
    @array_of_symbols = symbols_hash.keys

    render({ :template => "currency_templates/step_one.html.erb" })
  end
end