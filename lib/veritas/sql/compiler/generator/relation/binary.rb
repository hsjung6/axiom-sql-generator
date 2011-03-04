module Veritas
  module SQL
    module Compiler
      module Generator
        class Relation

          # Generates an SQL statement for a Binary relation
          class Binary < Relation
            include Attribute

            JOIN    = 'NATURAL JOIN'.freeze
            PRODUCT = 'CROSS JOIN'.freeze

            # Return the table expression for the generator and identifier
            #
            # @param [#to_inner] generator
            #
            # @return [#to_s]
            #
            # @api private
            def self.table_expression(generator, *)
              generator.kind_of?(Base) ? generator.to_inner : super
            end

            # Visit an Join
            #
            # @param [Algebra::Join] join
            #
            # @return [self]
            #
            # @api private
            def visit_veritas_algebra_join(join)
              set_operation(JOIN)
              set_columns(join)
              set_operands(join)
              set_name
              self
            end

            # Visit an Product
            #
            # @param [Algebra::Product] product
            #
            # @return [self]
            #
            # @api private
            def visit_veritas_algebra_product(product)
              set_operation(PRODUCT)
              set_columns(product)
              set_operands(product)
              set_name
              self
            end

            # Return the SQL for the binary relation
            #
            # @example
            #   sql = binary_relation.to_s
            #
            # @return [#to_s]
            #
            # @api public
            def to_s
              generate_sql(@columns)
            end

            # Return the SQL suitable for an inner query
            #
            # @return [#to_s]
            #
            # @api private
            def to_inner
              generate_sql('*')
            end

          private

            # Generate the SQL using the supplied columns
            #
            # @param [String] columns
            #
            # @return [#to_s]
            #
            # @api private
            def generate_sql(columns)
              return EMPTY_STRING unless visited?
              "SELECT #{columns} FROM #{left_table_expression} #{@operation} #{right_table_expression}"
            end

            # Return the left table expression
            #
            # @return [#to_s]
            #
            # @api private
            def left_table_expression
              self.class.table_expression(@left, 'left')
            end

            # Return the right table expression
            #
            # @return [#to_s]
            #
            # @api private
            def right_table_expression
              self.class.table_expression(@right, 'right')
            end

            # Set the operation
            #
            # @param [#to_s] operation
            #
            # @return [undefined]
            #
            # @api private
            def set_operation(operation)
              @operation = operation
            end

            # Set the columns from the relation
            #
            # @param [Relation::Operation::Binary] relation
            #
            # @return [undefined]
            #
            # @api private
            def set_columns(relation)
              @columns = columns_for(relation)
            end

            # Set the operands from the relation
            #
            # @param [Relation::Operation::Binary] relation
            #
            # @return [undefined]
            #
            # @api private
            def set_operands(relation)
              @left  = operand_dispatch(relation.left)
              @right = operand_dispatch(relation.right)
            end

            # Set the name using the operands' name
            #
            # @return [undefined]
            #
            # @api private
            def set_name
              @name = [ @left.name, @right.name ].uniq.join('_').freeze
            end

            # Return a list of columns in a header
            #
            # @param [Veritas::Relation] relation
            #
            # @return [#to_s]
            #
            # @api private
            def columns_for(relation)
              relation.header.map { |attribute| dispatch(attribute) }.join(SEPARATOR)
            end

            # Dispatch the operand to the proper handler
            #
            # @param [Visitable] visitable
            #
            # @return [Generator]
            #
            # @api private
            def operand_dispatch(visitable)
              case visitable
                when Veritas::Algebra::Join, Veritas::Algebra::Product
                  self.class.new.visit(visitable)
                else
                  dispatch(visitable)
              end
            end

            # Visit a Set Relation
            #
            # @param [Veritas::Relation::Operation::Set] set
            #
            # @return [Relation::Set]
            #
            # @api private
            def visit_veritas_relation_operation_set(set)
              Set.new.visit(set)
            end

            # Visit a Unary Relation
            #
            # @param [Veritas::Relation::Operation::Unary] unary
            #
            # @return [Relation::Unary]
            #
            # @api private
            def visit_veritas_relation_operation_unary(unary)
              Unary.new.visit(unary)
            end

            # Visit a Base Relation
            #
            # @param [Veritas::BaseRelation] base_relation
            #
            # @return [Relation::Base]
            #
            # @api private
            def visit_veritas_base_relation(base_relation)
              Base.new.visit(base_relation)
            end

            # Generates an SQL statement for base relation binary operands
            class Base < Relation
              include Identifier

              # Visit a Base Relation
              #
              # @param [Veritas::BaseRelation] base_relation
              #
              # @return [self]
              #
              # @api private
              def visit_veritas_base_relation(base_relation)
                @name = base_relation.name
                @from = visit_identifier(@name)
                self
              end

              # Return the SQL suitable for an inner query
              #
              # @return [#to_s]
              #
              # @api private
              def to_inner
                visited? ? @from : EMPTY_STRING
              end

            end # class Base
          end # class Binary
        end # class Relation
      end # module Generator
    end # module Compiler
  end # module SQL
end # module Veritas
