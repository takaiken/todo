class LikesController < ApplicationController

	protect_from_forgery

	def create 
		@likes = current_user.likes.create(params[:task_id])
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@like = Like.find_by(task_id: params[:task_id], user_id: current_user.id)
		@like.destroy
		redirect_back(fallback_location: root_path)
	end

	def task_params
  	params.require(:task).permit(:title, :description, :image)
    end

end
