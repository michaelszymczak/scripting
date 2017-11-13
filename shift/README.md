# Table shift

## Usage

```bash
./table_shift_main ./sample.txt ":" "3,4,5,6,7" | tr ":" "\t" > output.csv
```

Import in the spreadsheet, select relevant collumns, render scatter plot


## Known shortcomings

There has to be only one value (collumn) after the relevant key.
For instance, if key generating relevant collumns are "2,3", the only value
collumn should be the 4th collumn. There is no limit regarding how many collumns generate
the key or number of collumns before the key collumns.

## Tests

```bash
cd table_shift && ./test_all
```
