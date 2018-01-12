# load tasks from wax_tasks
spec = Gem::Specification.find_by_name 'wax_tasks'
Dir.glob("#{spec.gem_dir}/lib/tasks/*.rake").each {|r| load r}

# load custom sudanphoto tasks
Dir.glob("tasks/*.rake").each {|r| load r}
