class Admin::CommentsController < Admin::ApplicationController
	before_action :authorize
  def destroy
  end
end
