# This just demonstrates how to create
# the tasks for the God gem.

require 'ungodly'

namespace :god do

  # Create the tasks inside the :god namespace
  Ungodly.create_tasks(
    port:            "1256",
    config_path:     "./workers.god",
    managed_pid_dir: "./tmp/pids"
  )

end