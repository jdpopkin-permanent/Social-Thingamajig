class Link < ActiveRecord::Base
  attr_accessible :post_id, :url

  belongs_to  :post,
              class_name: "Post",
              primary_key: :id,
              foreign_key: :post_id
end
