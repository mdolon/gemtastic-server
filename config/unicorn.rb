APP_PATH = "/home/www/gemtastic.org/app/production/current"

# Set the working application directory
# working_directory "/path/to/your/app"
working_directory APP_PATH

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid APP_PATH + "/tmp/pid/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stderr.log"

# Unicorn socket
listen "/tmp/unicorn.gemtastic.sock"
listen "/tmp/unicorn.myapp.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
