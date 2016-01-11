
# http://guides.rubyonrails.org/getting_started.html

class ArticlesController < ApplicationController
  before_filter :set_index_default_query_params, :only => [:index]

  def index
    @articles = Article.search(params[:q], params[:page], 3)
    @articles_field_names = articles_field_names
  end

  def new
  	@article = Article.new
  end

  def edit
	@article = Article.find(params[:id])
  puts @article
  end

  def show
  @article = Article.find(params[:id])
#  render plain: @article.inspect
  end

  def create
	#render plain: params[:article].inspect

  	@article = Article.new(article_params)
  	if @article.save
  		redirect_to @article
  	else 
  		render 'new'
  	end
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end


private
  def set_index_default_query_params
    show_fields = params[:show_fields] ? params[:show_fields] : default_show_fields
    @index_show_fields = show_fields | default_show_immutable_fields
    params[:page] = params[:page] ? params[:page] : 1;
  end

	def article_params
		params.require(:article).permit(:page_refer, :title, :author, :translate, :site, :editor, :press, :print, :print_date, :kword, :book_size, :price, :pages_num, :cateory, :journal, :amount, :inner_flag, :bindery, :attr, :remark, :text, :old_text, :converimage, {converavatars:[]})
	end

  def default_show_fields
    [
      'title',
      'page_refer',
      'author',
      'translate',
      'site',
      'editor',
      'press',
      'print',
      'print_date',
      'kword',
      'book_size',
      'price',
      'pages_num',
      'journal'
    ]
  end

  def default_show_immutable_fields
    [
      'title',
      'site',
      'editor',
      'press',
      'print',
      'print_date',
      'price',
      'options'
    ]
  end

  def articles_field_names
    {
      'page_refer' => '页码', 
      'title' => '书名',
      'author' => '作者', 
      'translate' => '翻译', 
      'site'   => '网址', 
      'editor' => '编者', 
      'press'  => '出版单位', 
      'print'  => '印刷单位', 
      'print_date' => '出版年月', 
      'kword'  => '千字', 
      'book_size'  => '开本', 
      'price'  => '定价(RMB)', 
      'pages_num'  => '页数',  
      'cateory'  => '工具书分类', 
      'journal'  => '期刊', 
      'amount'   => '拥有数量', 
      'inner_flag'   => '内发标记', 
      'bindery'  => '装订信息', 
      'attr'     => '属性', 
      'remark'   => '备注', 
      'text'     => '评注', 
      'old_text'   => '古老评注',
      'options' => '操作'
    }
  end

end
# end of class
