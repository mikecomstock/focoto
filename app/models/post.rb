class Post < ActiveRecord::Base
  attr_accessible :from, :from_email, :headers, :html_body, :text_body, :to_email
  
  def self.create_from_postmark(mitt)
    #author = User.find_by_api_email(mitt.to)
    #handle_no_author # send an email back saying we couldn't find them
    post = new
    post.subject = mitt.subject
    post.to_name = mitt.to_name
    post.to_email = mitt.to_email
    post.from_name = mitt.from_name
    post.from_email = mitt.from_email
    post.text_body = mitt.text_body
    post.html_body = mitt.html_body
    post.headers = mitt.headers.to_s
    #post.author = author
    #post.photo = mitt.attachments.first.read
    #post.message_id = mitt.message_id # Make sure we don't process the same email twice
    post.save
    post
  end
end
