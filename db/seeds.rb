# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

URI.open("http://tmdb.lewagon.com/movie/top_rated") do |lines|
  lines.each_line do |line|
    results = JSON.parse(line)
    results["results"].each do |result|
      if result["original_language"] == 'en'
        image = "https://image.tmdb.org/t/p/original#{result["poster_path"]}"
        Movie.create(
          title: result["title"],
          rating: result["vote_average"],
          overview: result["overview"],
          poster_url: image
        )
      end
    end
  end
end
