class QuestionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => 'create'
  
  # GET /questions
  # GET /questions.xml
  def index
    if params[:all]
      @questions = Question.all_ready_to_go
    elsif params[:debug]
      @questions = Question.find(:all, :order => "created_at DESC")
    else
      @questions = Question.ready_to_go
    end
    
    respond_to do |format|
      format.html { render :partial => "question", :collection => @questions }
      format.xml  { render :xml => @questions }
      format.json { render :json => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      # format.html # show.html.erb
      format.xml  { render :xml => @question }
      format.json { render :json => @question }      
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
    @question = Question.new

    respond_to do |format|
      # format.html # new.html.erb
      format.xml  { render :xml => @question }
      format.json { render :json => @question }
    end
  end

  # GET /questions/1/edit
  # def edit
  #   @question = Question.find(params[:id])
  # end

  # POST /questions
  # POST /questions.xml
  # POST BODY = {:question => {:question => "This is my question",
  #                             :name => "Bob",
  #                             :user_id => 123,
  #                             :profile_image => 'url to profile image'}}
  def create
    user_id = params[:user_id].to_i unless params[:user_id].blank?
    @question = Question.new(:question => params[:question], :name => params[:name], 
                              :user_id => user_id, :profile_image => params[:profile_image])

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        # format.html { redirect_to(@question) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
        format.json  { render :json => @question, :status => :created, :location => @question }        
      else
        logger.error(@question.errors.inspect)
        # format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
        format.xml  { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:notice] = 'Question was successfully updated.'
        # format.html { redirect_to(@question) }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        # format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
        format.json  { render :json => @question.errors, :status => :unprocessable_entity }        
      end
    end
  end

  def disable
    @question = Question.find(params[:id])
    @question.disable = true
    
    respond_to do |format|
      if @question.save
        head :ok
      else
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
        format.json  { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # /questions/admin
  def admin
    @questions = Question.all_ready_to_go
  end
end
