require 'fileutils'

dst_dir = File.expand_path(ARGV.first || '~/')
%w|dot-vim dot-vimrc dot-gvimrc|.each do |file|
  dst_name = File.join(dst_dir, file.gsub(/^dot\-/, '.'))
  FileUtils.mv(dst_name, "#{dst_name}.bak") if File.exists?(dst_name)
  FileUtils.ln_sf(File.expand_path(file, File.dirname(__FILE__)), dst_name)
end
