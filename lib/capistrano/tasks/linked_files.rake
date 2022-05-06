namespace :load do
  task :defaults do
    set :upload_roles, :all
    set :upload_servers, -> { release_roles(fetch(:upload_roles)) }
  end
end

namespace :linked_files do
  desc 'Upload linked files and directories'
  task :upload do
    invoke 'linked_files:upload:files'
    invoke 'linked_files:upload:dirs'
  end
  task :upload_files do
    invoke 'linked_files:upload:files'
  end
  task :upload_dirs do
    invoke 'linked_files:upload:dirs'
  end

  namespace :upload do
    task :files do
      on fetch(:upload_servers) do
        info "Uploading files to: #{fetch(:upload_roles)}"
        fetch(:linked_files, []).each do |file|
          begin
            info "Uploading file #{file}"
            next if fetch(:skip_upload_files, []).include?(file)
            fullpath = Pathname.new(Dir.pwd).join(file)
            `mkdir -p #{fullpath.dirname} && touch #{fullpath}`
            upload!(file, "#{shared_path}/#{file}") 
          rescue
          end
        end
      end
    end

    task :dirs do
      on fetch(:upload_servers) do
        info "Uploading directories to: #{fetch(:upload_roles)}"
        fetch(:linked_dirs, []).each do |dir|
          begin
            info "Uploading dir #{dir}"
            next if fetch(:skip_upload_dirs, []).include?(dir)
            fullpath = Pathname.new(Dir.pwd).join(dir)
            `mkdir -p #{fullpath}`
            upload!(dir, "#{shared_path}/", recursive: true) rescue nil ## TODO not upload shared dir
          rescue
          end
        end
      end
    end
    
  end

  before 'linked_files:upload', 'deploy:check:make_linked_dirs'
end
