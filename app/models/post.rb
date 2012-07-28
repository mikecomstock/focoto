class Post < ActiveRecord::Base
#  attr_accessible :from, :from_email, :headers, :html_body, :text_body, :to_email
  attr_accessible :photo

  has_attached_file :photo,
    :storage => :s3,
    :bucket => 'focoto-dev',
    :s3_credentials => {
      :access_key_id => 'AKIAI2Y2EHAZC37EHMOQ',
      :secret_access_key => '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'
    },
    :styles => {
      :medium => '300x300',
      :thumb => '100x100'
    }

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
    #post.message_id = mitt.message_id # Make sure we don't process the same email twice

    name =  mitt.attachments.first.source['Name']
    first = MCTempfile.new(name, :encoding => 'ascii-8bit')
    first.content_type = mitt.attachments.first.source['ContentType']
    decoded = Base64.decode64 mitt.attachments.first.source['Content']
    first.write decoded
    first.flush

    post.photo = first

    post.save
    post
  end
end

class MCTempfile < Tempfile
  attr_accessor :content_type
end
