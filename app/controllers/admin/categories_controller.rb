class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    binding.pry
    @category = Category.new(category_params)
    if @category.save
      response = Faraday.get('http://api.giphy.com/v1/gifs/translate?s=#{category_params}&api_key=dc6zaTOxFJmzC')
      data = JSON.parse(response.body)
      url = data["data"][1]["embed_url"]

      @gif = Category.gifs.create(url)

      redirect_to category_path(@category)
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
