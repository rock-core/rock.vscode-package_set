root_config     = File.join(Autoproj.workspace.root_dir, '.rubocop.yml')
autoproj_config = File.join(Autoproj.workspace.config_dir, 'rubocop.yml')

unless File.exist?(autoproj_config)
    File.open(autoproj_config, 'w') do |io|
        YAML.dump({ 'inherit_gem' => { 'rubocop-rock' => 'defaults.yml' } }, io)
    end
    FileUtils.touch autoproj_config
end

File.open(root_config, 'w') do |io|
    YAML.dump({ 'inherit_from' => [autoproj_config] }, io)
end

