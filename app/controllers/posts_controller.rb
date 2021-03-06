class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :alltime, :week, :month, :show, :search]
	

	def index	
		@posts = Post.all.where(created_at:(Time.now - 1.day)..Time.now)
	end


	def alltime
		@posts = Post.all
	end

	def week
		@posts = Post.all.where(created_at:(Time.now - 7.day)..Time.now)
	end

	def month
		@posts = Post.all.where(created_at:(Time.now - 31.day)..Time.now)
	end

	def show
		@post = Post.find(params[:id])
		@comments = Comment.where(post_id: @post)
		@random_post = Post.where.not(id: @post).order("RANDOM()").first
	end

	# def search
	# 	binding.pry
	# end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post_params
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def upvote
		@post.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@post.downvote_by current_user
		redirect_to :back
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end
	# strong parameters
	def post_params
		params.require(:post).permit(:title, :instagram, :description, :image)
	end
end
