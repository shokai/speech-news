
class News
  class Plugin
    def initialize
      Dir.glob(File.expand_path '*.rb', "#{File.dirname(__FILE__)}/../plugins").each do |rb|
        name = rb.scan(/([^\/]+)\.rb/)[0][0].to_sym
        puts "loading plugin #{rb}"
        plugins[name] = open(rb).read
      end
    end

    def plugins
      @plugins ||= Hash.new
    end
    private :plugins

    def names
      plugins.keys
    end

    def exec(name=nil)
      if name != nil
        instance_eval plugins[name.to_sym]
      else
        names.map do |name|
          instance_eval plugins[name.to_sym]
        end.flatten
      end
    end
  end
end

if __FILE__ == $0
  ps = News::Plugin.new
  p ps.names
  p ps.exec
end
