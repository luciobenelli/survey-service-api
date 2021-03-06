CREATE SEQUENCE SEQ_ANSWER_ID START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE ORDER;

CREATE TABLE ANSWER(ID NUMBER(38) NOT NULL,
                    RESPONSE_ID NUMBER(38) NOT NULL,
                    QUESTION_ID NUMBER(38) NOT NULL,
                    CHOICE_ID NUMBER(38) NOT NULL,
                    CONSTRAINT PK_ANSWER PRIMARY KEY (ID),
                    CONSTRAINT FK_ANSWER_RESPONSE_ID FOREIGN KEY(RESPONSE_ID) REFERENCES RESPONSE(ID),
                    CONSTRAINT FK_ANSWER_QUESTION_ID FOREIGN KEY(QUESTION_ID) REFERENCES QUESTION(ID),
                    CONSTRAINT FK_ANSWER_CHOICE_ID FOREIGN KEY(CHOICE_ID) REFERENCES CHOICE(ID)
                   );

COMMENT ON TABLE ANSWER IS 'Contains the answer information.';

COMMENT ON COLUMN ANSWER.ID IS 'Unique table identifier. Incremented using SEQ_ANSWER_ID';
COMMENT ON COLUMN ANSWER.QUESTION_ID IS 'Foreign key to QUESTION.ID';
COMMENT ON COLUMN ANSWER.CHOICE_ID IS 'Foreign key to CHOICE.ID';
