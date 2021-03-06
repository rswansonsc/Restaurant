class ReservationsController < ApplicationController
  before_filter :find_reservation, only: [:show, :edit, :update, :destroy]
    

  def new
    reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new reservation_params
    if @reservation.save
        flash[:notice]= "Reservation added OK."
        redirect_to root_path
    else
        flash[:error]= "Error adding Reservation!"
        render :new
    end
  end

  def edit
  end

  def update
    if @reservation.update_attributes reservation_params
        flash[:notice] = "Reservation successfully updated"
        redirect_to root_path
    else
        flash[:error] = "Need to enter more information"
        render :edit    
    end
  end

  def destroy
    @reservation.delete
    redirect_to root_path
  end

  def show
  end


  private
    def find_reservation
      @reservation = Reservation.find params[:id]
    end

    def reservation_params
      params.require(:reservation).permit(:patron_id, :table_id, :no_of_people, :reservation_date)
    end


  

end
