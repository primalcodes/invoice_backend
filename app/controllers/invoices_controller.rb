class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update, :destroy]

  # GET /invoices
  def index
    @invoices = Invoice.all

    render json: @invoices
  end

  # GET /invoices/1
  def show
    render json: @invoice
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render json: @invoice, status: :created, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invoices/1
  def update
    if @invoice.update(invoice_params)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(
        :payment_due, :description, :payment_terms,
        :client_name, :email, :status, :total,
        sender_address_attributes: [ :street, :city, :post_code, :country ],
        client_address_attributes: [ :street, :city, :post_code, :country ]
      )
    end
end
