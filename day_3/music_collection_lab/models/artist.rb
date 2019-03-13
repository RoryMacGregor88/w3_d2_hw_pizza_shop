require 'pry'
require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_reader :name, :id
  def initialize(options)
    # binding.pry
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists(name)
    VALUES($1)
    RETURNING *"
    values = [@name]
    returned_array = SqlRunner.run(sql, values)
    artist_hash = returned_array[0]
    id_string = artist_hash['id']
    @id = id_string.to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map {|hash| Artist.new(hash)}
  end

  def albums()
    sql = 'SELECT * FROM albums WHERE artist_id = $1'
    values = [@id]
    album_hashes = SqlRunner.run(sql, values)
    return album_hashes.map {|hash| Album.new(hash)}
  end

end
