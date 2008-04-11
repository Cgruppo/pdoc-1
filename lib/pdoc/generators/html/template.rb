module PDoc
  module Generators
    module Html
      class Template < ERB
        
        unless defined? TEMPLATES_DIRECTORY
          TEMPLATES_DIRECTORY = File.join(TEMPLATES_DIR, "html")
        end
        
        def initialize(file_name = "layout.erb")
          @file_name = file_name
          super(IO.read(file_path), nil, '%')
        end
        
        private
          def file_path
            @file_name << '.erb' unless @file_name =~ /\.erb$/
            path = File.join(TEMPLATES_DIRECTORY, @file_name.split("/"))
            File.expand_path(path, DIR)
          end
      end
    end
  end
end