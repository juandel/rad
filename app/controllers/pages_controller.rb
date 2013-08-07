class PagesController < ApplicationController
  def index
    @works = Work.all
  end  

  def work
  end
  
  def info
  end
  
  def contact
  end

end
