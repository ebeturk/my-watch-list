require 'net/http'

puts 'destroy existing movies'
Bookmark.destroy_all
Movie.destroy_all

puts 'now create new movies'
movies = [
  { title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7 },
  { title: "The Wild Bunch", overview: "An aging group of outlaws look for one last big score as the traditional American West is disappearing around them.", poster_url: "https://placehold.it/300x400", rating: 7.8 }, # Placeholder image and approximate rating
  { title: "12 Monkeys", overview: "In a future world devastated by disease, a convict is sent back in time to gather information about the man-made virus that wiped out most of the human population on the planet.", poster_url: "https://placehold.it/300x400", rating: 8.0 }, # Placeholder image
  { title: "Jeder für sich und Gott gegen alle", overview: "A traveling circus discovers a feral man who was raised in a pig pen. The circus tries to exploit him.", poster_url: "https://placehold.it/300x400", rating: 7.6 }, # Placeholder image and approximate rating
  { title: "The Tenant", overview: "A bureaucrat rents a Paris apartment where he finds himself drawn into a rabbit hole of dangerous paranoia.", poster_url: "https://placehold.it/300x400", rating: 7.7 }, # Placeholder image
  { title: "The Wild Child", overview: "In 1798, a feral boy is discovered outside the town of Aveyron, France.", poster_url: "https://placehold.it/300x400", rating: 7.5 }, # Placeholder image and approximate rating
  { title: "Ponyo", overview: "A five-year-old boy forms a bond with Ponyo, a young goldfish princess who wants to become human.", poster_url: "https://placehold.it/300x400", rating: 7.7 }, # Placeholder image
  { title: "Totoro", overview: "Two young girls, Satsuki and Mei, move into a house in the country with their father to be closer to their hospitalized mother and discover the surrounding trees are inhabited by magical creatures known as Totoros.", poster_url: "https://placehold.it/300x400", rating: 8.2 }, # Placeholder image and approximate rating
  { title: "Al Yazmalim", overview: "The story of a love affair between a young man and a married woman in 1940s Turkey.", poster_url: "https://placehold.it/300x400", rating: 7.4 }, # Placeholder image and approximate rating
  { title: "Kibar Feyzo", overview: "A rural man struggles against a harsh landowner in his village.", poster_url: "https://placehold.it/300x400", rating: 7.2 }, # Placeholder image and approximate rating
  { title: "Seven", overview: "Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.", poster_url: "https://placehold.it/300x400", rating: 8.6 }, # Placeholder image
  { title: "The Remains of the Day", overview: "A butler who sacrificed body and soul to service in the years leading up to World War II realizes too late how misguided his loyalty was to his lordly employer.", poster_url: "https://placehold.it/300x400", rating: 7.9 }, # Placeholder image
  { title: "Being There", overview: "A simple, sheltered gardener becomes an unlikely trusted advisor to a powerful businessman and an insider in Washington politics.", poster_url: "https://placehold.it/300x400", rating: 7.9 }, # Placeholder image
  { title: "Crimes and Misdemeanors", overview: "An ophthalmologist's mistress threatens to reveal their affair to his wife while a married documentary filmmaker is infatuated with another woman.", poster_url: "https://placehold.it/300x400", rating: 7.9 }, # Placeholder image
  { title: "Marriage Story", overview: "A stage director and his actor wife struggle through a grueling, coast-to-coast divorce that pushes them to their personal and creative extremes.", poster_url: "https://placehold.it/300x400", rating: 7.9 }, # Placeholder image
  { title: "The Squid and the Whale", overview: "Based on the true childhood experiences of Noah Baumbach and his brother, the film tells the touching story of two young boys dealing with their parents' divorce in Brooklyn in the 1980s.", poster_url: "https://placehold.it/300x400", rating: 7.3 } # Placeholder image
]

movies.each do |movie_attributes|
  Movie.create(movie_attributes)
end

url = 'https://tmdb.lewagon.com/movie/top_rated'

# Fetch data from the API
response = Net::HTTP.get(URI(url))
parsed_data = JSON.parse(response)

# Extract movie data
movies = parsed_data["results"]

# Seed the database
movies.each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
end

puts "Seeded #{Movie.count} movies!"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
