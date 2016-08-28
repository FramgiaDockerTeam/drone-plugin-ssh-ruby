require "json"
require "open3"

arguments = ARGV[1] ? ARGV[1] : '[]'
arguments = JSON.parse(arguments);

`mkdir ~/.ssh`

if arguments['workspace']
    Dir.chdir arguments['workspace']['path']
    key = arguments['workspace']['keys']['private']
    `echo "#{key}" > ~/.ssh/id_rsa`
end

`chmod -R 600 ~/.ssh`

vargs = arguments['vargs'];
commands = vargs['commands'] ? vargs['commands'] : [];
commands.each do |command|
    Open3.popen2e("bash", "-c", command) do |i, oe, t|
        oe.each { |line| puts line }
    end
end
