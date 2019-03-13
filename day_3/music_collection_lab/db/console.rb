require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

# Artist.delete_all()
# Album.delete_all()

artist1 = Artist.new({'name' => 'Queen'})
artist2 = Artist.new({'name' => 'Blur'})
artist1.save()
artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title'=> 'The Works',
  'genre'=> 'rock'
})
album1.save()

album2 = Album.new({
  'artist_id' => artist2.id,
  'title'=> 'Parklife',
  'genre'=> 'alt-rock'
})
album2.save()

album3 = Album.new({
  'artist_id' => artist1.id,
  'title'=> 'Hot Space',
  'genre'=> 'rock'
})
album3.save()

# p Album.all()

# p Artist.all()

# p artist1.albums()

# p album2.artist()
