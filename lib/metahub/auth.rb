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

    def otp_code
      @otp_code ||= ask("Github OTP Code (via phone): ") { |q| q.echo = "*" }
    end
  end
end