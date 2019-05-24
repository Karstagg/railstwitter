module Mutations
  class CreateTweet < BaseMutation
    # arguments passed to the `resolved` method
    argument :content, String, required: true

    # return type from the mutation
    type Types::TweetType

    def resolve(content: nil)
      Tweet.create!(
          content: content
          )
    end
  end
end