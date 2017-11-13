# Table shift

## Usage

```bash
./table_shift_main ./sample.txt ":" "3,4,5,6,7" | tr ":" "\t" > output.csv
```

Import in the spreadsheet, select relevant collumns, render scatter plot

## Tests

```bash
cd table_shift && ./test_all
```
