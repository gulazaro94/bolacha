class ItemsController < ApplicationController
  before_action :require_admin, only: [:new_rotulo, :new_bolacha, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @categories = Category.all.order(:name)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new_bolacha
    new true
  end

  def new_rotulo
    new false
  end

  def new(kind)
    @item = Item.new
    @categories = Category.all
    @item.kind = kind
    render :new
  end

  # GET /items/1/edit
  def edit
    @categories = Category.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        add_to_collection
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        @categories = Category.all
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_collection
    quantity = params[:have].to_i
    if quantity == 1
      collection = Collection.new(user_id: logged.id, item_id: @item.id, repeated: false)
      collection.save
    elsif quantity == 2
      collection = Collection.new(user_id: logged.id, item_id: @item.id, repeated: true)
      collection.save
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        @categories = Category.all
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:picture, :description, :kind, :category_id, :picture_cache)
    end
end
