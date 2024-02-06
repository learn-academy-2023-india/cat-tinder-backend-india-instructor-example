require 'rails_helper'

RSpec.describe "CatFights", type: :request do
  # string of the http verb/api endpoint being tested
  describe "GET #index" do
    # test case - string of the feature/behavior being tested
    it "gets a list of cats" do
      # create an instance
      CatFight.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      # Make a request
      get '/cat_fights'

      # pulling the response.body from the JSON that is transmitted in the response
      cat = JSON.parse(response.body)
      expect(cat.length).to eq 1
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "creates a cat" do
      # The params we are going to send with the request
      cat_params = {
        cat_fight: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
  
      # Send the request to the server
      post '/cat_fights', params: cat_params
  
      # Assure that we get a success back
      expect(response).to have_http_status(200)
  
      # Look up the cat we expect to be created in the db
      cat = CatFight.first
  
      # Assure that the created cat has the correct attributes
      expect(cat.name).to eq('Buster')
      expect(cat.age).to eq(4)
      expect(cat.enjoys).to eq('Meow Mix, and plenty of sunshine.')
      expect(cat.image).to eq('https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')
    end
  end

  describe "PATCH #update" do
    it "updates a cat" do
      cat_params = {
        cat_fight: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      # create a cat
      post '/cat_fights', params: cat_params
  
      # updated cat params
      updated_cat_params = {
        cat_fight: {
          name: 'Buster Brown',
          age: 6,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      cat = CatFight.first
      patch "/cat_fights/#{cat.id}", params: updated_cat_params

      expect(response).to have_http_status(200)
  
      updated_cat = CatFight.first
      
      expect(updated_cat.name).to eq('Buster Brown')
      expect(updated_cat.age).to eq(6)
      expect(updated_cat.enjoys).to eq('Meow Mix, and plenty of sunshine.')
      expect(updated_cat.image).to eq('https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a cat' do
      # Create an article to be deleted
      cat = CatFight.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      # Make a request to delete
      delete "/cat_fights/#{cat.id}"

      expect(response).to have_http_status(:no_content)
      expect(CatFight.find_by(id: cat.id)).to be_nil

    end
  end

end
