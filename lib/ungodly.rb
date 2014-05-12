
require 'rake'

module Ungodly
  extend Rake::DSL


  class GodCommandFailure < StandardError
  end


  # Helper method for invoking god commands
  def self.invoke(args)
    pid = Process.spawn(*args)
    _, result = Process.wait2(pid)

    s = result.exitstatus
    if s != 0
      raise GodCommandFailure, "god command exited with status #{s}"
    end
  end


  class GodManager

    attr_accessor :env, :god_path
    attr_accessor :config_path, :managed_pid_dir, :port

    def initialize(options = {})
      @env             = options[:env]

      @god_path        = options[:god_path]
      
      @port            = options[:port]
      @managed_pid_dir = options[:managed_pid_dir]
      @config_path     = options[:config_path]
    end


    # Helper methods for generating fragments of god commands
    def env_param
      (env) ? [env] : []
    end

    def god_exec_param
      [god_path || "god"]
    end

    def port_param
      (port) ? ["-p", port] : []
    end

    def managed_pid_dir_param
      (managed_pid_dir) ? ["-managed-pid-dir", managed_pid_dir] : []
    end

    def config_path_param
      (config_path) ? ["-c", config_path] : []
    end


    # Helper methods for generating god commands

    def launch_cmd
      env_param + god_exec_param + port_param + managed_pid_dir_param + config_path_param
    end

    def terminate_cmd
      env_param + god_exec_param + port_param + ["terminate"]
    end

    def status_cmd
      env_param + god_exec_param + port_param + ["status"]
    end

  end




  def self.create_tasks(options = {})

    god_manager = GodManager.new(options)

    desc "Launch god and the workers"
    task :launch do
      invoke god_manager.launch_cmd
    end

    desc "Terminate god and the workers"
    task :terminate do
      invoke god_manager.terminate_cmd
    end

    desc "Show the status of the god workers"
    task :status do
      invoke god_manager.status_cmd
    end

  end



end
