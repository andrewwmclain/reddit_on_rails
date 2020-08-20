class PicturesController < ApplicationController
    def new
        @user = current_user;
    end

    def create    
        uploader = AvatarUploader.new
        uploader.store!(params[:user][:img_url])
        @user = current_user
        @user.img_url = params[:user][:img_url]
        @user.avatar = params[:user][:img_url]
        @user.avatar = "hello";
        if @user.save
            flash.notice = "Profile picture updated!"
            redirect_to @user and return
        else 
            render :new and return
        end
    end 
end
