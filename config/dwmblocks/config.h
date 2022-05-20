//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {

/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"",  "sb-nettraf",  1,  16}, 
  //  {"",  "volume", 1,  10},
  //{"",  "sb-clock",  60, 1},
  //{"",  "sb-internet", 5,  4},
  //{"",  "sb-internet", 5,  4},
  {"",  "sb-internet", 5,  4},
  {"",  "sb-ram_perc", 1,  4},
  {"",  "sb-cpuload", 1,  8},
  {"",  "sb-process_count", 2,  4},
  {"",  "sb-battery", 5,  3},
  {"",  "sb-clock", 60,  1},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ][ ";
static unsigned int delimLen = 5;
