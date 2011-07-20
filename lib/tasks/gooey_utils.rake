namespace :gooey do
  
  #TODO: get app name automatically
  real_images_root  = "/var/www-assets/jerrymagazine/images/"
  app_images_root   = "#{::Rails.root.to_s}/public/images/"
  
  desc "Restart the server (using passenger)"
  task :restart do
    system("touch tmp/restart.txt")
  end
  
  desc "Create empty image directory for specific model"
  task :create_image_directory do
    raise 'USAGE: rake gooey:create_image_directory MODEL=MyModelName' if ENV["MODEL"].nil?
    model = ENV["MODEL"].tableize
    # Check to see if real folder exists
    real_folder  = real_images_root + model
    if File.exists?(real_folder)
      puts "#{real_folder} exists"
    else
      # make it if it doesn't
      puts "creating #{real_folder}"
      Dir.mkdir "#{real_folder}"
      File::chmod(0777, real_folder)
    end
    # Check to see if symlink exists
    app_folder  = app_images_root + model
    if File.exists?(app_folder)
      puts "#{app_folder} exists"
    else
      # make it if it doesn't
      puts "creating symlink #{app_folder}"
      File::symlink(real_folder, app_folder)
      File::chmod(0777, app_folder)
    end
  end

  desc "Create empty directories for model images if they don't already exist"
  task :create_image_directories do
    
    
    # get all models
    page_subs = Array.new
    Dir["#{::Rails.root.to_s}/app/models/*.rb"].each{|path|
      page_subs << File::basename(path).gsub(/\.rb/, '').pluralize
    }
    
    # loop through subclasses to create real image folders 
    page_subs.each {|sc|
      # Check to see if real folder exists
      folder  = real_images_root + sc
      if File.exists?(folder)
        puts "#{folder} exists"
      else
        # make it if it doesn't
        puts "creating #{folder}"
        Dir.mkdir "#{folder}"
        File::chmod(0777, folder)
      end
    }
  
    # loop through subclasses to create symlinks 
    page_subs.each {|sc|
      # Check to see if symlink exists
      app_folder  = app_images_root + sc
      real_folder = real_images_root + sc
      if File.exists?(app_folder)
        puts "#{app_folder} exists"
      else
        # make it if it doesn't
        puts "creating symlink #{app_folder}"
        File::symlink(real_folder, app_folder)
        File::chmod(0777, app_folder)
      end
    }
    
  end
  
  desc 'Create YAML test fixtures from data in an existing database.  
  Defaults to development database.  Set Rails.env to override.'

  task :extract_fixtures => :environment do
    sql  = "SELECT * FROM %s"
    skip_tables = ["schema_info"]
    ActiveRecord::Base.establish_connection
    (ActiveRecord::Base.connection.tables - skip_tables).each do |table_name|
      i = "000"
      File.open("#{::Rails.root.to_s}/test/fixtures/#{table_name}.yml", 'w') do |file|
        data = ActiveRecord::Base.connection.select_all(sql % table_name)
        file.write data.inject({}) { |hash, record|
          hash["#{table_name}_#{i.succ!}"] = record
          hash
        }.to_yaml
      end
    end
  end
  
  desc 'Create YAML gooey_config fixtures from data in an existing database.  
  Defaults to development database.  Set Rails.env to override.'

  task :extract_gooey_configs => :environment do
    sql  = "SELECT * FROM gooey_configs"
    ActiveRecord::Base.establish_connection
    i = "000"
    File.open("#{::Rails.root.to_s}/test/fixtures/gooey_configs_bk.yml", 'w') do |file|
      data = ActiveRecord::Base.connection.select_all(sql)
      file.write data.inject({}) { |hash, record|
        hash["gooey_configs_#{i.succ!}"] = record
        hash
      }.to_yaml
    end
  end
  
end

