class WorksController < InheritedResources::Base
  def index
    @works = Work.all
    @images_cover = Image.order("images.id ASC").where(:cover => true)
  end
  def show
    @work = Work.find(params[:id])
    @cover = @work.images.where(:cover => true).first
  end
  def covers
    @works = Work.find(:all, :conditions => {:category => 'cover'}, :order => 'order_work_by')
    @images_cover = Image.order("images.id ASC").joins(:work).where('works.category' => 'cover')
    render :index
  end
  def poster
    @works = Work.find(:all, :conditions => {:category => 'poster'}, :order => 'order_work_by')
    render :index
  end
  def identity
    @works = Work.find(:all, :conditions => {:category => 'identity'}, :order => 'order_work_by')
    render :index
  end
  def random
    @works = Work.find(:all, :conditions => {:category => 'random'}, :order => 'order_work_by')
    render :index
  end
end
