namespace :fort do
  desc 'Import fortunki for testing purposes'
  task :import => :environment do
    @fortfile = ENV['FORTUNE_FILE']
    @quotes = IO.read(@fortfile).split("\n%\n")
    @quotes.each do |quote|
      trivia = quote.split("\n--")[0]
      author = quote.split("\n--")[1].split("(li")[0]
      # all other info isn't available in fortunka. We use this just as lorem ipsum, not as an actual importer
      q = Quote.new(:trivia => trivia, :author => author, :link => 'https://www.linux.org.ru', :writedate => DateTime.now(), :approver_id => 1)
      q.save!
      q.approve
    end
  end
end
