class CardsController < ApplicationController
	before_filter :require_login
	
	def show
		@card = find_card
	end

	def new
		@card = deck.cards.new
	end

	def create
		@card = deck.cards.new(card_params)
		@card.save
		redirect_to deck
	end
	
	def edit
		@card = find_card
	end

	def update
		@card = find_card
		@card.update_attributes(card_params)
		redirect_to deck
	end

	def destroy
		find_card.destroy
		redirect_to deck
	end

private
def deck
		@_deck ||= current_user.decks.find(params[:deck_id]) #memozitation #underscore - instance variable that shouldn't be touched
	end

def find_card
	deck.cards.find(params[:id])
end

def card_params
	params[:card]
end

end
