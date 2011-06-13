module Tasker
  class Namespace
    attr_reader :name, :options, :block, :tasks

    def self.all
      @namespaces ||= []
    end

    def self.add_namespace( ns )
      @namespaces ||= []
      @namespaces << ns
    end

    def initialize( name, options = {}, &block )
      @tasks = []
      @name = name
      @options = options
      @block = block
      
      self.class.add_namespace( self )
    end

    def execute
      @block.call if @block
    end

    def register_task( task )
      @tasks << task
    end

  end
end
