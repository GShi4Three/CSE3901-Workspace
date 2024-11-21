class StaticPagesController < ApplicationController
  def home
  end
  
  def help
  end
  def about
  end
  def contact
    # render html: 'My contact page' 
  end
end
