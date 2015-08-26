class QuotesController < ApplicationController
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

  def model_params
    params.require(:quote).permit(:trivia, :author, :writedate, :link)
  end
end
