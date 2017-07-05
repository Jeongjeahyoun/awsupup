require 'carrierwave/orm/activerecord'
require 'mailgun'
class HomeController < ApplicationController
  def index
    
  end
  
  def repost
    @posts=Post.all.reverse
  end

  def write
    post=Post.new
    post.title=params[:title]
    post.content=params[:content]
    uploader = ChocoUploader.new
    file = params[:pic]
    uploader.store!(file)
    post.save
    
    post.image_url = uploader.url
    
    if post.save
        redirect_to "/home/repost"
    else
      render :text => post.errors.messages[:title].first
    end
      
  end
  
  def reply_write
    reply=Reply.new
    reply.content=params[:xylitol]
    reply.post_id=params[:id_of_post]
    reply.save
    
    redirect_to "/home/repost"
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to '/home/repost'
  end
  
  def update_view
    @post = Post.find(params[:post_id])
    
  end
  
  def real
      @post = Post.find(params[:post_id])
      @post.title = params[:title]
      @post.content = params[:content]
      @post.save
      redirect_to '/home/repost'    
  end
  
  
  def complete
        @almond = params[:emailadd]
        @bangarang = params[:emailtitle]
        @anchovy = params[:emailcontent]
        
        new_posts = Post.new
        new_posts.email = @almond
        new_posts.emailtitle = @bangarang
        new_posts.emailcontent = @anchovy
        new_posts.save
        
                    # First, instantiate the Mailgun Client with your API key
            mg_client = Mailgun::Client.new("key-032563be0cea3c9af52e30e383e2596b")
            
            # Define your message parameters
            message_params = {  from: @almond,
                                to: 'zeni9@naver.com',
                                subject: @bangarang,
                                text: @anchovy
                              }
            
            result = mg_client.send_message('sandbox649391cda02140bca82bd51856e2ef4e.mailgun.org', message_params).to_h!

            message_id = result['id']
            message = result['message']
            
            redirect_to '/home/contact'
            
  end
    
  def upload
    file = params[:pic]
    
    uploader = ChocoUploader.new
    uploader.store!(file)
    
    redirect_to "/home/repost"
  end
end
