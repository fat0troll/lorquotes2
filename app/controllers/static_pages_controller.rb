class StaticPagesController < ApplicationController
  def home
    @count = Quote.passed.count
    @quotes = Quote.passed.reverse_order.paginate(:page => params[:page])
  end

  def stats
    @stats = Quote.passed.group(:author).distinct.count(:id).sort_by {|k, v| -v }.paginate(:page => params[:page])
  end

  def about
  end
end
