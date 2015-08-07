require 'httparty'

class InstagramsController < ApplicationController
  before_action :require_login, only: [:create]

  CALLBACK_URL = "http://localhost:3000/auth/instagram/callback"
  INSTAGRAM_URI = "https://api.instagram.com/v1/users/"

  def search
    if params[:instagram].present?
      instagram_search = params[:instagram][:username]
      response = HTTParty.get(INSTAGRAM_URI + "search?q=#{instagram_search}&client_id=#{ENV["INSTAGRAM_ID"]}")

      @users = response["data"]

      return render "feeds/search"
    end

  def create
    @instagram_person = Instagram.new(create_ig_params)
    @person = @instagram_person.username
    @instagram_person.users << User.find(session[:user_id])

    if @instagram_person.save
      redirect_to root_path(@person), flash: { alert: MESSAGES[:following_person] }
    else
      render "feeds/search", flash: { error: MESSAGES[:follow_error] }
    end
    redirect_to search_path
    # add flash: no search results were found for 'username'
  end

  private

  def instagram_params
    params.require(:instagram).permit(:username, :provider_id)
  end

end
