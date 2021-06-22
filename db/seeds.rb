martin = User.create(name: "Martin", email: "martin@martin.com", password: "password")
apple = User.create(name: "Apple", email: "apple@martin.com", password: "password")


nyc = Country.create(countries_name: "NYC")
france = Country.create(countries_name: "Medoc")

a = Post.create(title: "New York City is cool", content: "4th of July", user_id: martin.id, country_id: nyc.id)
b = Post.create(title: "Medoc, France is cool", content: "Medoc Marathon", user_id: apple.id, country_id: france.id)
c = Post.create(title: "Toronto, Canada is cool", content: "CNY", user_id: martin.id, country_id: france.id)
