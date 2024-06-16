// Generated from C:/Users/maz/IdeaProjects/Antlr/src\ifelse.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link sampleParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface sampleVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link sampleParser#start}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStart(sampleParser.StartContext ctx);
	/**
	 * Visit a parse tree produced by {@link sampleParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(sampleParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link sampleParser#ifstatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfstatement(sampleParser.IfstatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link sampleParser#condition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCondition(sampleParser.ConditionContext ctx);
}