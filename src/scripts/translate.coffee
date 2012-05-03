# Allows Karmabot to translate things into other languages
#

module.exports = (robot) ->

  # Robots can read the feeds for new, top, controversial or hot
  robot.lurk 'new', (story) ->

    # Particpate in the discussion
    story.upvote 'This is an optional top level comment'
    story.downvote 'This is an optional top level comment'
    story.save()
    story.comment "This is a really cool story bro"
    story.flag 'This is an optional top level comment'

    # And moderate if you like
    story.spam
    story.remove
    story.approve
    story.flag 'nsfw'

    # Add link flair and stuff
    story.flair 'no idea how this works'

    # Find out more information about the post
    story.text
    story.url 
    story.user
    story.self?

    # Find all the top level comments in this story
    story.discussion, (comment) ->
      comment.downvote()

  # Robots can lurk in the comment sections of said stories
  robot.discuss 'new', (comment) ->

    # Just like hubot, you can make http requests off the comment
    comment.http('http://www.example.com')
      .get() (err, resp, body) ->
        comment.reply 'Witty comment'

  # If someone replies to the bot. Careful, this will also trigger the above
  robot.respond '*', (comment) ->

    # Start stalking a user 
    robot.follow comment.user
    comment.reply 'Why thank you very much'

  # Robots can follow users around. Just add them to the robot.stalked list
  robot.stalk (content) ->

    # Content can be a story or a comment
    content.user
    content.comment?
    content.story?

  # Respond to private messages
  robot.read (message) ->
    message.reply 'Why yes, it is cold outside'

  # The robot can submit stories to subreddits
  robot.router.post "/karmabot/update", (req, res) ->
    robot.submit 'politics', 'Title goes here', 'http://www.google.com'
    res.end 'Submitted story'
