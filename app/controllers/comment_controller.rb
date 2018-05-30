class CommentController < ApplicationController
  def reply_create
    new_reply = Reply.new(post_id: params[:post_id], editor: params[:editor], content: params[:content])
    new_reply.save
    
    redirect_to :back
  end

  def reply_delete
    delete_reply=Reply.find(params[:reply_id])
    delete_reply.destroy
        
    redirect_to :back
  end
end
