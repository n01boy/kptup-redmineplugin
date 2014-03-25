class KptsController < ApplicationController

  menu_item :kptview
  before_filter :find_project, :authorize
  def find_project
    @project = Project.find(params[:project_id])
    @project_id = params[:project_id]
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  #Method
  def show
    @versions = VersionEx.find(:all,:conditions => ["project_id  = ?",@project.id] ,:order => "id DESC")
    @versions.each do |version|
      @kptview_keep=[]
      @kptview_problem=[]
      @kptview_try=[]
      @kptview = Kpt.find(:all, :conditions => ["project_id = ? and version_id = ?",@project_id , version.id] )
      @kptview.each do |f|
        if f.kpt == "1"
          @kptview_keep.push(f)
        end
        if  f.kpt == "2"
          @kptview_problem.push(f)
        end
        if  f.kpt == "3"
          @kptview_try.push(f)
        end
      end
      version.kptview_keep = @kptview_keep
      version.kptview_problem = @kptview_problem
      version.kptview_try = @kptview_try
    end

  end

  def create
    @kpt = Kpt.new
    @content = params[:name]
    @kpt.content = @content
    @kpt.project_id = params[:project_id]
    @kpt.kpt =params[:kptdiv][:kptdiv]
    @kpt.version_id = params[:version_id]

    if !@content.blank?
      @kpt.save
    end
    redirect_to("/kpts/show?project_id=" + @project_id);
  end

  def destroy
    @delete_id = params[:delete_id]
    @kpt = Kpt.find(@delete_id)
    @kpt.delete
    redirect_to("/kpts/show?project_id=" + @project_id);
  end

  def issues
    @subject =  URI.escape(  params[:subject], Regexp.new("[^#{URI::PATTERN::ALNUM}]"))
    redirect_to("/projects/"+@project_id+"/issues/new?project_id=" + @project_id + "&subject="+ @subject)
  end
end
