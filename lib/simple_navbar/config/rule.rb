module SimpleNavbar
  module Config
    class Rule
      attr_accessor :title, :navs
      def initialize(title)
        self.title = title
        self.navs = []
      end

      def self.get(title)
        raise SimpleNavbar::Config::UnconfigurationError.new if !defined?(@@rules)
        rule = @@rules[title]
        raise SimpleNavbar::Config::UndefinedRuleError.new if rule.blank?
        rule
      end

      def self.get_or_create(title)
        @@rules[title] ||= self.new(title)
      end

      def self.all
        @@rules
      end

      def self.init
        @@rules = {}
      end
    end
  end
end
