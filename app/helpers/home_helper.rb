module HomeHelper
  def format_date(date)
    date.strftime("%B %d, %Y")
  end

  def welcome_message
    "Welcome to Rails 7 Boilerplate!"
  end
end
