class Chef
  class Provider
    class GitClient
      class Package < Chef::Provider::GitClient
        include Chef::DSL::IncludeRecipe

        action :install do
          # FIXME: rhel 5
          include_recipe 'yum-epel' if node['platform_version'].to_i == 5

          # Software installation
          package "#{new_resource.name} :create #{parsed_package_name}" do
            package_name parsed_package_name
            version parsed_package_version
            action new_resource.package_action
            action :install
          end

          # include_recipe 'git::windows'

          # dmg_package 'GitOSX-Installer' do
          #   app node['git']['osx_dmg']['app_name']
          #   package_id node['git']['osx_dmg']['package_id']
          #   volumes_dir node['git']['osx_dmg']['volumes_dir']
          #   source node['git']['osx_dmg']['url']
          #   checksum node['git']['osx_dmg']['checksum']
          #   type 'pkg'
          #   action :install
          # end
        end

        action :delete do
        end
      end
    end
  end
end
