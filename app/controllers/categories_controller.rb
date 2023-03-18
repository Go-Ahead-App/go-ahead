# frozen_string_literal: true

# The create action creates a new category and returns a notice if the category is successfully
# created, or a list of form errors if the category is not successfully created.
class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)

    response =
      if @category.save
        { notice: 'Category was successfully created.', category: @category }
      else
        { error: @category.errors.full_messages }
      end

    render json: response
  end

  def delete; end

  private

  def category_params
    params.require(:category).permit(:name, :note_id, :user_id)
  end
end
