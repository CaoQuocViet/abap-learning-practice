PARAMETERS: p_inp TYPE c.
IF p_inp CA 'A,E,I,O,U'. " contains any
    WRITE: 'A Vowel'.
ELSE.
    WRITE: 'A Consonant'.
ENDIF.