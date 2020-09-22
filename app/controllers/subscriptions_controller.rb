class SubscriptionsController < ApplicationController
  def index
    @subscriptions = current_user.subscriptions
    @subscription = Subscription.new
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    if @subscription.save
      redirect_to subscriptions_path
    else
      render :new
    end
  end

  def edit
    @subscription = Subscription.find(params[:id])
  end

  def update
    @subscription = Subscription.find(params[:id])
    @subscription.update(subscription_params)
    redirect_to subscription_path(@subscription)
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_to subscriptions_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :start_date, :billing_frequency)
  end
end
