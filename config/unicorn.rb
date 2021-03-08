# Railsのルートパスを求める。(RAILS_ROOT/config/unicorn.rbに配置している場合。)
rails_root =  "/home/ec2-user/workdir" #ENV['RAILS_ROOT'] File.expand_path('../..', __FILE__)

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{rails_root}/Gemfile"
end

# Unicornは複数のワーカーで起動するのでワーカー数を定義
# サーバーのメモリなどによって変更すること。
worker_processes 2

# # 指定しなくても良い。
# # Unicornの起動コマンドを実行するディレクトリを指定します。
# # （記載しておけば他のディレクトリでこのファイルを叩けなくなる。）
# working_directory rails_root

# 接続タイムアウト時間
timeout 30

# Unicornのエラーログと通常ログの位置を指定。
stderr_path  "#{rails_root}/log/unicorn_stderr.log" #File.expand_path('../../log/unicorn_stderr.log', __FILE__)
stdout_path  "#{rails_root}/log/unicorn_stdout.log" #File.expand_path('../../log/unicorn_stdout.log', __FILE__)

# # Nginxで使用する場合は以下の設定を行う。
listen  "#{rails_root}/tmp/sockets/unicorn.sock" #"/var/socks/unicorn.sock"  #File.expand_path('../../tmp/sockets/unicorn.sock', __FILE__)

# プロセスの停止などに必要なPIDファイルの保存先を指定。
pid  "#{rails_root}/tmp/pids/unicorn.pid" #"/var/run/unicorn.pid"#File.expand_path('../../tmp/pids/unicorn.pid', __FILE__)

# 基本的には`true`を指定する。Unicornの再起動時にダウンタイムなしで再起動が行われる。
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end 

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end