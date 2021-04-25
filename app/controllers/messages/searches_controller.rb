class Messages::SearchesController < ApplicationController
	def index
	 @tasks = Task.where('title LIKE(?)', "%#{params[:title]}%")
	 respond_to do |format|
			format.html { redirect_to :root }
			format.json { render json: @task }
		end
	end

end