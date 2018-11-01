require 'pg'
class Posts
  def self.all
  connection = PG.connect(dbname: 'posts')
  result = connection.exec("SELECT * FROM messages;")
  result.map {|message| message['message']}
  end
end
