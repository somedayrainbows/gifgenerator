class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
  end

  def create
    @name = params[:category][:name]
    response = Faraday.get("http://api.giphy.com/v1/gifs/translate?s=#{@name}&api_key=dc6zaTOxFJmzC")
    data = JSON.parse(response.body)
    # binding.pry
    url = data["data"]["embed_url"]

    @category = Category.find_or_initialize_by(category_params)
    
    if @category.save
      @category.gifs.create(image_path: url)
     redirect_to category_path(@category)
    else
      flash[:error] = "Try again!"
      render :new
    end
  end

  def destroy
    @category = Category.find_by(params[:id])
    @category.destroy
    redirect_to new_admin_category_path

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
