# Usage: gawk -f totals.awk input.txt

BEGIN {
    FS = "," # Set the field separator to comma
    print "========================="
    print "Rectangular matrix totals"
    print "========================="
    print "Input file:" FILENAME
}

# Process each line of the input file
{
    # Calculate row totals and handle missing values in the row
    sum = 0
    for (i = 1; i <= NF; i++) {
        sum += $i
    }
    for (i = NF + 1; i <= max_fields; i++) {
        sum += 0 # If there's a missing field, assume its value is 0
    }

    # Update max_fields if needed
    if (NF > max_fields) {
        max_fields = NF
    }

    # Print the row total
    print "Total for row " NR ":" sum

    # Add to the matrix total
    matrix_total += sum

    # Calculate column totals
    for (i = 1; i <= NF; i++) {
        column_totals[i] += $i
    }
}

END {
    # Print the column totals
    for (i = 1; i <= max_fields; i++) {
        print "Total for column " i ":" column_totals[i]
    }

    # Print the matrix total
    print "Total for entire matrix:" matrix_total
}
