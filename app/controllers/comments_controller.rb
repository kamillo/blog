class CommentsController < ApplicationController

  def create
#    @post = Post.find(params[:post_id]) 
    @post = Post.find_by_slug!(params[:post_id])
    @commnet = @post.comments.create!(params[:comment])
    redirect_to (@post, :notice => 'Komentarz został zapisany - czeka na potwierdzenie.')
  end
#  # GET /comments
#  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

#  # GET /comments/1
#  # GET /comments/1.xml
#  def show
#    @comment = Comment.find(params[:id])

#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @comment }
#    end
#  end

#  # GET /comments/new
#  # GET /comments/new.xml
#  def new
#    @comment = Comment.new

#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @comment }
#    end
#  end

#  # GET /comments/1/edit
#  def edit
#    @comment = Comment.find(params[:id])
#  end

#  # POST /comments
#  # POST /comments.xml
#  def create
#    @comment = Comment.new(params[:comment])

#    respond_to do |format|
#      if @comment.save
#        format.html { redirect_to(@comment, :notice => 'Comment was successfully created.') }
#        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

#  # PUT /comments/1
#  # PUT /comments/1.xml
#  def update
#    @comment = Comment.find(params[:id])

#    respond_to do |format|
#      if @comment.update_attributes(params[:comment])
#        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

#  # DELETE /comments/1
#  # DELETE /comments/1.xml

  def update
    @post = Post.find_by_slug!(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update_attribute :approved, true
    redirect_to (@post)
    flash[:notice] = "Komentarz został zatwierdzony"
    
  end

  def destroy
    @post = Post.find_by_slug!(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(@post) }
      format.xml  { head :ok }
    end
  end
end
