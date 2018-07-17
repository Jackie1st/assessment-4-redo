class PostsController < ApplicationController
	before_action :find_category
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = @category.posts
	end

	def new
		@post = Post.new
	end

	def create
		 @post = @category.posts.create(post_params)
		if @post
			redirect_to category_posts_path(@category, @post)
		else
			redirect_to new_category_post_path
		end
	end

	def show
	end

	def edit 
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to category_posts_path(@category, params[:id])
		else
			redirect_to edit_category_post_path(@category, params[:id])
		end
	end

	def destroy
		@post.destroy
		redirect_to category_posts_path(@category)
	end

	private

	def post_params
		params.require(:post).permit(:title, :description, :contact, :category_id)
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def find_category
		@category = Category.find(params[:category_id])
	end

end

