class Recipe
  include HTTParty
  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: key_value, fields: 'image_url, source_url, f2f_url, title, publisher,
                         publisher_url, social_rank, ingredients', q: 'search'
  format :json

  def self.for(term)
    response = get('/search', query: { q: term })
    return response.parsed_response['recipes']
  end
end
