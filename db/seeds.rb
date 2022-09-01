# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Product.create(
    name: FFaker::Product.product_name,
    model: FFaker::Product.model,
    brand: FFaker::Product.brand,
    photo_url: FFaker::Image.url("400x300"),
    description: FFaker::LoremPL.paragraphs(2).join("\n"),
    price: (rand(10_000).to_f / 100 + 10),
    active: true,
  )
end
