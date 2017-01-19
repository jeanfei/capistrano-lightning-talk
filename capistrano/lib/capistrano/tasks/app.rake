namespace :app do
    namespace :security do
        desc 'Override robots.txt file'
        task :disallow_robots do
            on roles(:web) do
                upload! "templates/robots.txt", "#{release_path}/src/web/robots.txt"
            end
        end
    end
end