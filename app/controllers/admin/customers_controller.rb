class Admin::CustomersController < Admin::BaseController
  before_filter :find_customer, :only => [:edit, :update, :destroy]
  def index
    @customers = Customer.all(:order => "created_at")
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:notice] = t("create_sucess")
      redirect_to admin_customers_path
    else
      render :action => "new"
    end
  end

  def update
    if @customer.update_attributes(params[:customer])
      flash[:notice] = t("update_sucess")
      redirect_to admin_customers_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @customer.destroy
    flash[:notice] = t("destroy_sucess")
    redirect_to admin_customers_path
  end

  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

end
