class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.create(category_params)
		if @category.save
			redirect_to categories_path
		else
			redirect_to new_category_path
		end
	end

	def show
	end

	def edit
	end

	def update
		if @categories.update_attributes(category_params)
			redirect_to category_path(@categories)
		else
			redirect_to edit_category_path(params[:id])
		end
	end

	def destroy
		@category.destroy
		redirect_to categories_path
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

	def set_category
		@category = Category.find(params[:id])
	end


end