class ShareablesController < ApplicationController
	before_action :find_shareable, only: [:show, :edit, :update, :destroy]

	def index
		@shareables = Shareable.all
	end

	def show
		@shareable = Shareable.find(params[:id])
	end

	def new
		@shareable = Shareable.new
	end

	def create
		@shareable = Shareable.new(shareable_params)

		if @shareable.save
			redirect_to @shareable, notice: "Je hebt een nieuw product toegevoegd!"
		else
			render 'new'
		end
	end

	def edit
		 @shareable = Shareable.find(params[:id])
	end

	def update
		if @shareable.update(shareable_params)
			redirect_to @shareable, notice: "Shareable is met succes aangepast!"
		else
			render 'edit'
		end
	end

	def destroy
		@shareable.destroy
		redirect_to shareables_path
	end

	private

	def shareable_params
		params.require(:shareable).permit(:title, :text, :image)
	end

	def find_shareable
		@shareable = Shareable.find(params[:id])
	end
end