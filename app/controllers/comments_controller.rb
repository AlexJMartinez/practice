class CommentsController < ApplicationController

    def index
        @comment = Comment.all
      end

      def new
        @comment = Comment.new
        
      end

      def show
        @comment = Comment.find(params[:id])
      end

      def create
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.create(comment_params)        
        @comment.user = current_user
     
        if @comment.save
            redirect_to user_photo_path(@photo.user, @photo)
        else
            @comment.errors.full_messages
            render :'photos/show'
        end
      end

      def edit
        @comment = Comment.find(params[:id])
      end

      def update
        @comment = Comment.find(params[:id])
        if @comment == @comment.helpers.current_user
           @comment.update(comment_params)
                                          #  This lines path is incorrect
           redirect_to photo_path(@comment)
          else
           @comment.errors.full_messages
           render 'edit'
          end
      end

      def destroy
        Comment.find(params[:id]).destroy
        redirect_to home_path
      end

      private

      def comment_params
        params.require(:comment).permit(:content)
      end

end
