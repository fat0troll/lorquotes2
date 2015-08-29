class MessagesController < ApplicationController
  def index
    @messages = Message.approved.reverse_order.paginate(:page => params[:page])
    @message = Message.new()
  end

  def create
    @message = Message.new(model_params)
    if user_signed_in?
      @message.author = current_user
    end
    @message.useragent = request.user_agent
    if @message.save
      flash[:success] = I18n.t 'message.messages.success'
      redirect_to messages_path
    else
      redirect_to messages_path
    end
  end

  def destroy
    if user_signed_in?
      if current_user.moderator
        @message = Message.find(params[:id])
        @message.toggle!(:approved)
        flash[:success] = I18n.t 'message.messages.destroyed'
      end
    end
    redirect_to messages_path
  end


  def model_params
    params.require(:message).permit(:text)
  end
end
