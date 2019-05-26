require 'test_helper'

class Mutations::CreateTweetTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateTweet.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new tweet' do
    tweet = perform(
       content: "hi",
        )

    assert tweet.persisted?
    assert_equal tweet.content, 'hi'
  end
end