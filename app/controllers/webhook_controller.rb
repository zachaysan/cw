class WebhookController < ApplicaitonController
  respond_to :json

  def index
    respond_with({index: true})
  end
  
  def create
    @webhook = Webhook.new(params[:webhook])
  end

end
