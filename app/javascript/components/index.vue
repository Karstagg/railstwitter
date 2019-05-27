<template>
    <div>
        <h1>test</h1>
        <ul v-for="tweet in allTweets">
            <li>内容：　{{tweet.content}}</li>
        </ul>
    </div>
</template>

<script>
    import gql from 'graphql-tag'

    const TWEET_QUERY = gql`
{
  allTweets {
    id
  }
}`;

    export default {
        name: 'index',
        data () {
            return {
                allTweets: []
            }
        },
        apollo: {
            allTweets: {
                query:TWEET_QUERY
            }
        }
    }

</script>