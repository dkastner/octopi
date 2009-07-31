module Octopi
  class Tag < Base
    include Resource
    set_resource_name "tag"

    resource_path "/repos/show/:id"
    
    def self.all(opts)
      user, repo = gather_details(opts)
      self.validate_args(user => :user, repo => :repo)
      find_plural([user, repo, 'tags'], :resource) { |i| {:name => i.first, :hash => i.last } }
    end
  end
end
