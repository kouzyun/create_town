class ColumnsController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@column = Column.new
  end

  def create
  	@column = Column.new(column_params)
    @column.user_id = current_user.id
    @column.save
    redirect_to columns_path
  end

  def edit
  end

  private

  def column_params
    params.require(:column).permit(:title, :body)
  end
end
