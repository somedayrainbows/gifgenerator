class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_admin_category_gif_path(@category.id)
    else
      flash[:error] = "Try again!"
      render :new
    end
  end

  private

  def category_params
    require.params(:category).permit(:name)
  end
end
