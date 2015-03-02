class DaysController < ApplicationController
  before_action :find_day, except: [:new, :create, :index] 

  def new
    @day = Day.new
  end

  def index
    @days = Day.all
  end

  def show

  end

  def edit
    
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      redirect_to @day.paypal_url(day_path(@day))
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def find_day
    @day = Day.find(params[:id])
  end

  def day_params
    params.require(:day).permit(:first_name, :last_name, :event, :email, :telephone, :date_of_event)
  end
end
