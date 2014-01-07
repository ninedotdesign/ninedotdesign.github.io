require "sprockets"

cosmui_root = Gem::Specification.find_by_name("cosmui").gem_dir
%w(content/images content/fonts content/stylesheets content/javascripts assets/sass).each do |dir|
  Sprockets.append_path File.join(cosmui_root, dir)
end
