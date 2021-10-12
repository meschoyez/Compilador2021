package compiladores2021;

import compiladores2021.compiladorParser.InstruccionContext;
import compiladores2021.compiladorParser.InstruccionesContext;
import compiladores2021.compiladorParser.ProgramaContext;

public class MiVisitor<ParseTree> extends compiladorBaseVisitor<ParseTree> {

    @Override
    public ParseTree visitPrograma(ProgramaContext ctx) {
        // TODO Auto-generated method stub
        System.out.println("Visitando primer nodo");
        return super.visitPrograma(ctx);
    }
    
    @Override
    public ParseTree visitInstrucciones(InstruccionesContext ctx) {
        // TODO Auto-generated method stub
        System.out.println("  --  Instrucciones");
        System.out.println("  --    tengo " + ctx.getChildCount() + " hijos");
        System.out.println("  --    |" + ctx.getText() + "|");
        // return (ParseTree)ctx;
        return super.visitInstrucciones(ctx);
    }
    
    @Override
    public ParseTree visitInstruccion(InstruccionContext ctx) {
        // TODO Auto-generated method stub
        System.out.println("  ##  Instruccion");
        System.out.println("  ##    tengo " + ctx.getChildCount() + " hijos");
        System.out.println("  ##    |" + ctx.getText() + "|");
        return super.visitInstruccion(ctx);
    }

    
}
