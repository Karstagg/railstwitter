module Types
  class QueryType < BaseObject


    # queries are just represented as fields

    field :all_tweets, [TweetType], null: false
    field :all_users, [UserType], null: false
    field :all_follows, [FollowType], null: false

    # this method is invoked, when `all_link` fields is being resolved
    def all_tweets
      Tweet.all
    end
    def all_users
      User.all
    end
    def all_follows
      Follow.all
    end
  end
end
