class Item < ActiveRecord::Base
  belongs_to :category

  mount_uploader :picture, ItemPictureUploader

  validates_presence_of :picture, :category_id

  def kind_str
    kind ? 'Bolacha' : 'Rótulo'
  end

  def description_str
    description? ? description : '<br>Sem descrição'.html_safe
  end
end