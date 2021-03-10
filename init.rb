Redmine::Plugin.register :test_benches do
  name 'Test Benches plugin'
  author 'Sebastian Bilda'
  description 'This is a plugin for Redmine.'
  version '0.0.1'

  project_module :benches do
    permission :view_benches, { benches: [:index, :show_bench] }
    permission :edit_benches, { benches: [:new_bench, :create_bench, :edit_bench, :update_bench, :delete_bench] }
    permission :ecus, { ecus: [:create_ecu, :new_ecu, :delete_ecu, :edit_ecu, :update_ecu]}
  end

  menu :project_menu, :benches, { controller: 'benches', action: 'index' }, caption: 'Test Benches'

end
