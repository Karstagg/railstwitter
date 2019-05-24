module Types
  class TweetType < BaseObject
    field :id, ID, null: false
    field :content, String, null: false
  end
end