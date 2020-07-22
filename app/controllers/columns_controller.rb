class ColumnsController < ApplicationController
  def index
  	@columns = Column.all.page(params[:page]).order(created_at: :desc)
  end

  def show
  	@column = Column.find(params[:id])
  end

  def new
  	@column = Column.new
  end

  def create
  	@column = Column.new(column_params)
    @column.user_id = current_user.id
    if @column.save
      redirect_to column_path(@column.id)
    else
      render 'new'
    end
  end

  def edit
  	@column = Column.find(params[:id])
  end

  def update
  	@column = Column.find(params[:id])
    if @column.update(column_params)
      redirect_to column_path(column.id)
    else
      render 'edit'
    end
  end

  def destroy
  	column = Column.find(params[:id])
    column.destroy
    redirect_to columns_path
  end

  def search
    @columns = Column.search(params[:search])
    @columns = @columns.page(params[:page])
  end

  private

  def column_params
    params.require(:column).permit(:title, :body, :column_image)
  end
end
