module Katagen
  module Generators
    # Colorization for puts, no need for another gem
    # TODO: should I move this into a small gem?
    module Logging
      COLOR_CODES = {
        red: 31,
        green: 32,
        yellow: 33,
        blue: 34,
        pink: 35,
        light_blue: 36
      }

      def info(message)
        puts "#{colorize("info", :blue)} #{message}"
      end

      def success(message)
        puts "#{colorize("success", :green)} #{message}"
      end

      def warning(message)
        puts "#{colorize("warning", :yellow)} #{message}"
      end

      private

      # :reek:UtilityFunction

      # Colorize string with provided code. Defaults to none(0)
      # NOTE: reek should not complain about this in a module IMO
      def colorize(message, color)
        "\e[#{COLOR_CODES[color] || 0}m#{message}\e[0m"
      end
    end
  end
end
