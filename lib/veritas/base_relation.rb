module Veritas

  # A class that represents a base relation in an RDBMS
  class BaseRelation < Relation

    # The base relation name
    #
    # @example
    #   name = base_relation.name
    #
    # @return [String]
    #
    # @api public
    attr_reader :name

    # Initialize a base relation
    #
    # @param [#to_s] name
    #   the relation name
    # @param [Header, #to_ary] header
    #   the relation header
    # @param [Enumerable] tuples
    #   the relation tuples
    #
    # @return [undefined]
    #
    # @api private
    def initialize(name, *args)
      super(*args)
      @name = Immutable.freeze_object(name.to_s)
    end

  end # class BaseRelation
end # module Veritas
