class Tag < ActiveRecord::Base
  belongs_to :taggable, :polymorphic => true

  attr_accessible :name, :taggable_type, :taggable_id

end