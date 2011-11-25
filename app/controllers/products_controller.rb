class ProductsController < ApplicationController
  load_and_authorize_resource

  # POST /products
  def create
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PUT /products/1
  def update
    if @product.update_attributes(params[:product])
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    flash[:notice] = @product.errors.to_a.join(", ") unless @product.destroy
    redirect_to products_url
  end

  def who_bought
    respond_to do |format|
      format.atom
    end
  end
end
