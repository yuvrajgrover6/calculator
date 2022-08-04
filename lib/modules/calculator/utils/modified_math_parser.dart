import 'package:math_expressions/math_expressions.dart';

Map<String, dynamic> functionHandlers = <String, dynamic>{};
Expression parseTokenAndAppendToExpression(List<Token> inputStream) {
  final List<Expression> exprStack = <Expression>[];
  for (var i = 0; i < inputStream.length; i++) {
    Expression currExpr, left, right;
    final currToken = inputStream[i];
    switch (currToken.type) {
      case TokenType.VAL:
        currExpr = Number(double.parse(currToken.text));
        break;
      case TokenType.VAR:
        currExpr = Variable(currToken.text);
        break;
      case TokenType.UNMINUS:
        currExpr = -exprStack.removeLast();
        break;
      case TokenType.PLUS:
        right = exprStack.removeLast();
        left = exprStack.removeLast();
        currExpr = left + right;
        break;
      case TokenType.MINUS:
        right = exprStack.removeLast();
        left = exprStack.removeLast();
        currExpr = left - right;
        break;
      case TokenType.TIMES:
        right = exprStack.removeLast();
        left = exprStack.removeLast();
        currExpr = left * right;
        break;
      case TokenType.DIV:
        right = exprStack.removeLast();
        left = exprStack.removeLast();
        currExpr = left / right;
        break;
      case TokenType.MOD:
        right = exprStack.removeLast();
        left = exprStack.removeLast();
        currExpr = left * right / Number(100);
        break;
      case TokenType.POW:
        right = exprStack.removeLast();
        left = exprStack.removeLast();
        currExpr = left ^ right;
        break;
      case TokenType.EFUNC:
        currExpr = Exponential(exprStack.removeLast());
        break;
      case TokenType.LOG:
        right = exprStack.removeLast();
        left = exprStack.removeLast();
        currExpr = Log(left, right);
        break;
      case TokenType.LN:
        currExpr = Ln(exprStack.removeLast());
        break;
      case TokenType.SQRT:
        currExpr = Sqrt(exprStack.removeLast());
        break;
      case TokenType.ROOT:
        right = exprStack.removeLast();
        left = exprStack.removeLast();
        currExpr = Root.fromExpr(left as Number, right);
        break;
      case TokenType.SIN:
        currExpr = Sin(exprStack.removeLast());
        break;
      case TokenType.COS:
        currExpr = Cos(exprStack.removeLast());
        break;
      case TokenType.TAN:
        currExpr = Tan(exprStack.removeLast());
        break;
      case TokenType.ASIN:
        currExpr = Asin(exprStack.removeLast());
        break;
      case TokenType.ACOS:
        currExpr = Acos(exprStack.removeLast());
        break;
      case TokenType.ATAN:
        currExpr = Atan(exprStack.removeLast());
        break;
      case TokenType.ABS:
        currExpr = Abs(exprStack.removeLast());
        break;
      case TokenType.CEIL:
        currExpr = Ceil(exprStack.removeLast());
        break;
      case TokenType.FLOOR:
        currExpr = Floor(exprStack.removeLast());
        break;
      case TokenType.SGN:
        currExpr = Sgn(exprStack.removeLast());
        break;
      case TokenType.FACTORIAL:
        currExpr = Factorial(exprStack.removeLast());
        break;
      case TokenType.FUNC:
        List<Expression> args = [];
        for (var i = 0; i < currToken.argCount; ++i) {
          args.insert(0, exprStack.removeLast());
        }
        currExpr = AlgorithmicFunction(
            currToken.text, args, functionHandlers[currToken.text]);
        break;
      default:
        throw FormatException('Unsupported token: $currToken');
    }
    exprStack.add(currExpr);
  }
  return exprStack.last;
}
