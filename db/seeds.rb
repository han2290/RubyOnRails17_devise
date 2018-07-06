# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = ["Horror", "Thriller", "Action", "Drama", "Comedy", "Romance", "SF",
            "Adventure"]

images = %w(
            http://img.theqoo.net/img/XjAGG.jpg 
            http://2runzzal.com/uploads/zpicture/thum/e150c4d3a4da91864c3a37ae5a14518b9bc78247d1e315120ae5d5d33df97b3f.jpg 
            http://2runzzal.com/uploads/zpicture/thum/177603e13dd9dc74d4dacb7c5ac6f0007b5c0568aada739ea1440ed7ff3c57db.jpg 
            http://2runzzal.com/uploads/zpicture/thum/b40ab437cf2ce4953924306a378a2ab358729e17abda0412ce20a6c9df7fedec.jpg 
            http://2runzzal.com/uploads/zpicture/thum/c78b7afeffc044740440344ae25084bc5174e08c0f9413701c77fa5fcfb877bf.jpg 
            http://2runzzal.com/uploads/zpicture/thum/b06cc775007296e01e444c99fae78b651c13541a46e80fbb75aa9e1454ab267e.jpg 
            http://2runzzal.com/uploads/zpicture/thum/8c92f1c51a0db9d99ad22276ecd07672099036771ded5962276ec2da9f559502.jpg 
            http://2runzzal.com/uploads/zpicture/thum/d1d071d9d69926ce7b545c69bd1958f8b4c452c72a844c1e740ed0115f35a4b6.JPG 
            http://2runzzal.com/uploads/zpicture/thum/7e2c269788fc2f36a7d62f1dca34fe8edaf480cad1a9732315e23d95ff1b7796.jpg
        )
30.times do
   Movie.create(title: Faker::HeyArnold.character, genre: genres.sample, 
            actor: Faker::FunnyName.name, remote_image_path_url: images.sample, 
            director: Faker::OnePiece.character,description: Faker::WorldOfWarcraft.quote, user_id: 1) 
end
