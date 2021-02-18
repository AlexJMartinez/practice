class CommentsController < ApplicationController

      def index
        @comment = Comment.all
      end

      def create        
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.new(comment_params)
        @comment.user = current_user            
        if @comment.save
            redirect_to user_photo_path(@photo.user, @photo)
        else
            @comment.errors.full_messages
            render :'photos/show'
        end
      end

      def destroy
        Comment.find(params[:id]).destroy
        redirect_to home_path
      end

      private

      def comment_params
        params.require(:comment).permit(:content, :user_id, :photo_id)
      end

end
