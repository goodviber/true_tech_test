class TweetsController < ApplicationController
  before_filter :authenticate_user!
  before_action :find_tweet, only: [:destroy, :show, :edit, :update]


  def index
    @tweets = Tweet.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:success] = 'Your tweet was added!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @tweet.update_attributes(tweet_params)
      flash[:success] = 'The tweet was edited!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @tweet.destroy
      flash[:success] = 'The tweet was deleted!'
    else
      flash[:error] = 'Cannot delete this tweet...'
    end
    redirect_to root_path
  end

  def show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :body, :user_id)
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end

end
