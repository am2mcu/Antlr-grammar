// Generated from C:/Users/maz/IdeaProjects/Antlr/src\ifelse.g4 by ANTLR 4.12.0
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link sampleParser}.
 */
public interface sampleListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link sampleParser#start}.
	 * @param ctx the parse tree
	 */
	void enterStart(sampleParser.StartContext ctx);
	/**
	 * Exit a parse tree produced by {@link sampleParser#start}.
	 * @param ctx the parse tree
	 */
	void exitStart(sampleParser.StartContext ctx);
	/**
	 * Enter a parse tree produced by {@link sampleParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(sampleParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link sampleParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(sampleParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link sampleParser#ifstatement}.
	 * @param ctx the parse tree
	 */
	void enterIfstatement(sampleParser.IfstatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link sampleParser#ifstatement}.
	 * @param ctx the parse tree
	 */
	void exitIfstatement(sampleParser.IfstatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link sampleParser#condition}.
	 * @param ctx the parse tree
	 */
	void enterCondition(sampleParser.ConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link sampleParser#condition}.
	 * @param ctx the parse tree
	 */
	void exitCondition(sampleParser.ConditionContext ctx);
}