Redmine::Plugin.register :test_benches do
  name 'Test Benches plugin'
  author 'Sebastian Bilda'
  description 'Add Testbenches for an overview what is inside an Testbench. For every Project you can assign some Testbenches. If you create in subproject Testbenches, these were shown
  in the main project for an overview, but not vice versa.'
  version '0.0.2'

  project_module :benches do
    permission :view_benches, { benches: [:index, :show_bench] }
    permission :edit_benches, { benches: [:new_bench, :create_bench, :edit_bench, :update_bench, :delete_bench] }
    permission :edit_ecus, { ecus: [:create_ecu, :new_ecu, :delete_ecu, :edit_ecu, :update_ecu]}
  end

  menu :project_menu, :benches, { controller: 'benches', action: 'index' }, caption: 'Test Benches'

end
