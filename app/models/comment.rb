class Comment < ActiveRecord::Base
  belongs_to :post
  @approved = false
end
