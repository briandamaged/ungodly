ungodly
=======

Rake task generator for the God gem


Usage
-------

The Ungodly.create_tasks(...) method generates a collection of Rake tasks that manage a specific God instance.  Ideally, this method should be invoked within a Rake namespace.  This will minimize the likelihood of clobbering existing tasks.  For example:

    #!/usr/bin/env rake

    require 'ungodly'

    namespace :my_project do
      namespace :god do

        Ungodly.create_tasks(
          port:            "1256",
          config_path:     "./workers.god",
          managed_pid_dir: "./tmp/pids"
        )

      end
    end


Let's list the Rake tasks from the command line to verify that everything got generated correctly:

    $ bundle exec rake -T
    rake my_project:god:launch     # Launch god and the workers
    rake my_project:god:status     # Show the status of the god workers
    rake my_project:god:terminate  # Terminate god and the workers