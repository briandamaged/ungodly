# This just demonstrates how to create
# the tasks for the God gem.

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
