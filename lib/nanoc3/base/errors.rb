module Nanoc3

  module Errors

    # Generic error. Superclass for all nanoc-specific errors.
    class GenericError < ::RuntimeError
    end

    # Error that is raised when a site is loaded that uses a data source with
    # an unknown identifier.
    class UnknownDataSourceError < GenericError
      def initialize(data_source_name)
        super("The data source specified in the site's configuration file, #{data_source_name}, does not exist.")
      end
    end

    # Error that is raised when a site is loaded that uses a data source with
    # an unknown identifier.
    class UnknownRouterError < GenericError
      def initialize(router_name)
        super("The router specified in the site's configuration file, #{router_name}, does not exist.")
      end
    end

    # Error that is raised during site compilation when an item uses a layout
    # that is not present in the site.
    class UnknownLayoutError < GenericError
      def initialize(layout_identifier)
        super("The site does not have a layout with identifier '#{layout_identifier}'.")
      end
    end

    # Error that is raised during site compilation when an item uses a filter
    # that is not known.
    class UnknownFilterError < GenericError
      def initialize(filter_name)
        super("The requested filter, #{filter_name}, does not exist.")
      end
    end

    # Error that is raised during site compilation when a layout is compiled
    # for which the filter cannot be determined. This is similar to the
    # UnknownFilterError, but specific for filters for layouts.
    class CannotDetermineFilterError < GenericError
      def initialize(layout_identifier)
        super("The filter to be used for the '#{layout_identifier}' could not be determined. Make sure the layout does have a filter.")
      end
    end

    # Error that is raised when data is requested when the data is not yet
    # available (possibly due to a missing Nanoc::Site#load_data).
    class DataNotYetAvailableError < GenericError
      def initialize(type, plural)
        super("#{type} #{plural ? 'are' : 'is'} not available yet. You may be missing a Nanoc::Site#load_data call.")
      end
    end

    # Error that is raised during site compilation when an item (directly or
    # indirectly) includes its own item content, leading to endless recursion.
    class RecursiveCompilationError < GenericError
      def initialize
        super("A recursive call to item content was detected. Items cannot (directly or indirectly) contain their own content.")
      end
    end

    # Error that is raised when no rules file can be found in the current
    # working directory.
    class NoRulesFileFoundError < GenericError
      def initialize
        super("This site does not have a rules file, which is required for nanoc sites.")
      end
    end

    # Error that is raised when no compilation rule that can be applied to the
    # current item can be found.
    class NoMatchingCompilationRuleFoundError < GenericError
      def initialize(item)
        super("No compilation rules were found for the '#{item.identifier}' item.")
      end
    end

  end

end
