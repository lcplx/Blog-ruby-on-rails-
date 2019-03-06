class PostsController < ApplicationController
    #add authentication except for index and show
    http_basic_authenticate_with name: "lx",password:"1234",except: [:index,:show]
    def index
      @post=Post.all
    end
    def show
      #id from URL 
      @post=Post.find(params[:id])
      #link to show view 
    end
    def new
      @post=Post.new
    end
    def create
      #render plain: params[:post].inspect
      @post=Post.new(post_params)
      if(@post.save)
        redirect_to @post
      else
        render "new"
      end
      #to create show view 
    end
    def edit
      #same as show 
       @post=Post.find(params[:id])
      
    end
    def update
      @post=Post.find(params[:id])
      if(@post.update(post_params))
        redirect_to @post
      else
        render "edit"
      end
    end
    def destroy
        @post=Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
    

    private def post_params
      params.require(:post).permit(:title,:body)
    end
end
