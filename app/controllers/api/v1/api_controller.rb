module Api
    module v1
        class ApiController < ApplicationController
            def index
                @posts = Posts.order('created_at DESC');
                render json: {status:'SUCCESS', message: 'Loaded Posts', data:posts}, status:ok 
            end
        end
    end
end
