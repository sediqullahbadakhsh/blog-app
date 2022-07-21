module Api
    module V1
         class ApiController < ApplicationController
            def user_posts
                user_id = params[:user_id]
                posts = Post.where(user_id: user_id)
                render json: {status: 'SUCCESS', message: 'Loaded Posts', data: posts}, status: :ok
            end
            def user_comments
                post_id = params[:post_id]
                comments = Comment.where(post_id: post_id)
                render json: {status: 'SUCCESS', message: 'Loaded Posts', data: comments}, status: :ok
            end
        end
    end
end
