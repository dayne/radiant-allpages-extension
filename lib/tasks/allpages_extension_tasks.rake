namespace :radiant do
  namespace :extensions do
    namespace :allpages do
      
      desc "Runs the migration of the All Pages extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          AllpagesExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          AllpagesExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the All Pages to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from AllpagesExtension"
        Dir[AllpagesExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(AllpagesExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
