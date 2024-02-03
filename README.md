## Cat Tinder Backend 2/2/24 Indica

### Main branch
1. Read Trello card/place in the appropriate swimming lane, team members join the card

2. Create empty github repo

3. Create the rails app

4. Connect the empty github repo and rails app

5. Start the server

6. Make the initial commit

7. Ping the instructor and ask for branch protections

8. Ensure the trello card is in its appropriate swimming lane

9. Respond according to the instructors emoji

10. Perform github/git hygiene

### Backend-structure
[Cat Tinder API Intro](https://github.com/learn-academy-2023-india/syllabus/blob/main/cat-tinder/backend/api-intro.md)  

#### As a developer, I can create a RSpec testing suite in my Rails application.
- rspec gem and install added on the main branch

#### As a developer, I can add a resource for Cat that has a name, an age, what the cat enjoys doing, and an image.
- rails g resource CatFight name:string age:integer enjoys:text image:text
- rails db:migrate

#### As a developer, I can add cat seeds to the `seeds.rb` file.

[Seeds](https://github.com/learn-academy-2023-india/syllabus/blob/main/cat-tinder/backend/seeds.md)

Instead of scaffolding data entries in the rails console, 
`> CatFight.create(name: 'Jack', age: 5, enjoys: 'Furrrrociously hunting bugs.', image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80')`  

We will now use the seeds file to create some mock data for the application.

a) Create an array with objects that have the expected key:value pairs for each instance. 
```rb
cats = [
  {
    name: 'Clawdzilla',
    age: 2,
    enjoys: 'Climb in, on, and around cardboard boxes',
    image: 'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y2F0JTIwZmlnaHR8ZW58MHx8MHx8fDA%3D'
  },
  {
    name: 'Thunderpaws',
    age: 12,
    enjoys: 'Racing around the house for no apparent reason',
    image: 'https://images.unsplash.com/photo-1503362516536-635096dd5a80?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNhdCUyMGZpZ2h0fGVufDB8fDB8fHww'
  },
  {
    name: 'The Litterbox Legend',
    age: 5,
    enjoys: 'Sitting on computer keyboards',
    image: 'https://images.unsplash.com/photo-1571566882372-1598d88abd90?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNhdCUyMGZpZ2h0fGVufDB8fDB8fHww'
  }
]
```

c) Iterate across the cats array and create a new instance that will be saved to the database
```rb
cats.each do |each_cat|
  CatFight.create each_cat
  puts "creating cat #{each_cat}"
end
```

d) Seed the database (creating mock instances for the database)
- `$ rails db:seed`  
```bash
## print out to the console after running the seed command
creating cat {:name=>"Clawdzilla", :age=>2, :enjoys=>"Climb in, on, and around cardboard boxes", :image=>"https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y2F0JTIwZmlnaHR8ZW58MHx8MHx8fDA%3D"}
creating cat {:name=>"Thunderpaws", :age=>12, :enjoys=>"Racing around the house for no apparent reason", :image=>"https://images.unsplash.com/photo-1503362516536-635096dd5a80?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNhdCUyMGZpZ2h0fGVufDB8fDB8fHww"}
creating cat {:name=>"The Litterbox Legend", :age=>5, :enjoys=>"Sitting on computer keyboards", :image=>"https://images.unsplash.com/photo-1571566882372-1598d88abd90?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNhdCUyMGZpZ2h0fGVufDB8fDB8fHww"}
```

## CORS stands for Cross-Origin Resource Sharing  
[CORS](https://github.com/learn-academy-2023-india/syllabus/blob/main/cat-tinder/backend/api-cors.md)  
a) Disable the authenticity token  
b) Add the racks-cors gem to the Gemfile and run `$ bundle`
c) Create a cors.rb file and add code indicated in the syllabus. This code allows an external application to perform CRUD actions by referencing the applicable http verbs.  

## Endpoints
[Endpoints](https://github.com/learn-academy-2023-india/syllabus/blob/main/cat-tinder/backend/api-endpoints.md)

### index
a) Write a failing test  
```rb
# string of the http verb/api endpoint being tested
  describe "GET /index" do
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
      # asserting that there is only one value 
      expect(cat.length).to eq 1
      # checking status code -> https://http.cat/
      expect(response).to have_http_status(200)
    end
  end
```
b) See it fail: `$ rspec spec/requests/cat_fights_spec.rb` 
c) Add the code to the test pass
d) See it pass: `$ rspec spec/requests/cat_fights_spec.rb`

### create
```rb
  # http verb/ API endpoint
  describe "POST /create" do
    # testing behavior
    it "creates a cat" do
      # The params we are going to send with the request
      cat_params = {
        # make sure the model name is referenced
        cat_fight: {
          # key:value pairs expected for the instance
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
  
      # Send the request to the server with the params
      post '/cat_fights', params: cat_params
  
      # Assure that we get a success back
      expect(response).to have_http_status(200)
  
      # Look up the cat we expect to be created in the db
      cat = CatFight.first
  
      # Assure that the created cat has the correct attributes
      expect(cat.name).to eq 'Buster'
      expect(cat.age).to eq 4
    end
  end
```