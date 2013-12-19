module Metahub
  module Backup
    extend self
    
    def now!
      directory
      GithubService.owner.repositories.each do |name|
        dir = "#{directory}/#{name}"        
        if File.exist?(dir)
          FileUtils.rm_rf(dir)
        end
        FileUtils.mkdir_p(dir)
        
        puts "#{name}..."
        cmd = "git clone git@github.com:#{name}.git #{dir}"
        puts cmd
        system cmd
        puts " ...done!"
        puts ""
      end
    end
    
    def directory
      return @directory if @directory
      time = Time.now
      
      @directory = File.join(File.expand_path("."), "#{time.year}.#{time.month}.#{time.day}")
      FileUtils.mkdir_p(@directory) unless File.exist?(@directory)
    end
    
    
  end
end