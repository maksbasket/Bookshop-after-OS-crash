class CommentsController < ApplicationController
  load_resource :product
  load_and_authorize_resource :through => :product

  def create
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.html do
        if @comment.id
          redirect_to product_path(@product)
        else
          render :new
        end
      end
      format.js
    end
  end

end
