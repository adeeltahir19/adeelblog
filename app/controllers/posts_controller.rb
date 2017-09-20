class PostsController < ApplicationController

	def index
		@posts = Post.all
	end
	def new
		@post = Post.new
		@category = Category.all
	end
	def create
		@post = Post.create(allowed_params)
		if @post.save
			flash[:notice] = "post is saved successfully"
			redirect_to posts_path
			
		else
			render "new"
		end

	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(allowed_params)
			flash[:notice] = "Post is updated"
			redirect_to post_path
		else
			render "edit"
		end
	end
	def show
		@post = Post.find(params[:id])
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
		flash[:notice] = "Post is deleted"
	end

	def allowed_params
  		params.require(:post).permit(:title, :body, :category_id )
	end 
end
