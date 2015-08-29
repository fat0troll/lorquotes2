class QuotesController < ApplicationController
  before_filter :check_moder, :except => [:by_author, :awaiting, :index, :show, :create, :new]

  def check_moder
    if user_signed_in?
      unless current_user.moderator
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end


  def by_author
    @author = params[:author]
    @quotes = Quote.passed.where(:author => @author).reverse_order.paginate(:page => params[:page])
    @count = @quotes.count
  end

  def awaiting
    @title = I18n.t 'strings.awaiting.title'
    @count = Quote.awaiting.count
    @quotes = Quote.awaiting.reverse_order.paginate(:page => params[:page])
  end

  def bioreactor_index
      @title = I18n.t 'strings.bioreactor.title'
      @quotes = Quote.deleted.reverse_order.last(64)
  end

  def index
    redirect_to root_path
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(model_params)
    if @quote.save
      flash[:success] = I18n.t 'quote.messages.success'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(model_params)
      flash[:success] = I18n.t 'quote.messages.edit_success'
      redirect_to awaiting_quotes_path
    else
      render 'edit'
    end
  end

  def approve
    @quote = Quote.find(params[:id])
    @quote.approve
    @quote.approver = current_user
    @quote.save
    flash[:success] = I18n.t 'quote.messages.approve_success'
    redirect_to root_path
  end

  def bioreactor_edit
    @quote = Quote.find(params[:id])
  end

  def bioreactor_update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(model_params)
      @quote.bioreactor
      @quote.approver = current_user
      @quote.save
      flash[:success] = I18n.t 'quote.messages.bioreactor_success'
      redirect_to awaiting_quotes_path
    else
      render 'bioreactor_edit'
    end
  end

  def model_params
    params.require(:quote).permit(:trivia, :author, :writedate, :link, :bioreactor_reason)
  end
end
