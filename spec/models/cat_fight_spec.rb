require 'rails_helper'

RSpec.describe CatFight, type: :model do
  it "is a valid cat" do
    expect(CatFight.create(name: 'Fluffy', age: 3, enjoys: 'chasing butterflies', image: 'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0c3xlbnwwfHwwfHx8MA%3D%3D')).to be_valid
  end
  it "has a valid name" do
    cat = CatFight.create(age: 3, enjoys: 'chasing butterflies', image: 'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&
    ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0c3xlbnwwfHwwfHx8MA%3D%3D')
    expect(cat.errors[:name]).to include "can't be blank"
  end
  it "has a valid age" do
    cat = CatFight.create(name: "Fluffy", enjoys: 'chasing butterflies', image: 'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&
    ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0c3xlbnwwfHwwfHx8MA%3D%3D')
    expect(cat.errors[:age]).to include "can't be blank"
  end
  it "has a valid enjoys" do
    cat = CatFight.create(name: "Fluffy", age: 3, image: 'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0c3xlbnwwfHwwfHx8MA%3D%3D')
    expect(cat.errors[:enjoys]).to include "can't be blank"
  end
  it "has a valid image" do
    cat = CatFight.create(name: "Fluffy", age: 3, enjoys: 'chasing butterflies')
    expect(cat.errors[:image]).to include "can't be blank"
  end
  it "has an enjoys attribute that is at least 10 characters" do
    cat = CatFight.create(name: "Fluffy", age: 3, enjoys: 'catnip', image: 'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0c3xlbnwwfHwwfHx8MA%3D%3D')
    expect(cat.errors[:enjoys]).to include "is too short (minimum is 10 characters)"
  end
end
