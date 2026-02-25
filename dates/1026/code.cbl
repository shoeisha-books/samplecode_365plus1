       IDENTIFICATION DIVISION.
         PROGRAM-ID. BIO30.
         DATA DIVISION.
         WORKING-STORAGE SECTION.
         01 BD         PIC 9(8).
         01 TD         PIC 9(8).
         01 DAYS       PIC 9(5).
         01 P          PIC S9(4).
         01 E          PIC S9(4).
         01 I          PIC S9(4).
         PROCEDURE DIVISION.
             DISPLAY "誕生日(YYYYMMDD):"
             ACCEPT BD
             ACCEPT TD FROM DATE YYYYMMDD
             COMPUTE DAYS = FUNCTION INTEGER-OF-DATE(TD)
                        - FUNCTION INTEGER-OF-DATE(BD)
             COMPUTE P = FUNCTION MOD(DAYS 23) * 200 / 23 - 100
             COMPUTE E = FUNCTION MOD(DAYS 28) * 200 / 28 - 100
             COMPUTE I = FUNCTION MOD(DAYS 33) * 200 / 33 - 100
             DISPLAY "バイオリズム"
             DISPLAY " 身体: " P
             DISPLAY " 感情: " E
             DISPLAY " 知性: " I
             STOP RUN.