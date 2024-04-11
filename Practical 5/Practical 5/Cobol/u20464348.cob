        IDENTIFICATION DIVISION.
        PROGRAM-ID. StatisticsProgram.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 arr OCCURS 5 TIMES PIC 9(5).
        01 result PIC 9(5).
        01 i PIC 9(5).
        01 j PIC 9(5).
        01 cnt PIC 9(5).
        01 max-cnt PIC 9(5).
        01 mode-value PIC 9(5).

        PROCEDURE DIVISION.
            DISPLAY "Enter five integer values:"
            PERFORM READ-DATA
            PERFORM CALCULATE-MODE
            DISPLAY "The mode of the array is: ", mode-value
            STOP RUN.

        READ-DATA.
            PERFORM VARYING i FROM 1 BY 1 UNTIL i > 5
                DISPLAY "Enter an integer value: "
                ACCEPT arr(i)
            END-PERFORM.

        CALCULATE-MODE.
            MOVE 0 TO max-cnt
            MOVE 0 TO mode-value

            PERFORM VARYING i FROM 1 BY 1 UNTIL i > 5
                MOVE 0 TO cnt
                PERFORM VARYING j FROM 1 BY 1 UNTIL j > 5
                    IF arr(j) EQUALS TO arr(i)
                        ADD 1 TO cnt
                    END-IF
                END-PERFORM
                IF cnt GREATER THAN max-cnt
                    MOVE cnt TO max-cnt
                    MOVE arr(i) TO mode-value
                END-IF
            END-PERFORM.
