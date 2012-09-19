class SubscriptionsController < ApplicationController
  before_filter :find_client

  def create
    @subscription = @client.build_subscription(params[:subscription])
    @subscription.save!

    redirect_to @client
  end

  private
    def find_client
      @client = Client.find(params[:client_id])
    end
end
