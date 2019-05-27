require 'oauth2'
class OauthController < ApplicationController
  def authenticate
    redirect_to client.auth_code.authorize_url(:redirect_uri => redirect_uri)
  end

  def callback
    access_token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri)
    session[:access_token] = access_token.token
    @message = "Successfully authenticated with the server"
    redirect_to pictures_path
  end

  def tweet
    picture = Picture.find(params[:id])
    tweet_url = "#{Rails.application.credentials.api_url}/api/tweets"
    access_token = OAuth2::AccessToken.new(client, session[:access_token])
    pp access_token.post(tweet_url, {body: {:text => picture.title, :url => picture.image_url}})
    redirect_to pictures_path
  end

  def redirect_uri
    'http://localhost:3000/oauth/callback'
  end

  def client
    client_id = Rails.application.credentials.client_id
    client_secret = Rails.application.credentials.client_secret
    OAuth2::Client.new(client_id, client_secret, :site => Rails.application.credentials.api_url)
  end
end
