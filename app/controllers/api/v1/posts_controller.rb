class Api::V1::PostsController < ApplicationController
    
    def index
        render json: Post.all.reverse
    end

    def create
        post = Post.create(post_params)
        render json: post
    end

    def destroy
        Post.destroy(params[:id])
    end

    def update
        post = Post.find(params[:id])
        post.update_attributes(post_params)
        render json: post
    end

    private
    # check current user_id
    def post_params
        params.require(:post).permit(:message, :user_id)
    end

end