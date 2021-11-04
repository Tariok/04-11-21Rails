class Gossip < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :join_table_gossip_tags
  has_many :tags, through: :join_table_gossip_tags
  has_many :likes

  validates :title,
  presence: true,
  length: { minimum: 3 , maximum:14}

  validates :content,
  presence: true


  def find_author
    author_id = self.user_id.to_i
    author = User.find_by(id: author_id)
    return author
  end

  def find_all_comments(gossip_id)
    gossip_comments = Comment.joins(:gossip).where(gossips: { id: gossip_id })
  
  end

  def show
    
  end


end
