class ContactsController < ApplicationController
  def new
  	@categories = Category.all
  end

  def create
  end
end
