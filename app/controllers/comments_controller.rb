class CommentsController < ApplicationController
    # before create and edit actions before_action method will be called to set the post instance variable
    before_action :set_post
    before_action :set_comment, only: %i[ edit update destroy ]
    

      # No `new` action because form is provided by PostsController#show
    def create
       @comment = @post.comments.create(comment_params)
      # We want to show the comment in the context of the Post
       redirect_to @post
    end

    def edit
        # @comment = Comment.find(params[:id])
    end

    def update
        # @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
        redirect_to @post, notice: 'Comment updated successfully'
        else
            render :edit
        end
    end

    def destroy
        # @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to @post, notice: 'Comment deleted successfully'
    end

    private
    def comment_params
        params.require(:comment).permit(:name, :content)
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end
    def set_post
        @post = Post.find(params[:post_id])
    end
end