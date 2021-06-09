class PagesController < ApplicationController
  def home
  @posts = Blog.all
  @skill = SKill.all
  end

  def about
  end

  def contact
  end
end
