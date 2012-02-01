class CustomersController < ApplicationController
  def index
    @customers = Customer.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @customers.map(&:name)
  end
end
