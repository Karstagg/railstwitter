module Types
  class MutationType < BaseObject
    field :create_tweet, mutation: Mutations::CreateTweet
  end
end