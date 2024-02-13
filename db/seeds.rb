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
  },
  {
    name: 'Raisins',
    age: 7,
    enjoys: 'being queen of the dogs',
    image: 'https://images.unsplash.com/photo-1533743983669-94fa5c4338ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1092&q=80'
  }
]

cats.each do |each_cat|
  CatFight.create each_cat
  puts "creating cat #{each_cat}"
end
