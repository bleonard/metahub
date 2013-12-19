# -*- encoding : utf-8 -*-
Octokit.user_agent = "Metahub : Octokit Ruby Gem #{Octokit::VERSION}"

module Metahub
  class GithubService
    def self.owner
      @owner ||= self.new
    end

    attr_reader :client
    def initialize
      @client = Octokit::Client.new(:login => Auth.username, :password => Auth.password, :auto_traversal => true)
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
