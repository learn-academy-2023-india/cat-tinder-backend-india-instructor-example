# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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

cats.each do |each_cat|
  CatFight.create each_cat
  puts "creating cat #{each_cat}"
end
