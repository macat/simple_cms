class PublicController < ApplicationController
  
  layout 'public'

  before_action :setup_navigation
  def index
  	@subjects = Subject.visible.sorted
  	# intro text
  end

  def show
  	@page = Page.where(:permalink => params[:permalink], :visible => true).first
  	if @page.nil?
  		redirect_to(:action => 'index')
  	else
  		# display page content using show.html.erb
  	end
  end

  private

  	def setup_navigation
  		@subjects = Subject.visible.sorted
  	end
end
