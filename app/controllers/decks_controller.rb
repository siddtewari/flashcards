class DecksController < ApplicationController
	before_filter :require_login

	def index
		@decks = current_user.decks
	end

	def new
		@deck = decks.new
	end

	def create
		@deck = decks.new(params[:deck])
		@deck.save
		redirect_to decks_path
	end

	def show
		@deck = decks.find(params[:id])
	end

	def edit
		@deck = decks.find(params[:id])
	end

	def update 
		@deck = decks.find(params[:id])
		@deck.update_attributes(params[:deck])
		redirect_to @deck
	end

	def destroy
		@deck = decks.find(params[:id])
		@deck.destroy
		redirect_to decks_path
	end

private

def decks
	current_user.decks
end


end 
