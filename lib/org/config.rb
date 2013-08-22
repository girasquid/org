module Org
  module Config
    extend self

    def black_swan_database_url
      env!("BLACK_SWAN_DATABASE_URL")
    end

    def force_ssl?
      %w{1 true yes}.include?(env("FORCE_SSL"))
    end

    def google_analytics_id
      env("GOOGLE_ANALYTICS_ID")
    end

    def production?
      env("RACK_ENV") == "production"
    end

    def release
      env("RELEASE") || "1"
    end

    def root
      File.expand_path("../../../", __FILE__)
    end

    private

    def env(k)
      ENV[k] if ENV[k] != ""
    end

    def env!(k)
      env(k) || raise("missing_environment=#{k}")
    end
  end
end
