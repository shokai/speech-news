class News
  def initialize
    @plugin = News::Plugin.new
  end

  def get(name=nil)
    @plugin.exec(name)
  end
end
