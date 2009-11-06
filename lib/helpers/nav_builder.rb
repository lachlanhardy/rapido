module Application
  module Helpers
    def nav_builder      
      @nav_items ||= []
      Dir.glob("views/*").each do |page|
        if !(File.ftype(page) == "directory") && !(page.index("_") == 6)
          page = page.split("/").last.split(".")[0]
          unless (page == "error" || page == "layout" || page == "index")
            @nav_items.push(page)
          end
        end
      end
      erb(:_navigation, :layout => false)
    end
  end
end