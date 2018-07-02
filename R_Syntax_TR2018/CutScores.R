library(datapasta)
cut_ela <- tibble::tribble(
  ~Grade,	~`Level 1`,	~`Level 2`,	~`Level 3`,	~`Level 4`,
  3,  "191 or below",	"192 - 212", "213 - 227",	"228 or above",
  4,  "199 or below",	"200 - 212", "213 - 227",	"228 or above",
  5,  "201 or below",	"202 - 219", "220 - 231",	"232 or above",
  6,  "204 or below",	"205 - 219", "220 - 232",	"233 or above",
  7,  "207 or below",	"208 - 221", "222 - 235",	"236 or above",
  8,  "212 or below",	"213 - 223", "224 - 235",	"236 or above",
  11, "898 or below",	"899 - 919", "920 - 926",	"927 or above"
) 
  knitr::kable(cut_ela)
  
cut_math <- tibble::tribble(
  ~Grade,	~`Level 1`,	~`Level 2`,	~`Level 3`,	~`Level 4`,
  3,  "191 or below", "192 - 200", "201 - 217",	"218 or above",
  4,  "192 or below", "193 - 205", "206 - 218",	"219 or above",
  5,  "192 or below", "193 - 205", "206 - 219",	"220 or above",
  6,  "203 or below", "204 - 207", "208 - 221",	"222 or above",
  7,  "206 or below", "207 - 208", "209 - 222",	"223 or above",
  8,  "207 or below", "208 - 211", "212 - 225",	"226 or above",
  11, "900 or below", "901 - 906", "907 - 921",	"922 or above"
) 
knitr::kable(cut_math)

cut_science <- tibble::tribble (
  ~Grade,	~`Level 1`,	~`Level 2`,	~`Level 3`,	~`Level 4`,
5, "505 or below", "506 - 516", "517 - 529", "530 or above",
8, "809 or below", "810 - 819", "820 - 830", "831 or above",
11, "900 or below", "901 - 913", "914 - 928", "929 or above"
) 
knitr::kable(cut_science)
