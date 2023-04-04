#include "totvs.ch"
#include "fwmvcdef.ch"
#include "tlpp-object.th"

#define cEOL chr(13)+chr(10)
#define true .T.
#define false .F.
#define null nil

#define X3_USADO "€€€€€€€€€€€€€€€"
#define X3_NUSAD "€€€€€€€€€€€€€€ "
#define X3_OBRIG "€"
#define X3_RESER "þÀ"

#xtranslate strTrim(<nExpr1>) => allTrim(str(<nExpr1>))
#xtranslate transTrim(<nExpr1>, <cExpr2>) => allTrim(transform(<nExpr1>, <cExpr2>))
#xtranslate stringToDate(<cExpr1>) => sToD(strTran(<cExpr1>, "-", ""))

#xcommand if (<uExp1>) \{ <uExp2> \} => if <uExp1>; eval({|| <uExp2>}); endif

#xcommand (<uExp1>) ? <uExp2> : <uExp3> => IIF(<uExp1>, <uExp2>, <uExp3>)

#xcommand DO            => WHILE .T.
#xcommand UNTIL <uExpr> => IF <uExpr>; EXIT; END; END
#xcommand DO UNTIL <uExpr> => WHILE !(<uExpr>)

#xcommand FOREACH <aExpr> KEY <nExpr> VALUE <xExpr> => FOR <nExpr> := 1 TO len(<aExpr>); <xExpr> := <aExpr>\[<nExpr>\]
#xcommand ENDFOREACH => NEXT

#xcommand FOREACH <aExpr> AS <nExpr>, <xExpr> =>;
FOR <nExpr> := 1 TO len(<aExpr>);;
	<xExpr> := <aExpr>\[<nExpr>\]

#xcommand FOR (<xExpr>, <nExpr> OF <aExpr>) =>;
FOR <nExpr> := 1 TO len(<aExpr>);;
        <xExpr> := <aExpr>\[<nExpr>\]
