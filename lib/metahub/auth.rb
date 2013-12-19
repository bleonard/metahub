module Metahub
  module Auth
    extend self
    
    def fetch
      username
      password
    end
    
    def username
      @username ||= ask("Github Username: ")
    end
    
    def password
      @password ||= ask("Github Password: ") { |q| q.echo = "*" }
    end
  end
end