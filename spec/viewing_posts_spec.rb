require 'posts'
describe Posts do
  describe '.all' do
    it 'returns all posts' do
      posts = Posts.all

      expect(posts).to include ("post1")
      expect(posts).to include ("post2")
    end
  end
end
