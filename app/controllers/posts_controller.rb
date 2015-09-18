class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	#display all blogs at the index fle
	def index
		@posts = Post.all.order('created_at DESC')
	end

    #to add new posts
	def new 
		@post = Post.new
	end


	def create
		@post = Post.new(post_params)

		if @post.save
          redirect_to @post
        else
        	render 'new'
        end
	end

    #displaying a blog
	def show 
		@post = Post.find(params[:id])
	end


    #code to edit and update a post
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
		   redirect_to @post
		else
			render 'edit'
		end
	end

     #parameters for a post
	private def post_params
	   params.require(:post).permit(:title, :body)
	end
end
