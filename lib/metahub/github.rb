# -*- encoding : utf-8 -*-
Octokit.user_agent = "Metahub : Octokit Ruby Gem #{Octokit::VERSION}"
Octokit.auto_paginate = true

module Metahub
  class GithubService
    def self.owner
      @owner ||= self.new
    end

    attr_reader :client
    def initialize
      client_options = { :login => Auth.username, 
                  :password => Auth.password }
      token_options  = { :scopes => ["repo"], 
                  :client_id => "099bb3db6bf979a92391",
                  :client_secret => "ad2cbeac50c2d19478b1d9041b72fd7b9a3b0d26",
                  :idempotent => true
                }

      simple = Octokit::Client.new(client_options)
      begin
        token = simple.create_authorization(token_options)
        @client = Octokit::Client.new(:access_token => token[:token])
      rescue Octokit::OneTimePasswordRequired => e
        token = simple.create_authorization(token_options.merge(:headers => { "X-GitHub-OTP" => Auth.otp_code }))
        @client = Octokit::Client.new(:access_token => token[:token])
      end
      # puts @client.ratelimit_remaining
    end

    def repositories
      repos = []

      client.repositories.each do |hash|
        repos << hash.full_name
      end

      self.organizations(client.login).each do |org_name|
        client.organization_repositories(org_name).each do |hash|
          repos << hash.full_name
        end
      end

      # return these, ignoring requested ones
      repos.compact.uniq
    end

    protected

    def organizations(username)
      names = []

      client.organizations.each do |hash|
        names << hash.login
      end

      unless username == client.login
        client.organizations(username).each do |hash|
          names << hash.login
        end
      end

      names.compact.uniq
    end
  end
end
