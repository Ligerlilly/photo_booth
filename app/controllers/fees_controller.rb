class FeesController < ApplicationController
	before_action :find_fee, except: [:new, :create, :index]
	before_action :admin?, except: :show
	def show
		
	end

	def edit
		
	end

	def new
		@fee = Fee.new
	end

	def index
		@fees = Fee.all
	end


	def create
		@fee = Fee.new(fee_params)
		respond_to do |format|
			if @fee.save
				format.html { redirect_to fee_path(@fee) }
				format.json { head :no_content }
			else 
				format.html { render action: 'new' }
				format.json { render json: @fee.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @fee.update(fee_params)
				format.html { redirect_to fee_path(@fee) }
				format.json { head :no_content }
		  else
		  	format.html { render action: 'edit' }
		  	format.json { render json: @fee.errors, status: :unprocessable_entity }
		  end
		end
	end

	def destroy
		@fee.destroy
		respond_to do |format|
			format.html { redirect_to galleries_path, alert: 'Fee destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def find_fee
		@fee = Fee.find(params[:id])
	end

	def fee_params
		params.require(:fee).permit(:title, :content)
	end
end
