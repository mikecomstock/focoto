class IncomingController < ActionController::Base

  require 'postmark_mitt'

  def postmark

    if ENV['RAILS_ENV'] == 'production'
      email = Postmark::Mitt.new(request.body.read)
    else
      email = Postmark::Mitt.new(File.read("test_email.json"))
    end

    post = Post.create_from_postmark(email)
    render :json => post.to_json
  end
  
end
