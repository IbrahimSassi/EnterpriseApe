class Invoices::PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new

  @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create

    @invoice = Invoice.find(params[:invoice_id])

    @purchase = Purchase.new(purchase_params)
    @purchase.invoice = @invoice

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @invoice, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.find(params[:id])
    title = @purchase.name

    if @purchase.destroy
      flash[:notice] = " #{title} Was Deleted Successfully . "
    redirect_to @invoice
      else
      flash[:error] = "There was an error deleting the purchase !!"
    render :show
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:name, :category, :quantity, :invoice_id, :price)
    end
end
