PARAMETERS: p_num TYPE int2.
IF p_num IS INITIAL.
    MESSAGE: 'Input cannot be empty' TYPE 'I'.
ELSEIF p_num MOD 2 EQ 0.
    WRITE 'Even'.
ELSEIF p_num MOD 2 <> 0.
    WRITE 'Odd'.
ENDIF.


