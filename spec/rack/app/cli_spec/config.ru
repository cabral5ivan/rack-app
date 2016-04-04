class MountedApp < Rack::App
  cli do

    command :hello do

      description "hello world cli"
      action do |word|
        $stdout.puts "hello #{word}!"
      end

    end

  end
end

class App < Rack::App
  mount MountedApp
end

App.cli  do

  command :test do

    description "it's a sample test cli command"

    options = {}

    option '-c', '--content [STRING]', 'add content to test file the following string' do |string|
      options[:append]= string
    end

    action do |file_path|
      options[:append] ||= 'default'

      $stdout.puts [file_path, options[:append]].join(' ')
    end

  end

end

run App