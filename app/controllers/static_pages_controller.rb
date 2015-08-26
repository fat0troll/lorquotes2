class StaticPagesController < ApplicationController
  def home
    @count = Quote.passed.count
    @quotes = Quote.passed.reverse_order.paginate(:page => params[:page])
  end
end
