class Post < ActiveRecord::Base
  before_validation :update_or_create_slug
  validates_presence_of :description, :title
  validates_uniqueness_of :title
  has_many :comments, :dependent => :destroy
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>",
      :standart => "400x400>" }
    
  def to_param
    slug
  end

  private

  def update_or_create_slug
    if self.new_record? || self.title_changed? || self.slug.blank?
      self.slug = self.title.parameterize
    end
  end
# def to_param
#    "#{id}-#{title.parameterize}"    
#     "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}" 
#  end 
end
#TODO dasdasd
