      PROGRAM StatisticProgram
      INTEGER arr(5)
      INTEGER result

      ! Call the subroutine to read data
      CALL readData(arr)

      ! Call the function to calculate the mode
      result = mode(arr)

      ! Print the result
      WRITE(*, *) "The mode of the values is:", result

      CONTAINS

      SUBROUTINE readData(arr)
      INTEGER arr(:)
      INTEGER i

      ! Prompt the user for input
      WRITE(*, *) "Enter five integer values:"

      ! Read the values into the array
      DO i = 1, 5
            READ(*, *) arr(i)
      END DO
      END SUBROUTINE readData

      FUNCTION mode(arr)
      INTEGER arr(:)
      INTEGER count(100)
      INTEGER i, max_count, mode_value

      ! Initialize count array
      count = 0

      ! Count occurrences of each value
      DO i = 1, 5
            count(arr(i)) = count(arr(i)) + 1
      END DO

      ! Find the maximum count
      max_count = MAXVAL(count)

      ! Find the mode value(s)
      mode_value = 0
      DO i = 1, 100
            IF (count(i) == max_count) THEN
                  mode_value = i
                  EXIT
            END IF
      END DO

      ! Return the mode value
      mode = mode_value
      END FUNCTION mode

      END PROGRAM StatisticProgram
