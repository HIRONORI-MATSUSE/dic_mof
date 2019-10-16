class RentalPropertiesController < ApplicationController
  before_action :set_rental_property, only: [:show, :edit, :update, :destroy]

    def index
      @rental_properties = RentalProperty.all
    end

    def new
      @rental_property = RentalProperty.new

      5.times{@rental_property.desired_conditions.build}
      #@chldren = 5 * @rental_property.desired_conditions.build
    end

    def show
    end

    def edit
    end

    def create
      @rental_property = RentalProperty.new(rental_property_params)
      # 5.times@rental_property.desired_conditions.build
      # binding.pry
        if @rental_property.save
          redirect_to rental_properties_path
        else
          render :new
        end
    end

    def update
      if @rental_property.update(rental_property_params)
        redirect_to rental_properties_path
      else
        render :edit
      end
    end

    def destroy
      @rental_property.destroy
        redirect_to rental_properties_url
    end

    private

    def set_rental_property
      @rental_property = RentalProperty.find(params[:id])
    end

    def rental_property_params
      params.require(:rental_property).permit(:property_name, :rent, :street_address, :house_age, :remarks, desired_conditions_attributes: [:id, :route_name, :station_name, :walking_minutes])
    end
  end
