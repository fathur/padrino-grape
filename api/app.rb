module Api
  class App < Grape::API
    # def name
    #   "API#{version}"
    # end
    #
    # def request_methods
    #   Set.new [request_method]
    # end
    #
    # def original_path
    #   path
    # end
    #
    # def controller
    #   nil
    # end

    class << self
      def cascade
        []
      end

      def root
        @_root ||= File.expand_path('..', __FILE__)
      end

      def dependencies
        # @_dependencies ||= Dir[File.expand_path('../../api/*.rb', __FILE__)]
        @_dependencies ||= %w(versions/**/*.rb).map do |file|
          Dir[File.join(self.root, file)]
        end.flatten
      end

      def load_paths
        @_load_paths ||= [File.expand_path('../../api', __FILE__)]
      end

      ## NOTE: Taken from Padrino. Deprecated in master (0.13.0.rc1).
      ## Padrino apps must now modify $LOAD_PATH for themselves.
      ## See: https://github.com/padrino/padrino-framework/pull/1693
      ##
      # Concat to +$LOAD_PATH+ the given paths.
      #
      # @param [Array<String>] paths
      #   The paths to concat.
      #
      def set_load_paths(*paths)
        $LOAD_PATH.concat(paths).uniq!
      end

      def setup_application!
        @_configured ||= begin
          # set_load_paths(*load_paths)
          Padrino.require_dependencies(dependencies, force: true)
          Grape::API.logger = Padrino.logger
          true
        end
      end

      def app_file
        ''
      end

      def public_folder
        ''
      end
    end

    setup_application!

    mount Api::Versions::V1::Mounter
  end
end
