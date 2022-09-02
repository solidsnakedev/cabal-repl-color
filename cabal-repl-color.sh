#!/usr/bin/env bash
# High Intensity
GREEN=`echo -e '\033[0;92m'`
RED=`echo -e '\033[0;91m'`
CYAN=`echo -e '\033[0;96m'`
BLUE=`echo -e '\033[0;94m'`
YELLOW=`echo -e '\033[0;93m'`
PURPLE=`echo -e '\033[0;95m'`
RESET=`echo -e '\033[0m'`
# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White


load_failed="s/^Failed, modules loaded:/$RED&$RESET/;"
load_done="s/done.\|Final balances/$GREEN&$RESET/g;"
double_colon="s/::/$YELLOW&$RESET/g;"
right_arrow="s/\->/$YELLOW&$RESET/g;"
right_arrow2="s/=>/$YELLOW&$RESET/g;"
calc_operators="s/[+\-\/*]/$PURPLE&$RESET/g;"
#char="s/'\\?.'/$BLUE&$RESET/g;"
string="s/\"[^\"]*\"/$YELLOW&$RESET/g;"
char="s/'/$YELLOW&$RESET/g;"
#string="s/\"/$YELLOW&$RESET/g;"
parenthesis="s/[{}()]/$GREEN&$RESET/g;"
left_blacket="s/\[\([^09]\)/$RED[$RESET\1/g;"
right_blacket="s/\]/$RED&$RESET/g;"
no_instance="s/^\s*No instance/$RED&$RESET/g;"
interactive="s/^<[^>]*>/$RED&$RESET/g;"
warning="s/warning/$YELLOW&$RESET/g;"
slot="s/Slot /$CYAN&$RESET/g;"
contract_log="s/CONTRACT LOG\|Contract log/$CYAN&$RESET/g;"
user_log="s/USER LOG/$CYAN&$RESET/g;"

cabal repl ${1+"$@"} 2>&1 |\
    sed "$load_failed\
         $load_done\
         $no_instance\
         $interactive\
         $double_colon\
         $right_arrow\
         $right_arrow2\
         $parenthesis\
         $left_blacket\
         $right_blacket\
         $double_colon\
         $calc_operators\
         $string\
         $char\
         $warning\
         $slot\
         $contract_log\
         $user_log\
        "
