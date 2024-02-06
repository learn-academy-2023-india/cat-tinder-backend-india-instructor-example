require 'rails_helper'

RSpec.describe "CatFights", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      # create a new cat in the test database
      CatFight.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      # make a request to the cat index endpoint
      get '/cat_fights'

      cat = JSON.parse(response.body)
      expect(cat.length).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      # cat params to send with the post request
      cat_params = {
        cat_fight: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
  
      # make a request to the cat create endpoint
      post '/cat_fights', params: cat_params
  
      expect(response).to have_http_status(200)
  
      # look up the cat we expect to be created in the db
      cat = CatFight.first
  
      # assure the cat has the correct attributes
      expect(cat.name).to eq('Buster')
      expect(cat.age).to eq(4)
      expect(cat.enjoys).to eq('Meow Mix, and plenty of sunshine.')
      expect(cat.image).to eq('https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')
    end
    it 'returns a 422 status code' do
      invalid_cat_params = {
        cat_fight: {
          name: nil,
          age: nil,
          enjoys: nil,
          image: nil
        }
      }

      post '/cat_fights', params: invalid_cat_params
      expect(response).to have_http_status(422)
    end
  end

  describe "PATCH /update" do
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
      # make a request to the cat update endpoint
      patch "/cat_fights/#{cat.id}", params: updated_cat_params

      expect(response).to have_http_status(200)
  
      updated_cat = CatFight.first
      
      expect(updated_cat.name).to eq('Buster Brown')
      expect(updated_cat.age).to eq(6)
      expect(updated_cat.enjoys).to eq('Meow Mix, and plenty of sunshine.')
      expect(updated_cat.image).to eq('https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')
    end
    it 'returns a 422 status code' do
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

      invalid_cat_params = {
        cat_fight: {
          name: nil,
          age: nil,
          enjoys: nil,
          image: nil
        }
      }

      cat = CatFight.first
      patch "/cat_fights/#{cat.id}", params: invalid_cat_params

      expect(response).to have_http_status(422)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a cat' do
      cat = CatFight.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      # make a request to the cat delete endpoint
      delete "/cat_fights/#{cat.id}"

      expect(response).to have_http_status(:no_content)
      expect(CatFight.find_by(id: cat.id)).to be_nil
    end
  end

end
