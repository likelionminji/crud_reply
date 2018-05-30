class BoardController < ApplicationController
  def index
    # 모든 post들을 모아서 title, editor만 보여줌 / 메인화면
    # 글쓰기 => new / 특정 post의 제목 클릭 => show
    
    @list_post=Post.all
    
  end

  def new
    # 새로운 post작성
  
  end

  def create
    new_p = Post.new(title: params[:title], editor: params[:editor], content: params[:content])
    new_p.save
    
    redirect_to "/"
  end

  def show
    # 특정 post의 title, editor, content를 보여줌
    # 수정 => edit / 삭제 => (해당 포스트 삭제)
     @show_post = Post.find(params[:p_id])
     @all_reply=Post.find(@show_post).replies
  end

  def edit
    # 특정 post의 title, editor, content를 수정하는 form
    @edit_post=Post.find(params[:p_id])
  end

  def update
    update_post=Post.find(params[:p_id])
    update_post.title = params[:title]
    update_post.editor = params[:editor]
    update_post.content = params[:content]
    update_post.save

    redirect_to "/board/show/" + params[:p_id].to_s
  end

  def destroy
    delete_post=Post.find(params[:p_id])
    delete_post.destroy
  
    redirect_to :back
  end
end
