class PhotosController < ApplicationController

   
    def index
        redirect_if_not_logged_in
        @photos = Photo.all
        @photos_latest = Photo.most_recent  
      end

      def new
        if helpers.logged_in?
          @photo = Photo.new
        else
          redirect_to signup_path, notice: "Please signup!"
        end
      end

      def show
        @photo = Photo.find(params[:id])
        @comment = @photo.comments.build
      end

      def create
        @photo = Photo.new(photo_params)
        @photo.user = helpers.current_user
        if @photo.save
            redirect_to photos_path
        else
            @photo.errors.full_messages
            render 'new'
        end
      end

      def edit
        @photo = Photo.find(params[:id])
      end

      def update
        @photo = Photo.find(params[:id])
        if @photo.user == helpers.current_user
           @photo.update(photo_params)
           redirect_to user_photo_path(@photo.user)
          else
           @photo.errors.full_messages
           render 'edit'
          end
      end

      def destroy
        @photo = Photo.find(params[:id])
        @photo.comments.delete_all
        Photo.find(params[:id]).destroy
        redirect_to photos_path
      end

      private

      def photo_params
        params.require(:photo).permit(:title, :url, :user_id)
      end

      
      

end
