require 'pry'
class Blog
	def initialize
		@posts = []
	end

	def getPost (post)
		#binding.pry
		@posts.push(post)
	end

	def publish_front_page
		@posts.each do |post|
			post.printPost
		end
	end

end


class Post
	attr_reader :title, :text, :date

	def initialize (title, text)
		@title = title
		@text = text
		@date = Time.now()
	end

	def printPost
			puts "·"
			puts @title
			30.times{print"*"}
			puts ""
			puts @text
			30.times{print"_"}
			puts ""
			puts ""
	end

end


class SponsoredPost < Post
	def initialize (title, text)
		super(title, text)
	end

	def printPost
			puts "·"
			6.times{print"*"}
			#binding.pry
			print @title
			6.times{print"*"}
			puts ""
			30.times{print"*"}
			puts ""
			puts @text
			30.times{print"_"}
			puts ""
			puts ""
	end

end



post1 = Post.new("Post 1", "Texto post 1")
post2 = SponsoredPost.new("Post 2", "Texto post 2")
post3 = Post.new("Post 3", "Texto post 3")

my_blog = Blog.new
my_blog.getPost(post1)
my_blog.getPost(post2)
my_blog.getPost(post3)

my_blog.publish_front_page