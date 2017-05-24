class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end


  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end

  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to root_path, notice:"ツイート！！"
    else
      render 'new',notice:"あかんエラーや原因は自分で考えや"
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
   @tweet = Tweet.find(params[:id])
   if @tweet.update(tweets_params) 
     redirect_to root_path
   else
     render'edit',notice:"あかんエラーや原因は自分で考えや"
   end
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)  
    render :new if @tweet.invalid?
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path ,notice:"削除しました！"
  end
  
  private
  def tweets_params
    params.require(:tweet).permit(:content)
  end
  
  def set_blog
    @tweets = Tweet.find(params[:id])
  end  
  
end
