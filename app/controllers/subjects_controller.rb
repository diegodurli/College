class SubjectsController < ApplicationController
  before_filter :authorize, only: [:create, :update]
  helper_method :count_by_status, :subjects_by_status
  
  # GET /subjects
  # GET /subjects.json
  def index
    @subjects        = current_user.subjects.by_status_desc
    @count_by_status = count_by_status

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = current_user.subjects.build(params[:subject])

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path, notice: 'Subject was successfully created.' }
        format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { render action: "new" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to subjects_path, notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  protected

  def count_by_status
    subjects = { completed: 0, pending: 0, registered: 0 }

    current_user.subjects.group('status').count.each do |key, value|
      subjects.merge!({ key.downcase.to_sym => value })
    end

    subjects
  end

  def subjects_by_status
    subjects_by_status = ""

    current_user.subjects.group("status").count.each do |status, value|
      subjects_by_status << "['#{status}',#{value}],"
    end

    subjects_by_status
  end
end
