# @todo clear to seed all file
Dir[File.join(Rails.root, 'db', 'seeds', '08_shozoku.rb')].sort.each { |seed| load seed }
# Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }