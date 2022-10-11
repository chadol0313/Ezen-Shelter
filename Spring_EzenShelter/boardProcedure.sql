create or replace procedure boardGetAllCount(
    p_tableName NUMBER,
    p_cnt OUT NUMBER
)
IS
    v_cnt NUMBER;
BEGIN
    if p_tableName = 1 THEN
    select count(*) INTO v_cnt FROM board;
    END IF;
    p_cnt := v_cnt;
END;
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE boardList(
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_rc   OUT     SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_rc FOR
    select * from(
    select * from(
    select rownum as rn, b.*from
    ((SELECT*FROM board ORDER BY b_num DESC)b)
    )where rn>=p_startNum
    )where rn<=p_endNum;
END;
-------------------------------------------------------------------------------
create or replace procedure boardGetAllCount1(
    p_tableName NUMBER,
    p_key IN board.title%TYPE,
    p_cnt OUT NUMBER
)
IS
    v_cnt NUMBER;
BEGIN
    if p_tableName = 1 THEN
    select count(*) INTO v_cnt FROM board where title LIKE '%'||p_key||'%';
    END IF;
    p_cnt := v_cnt;
END;
-------------------------------------------------------------------------------
create or replace procedure boardGetAllCount2(
    p_tableName NUMBER,
    p_key IN board.b_content%TYPE,
    p_cnt OUT NUMBER
)
IS
    v_cnt NUMBER;
BEGIN
    if p_tableName = 1 THEN
    select count(*) INTO v_cnt FROM board where b_content LIKE '%'||p_key||'%';
    END IF;
    p_cnt := v_cnt;
END;
-------------------------------------------------------------------------------
create or replace procedure boardGetAllCount3(
    p_tableName NUMBER,
    p_key IN board.id%TYPE,
    p_cnt OUT NUMBER
)
IS
    v_cnt NUMBER;
BEGIN
    if p_tableName = 1 THEN
    select count(*) INTO v_cnt FROM board where id LIKE '%'||p_key||'%';
    END IF;
    p_cnt := v_cnt;
END;
-------------------------------------------------------------------------------
create or replace PROCEDURE boardList1(
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_key IN board.title%TYPE,
    p_rc   OUT     SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_rc FOR
    select * from(
    select * from(
    select rownum as rn, b.*from
    ((SELECT * FROM board WHERE title LIKE '%'||p_key||'%' ORDER BY B_NUM DESC)b)
    )where rn>=p_startNum
    )where rn<=p_endNum;
END;
-------------------------------------------------------------------------------
create or replace PROCEDURE boardList2(
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_key IN board.b_content%TYPE,
    p_rc   OUT     SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_rc FOR
    select * from(
    select * from(
    select rownum as rn, b.*from
    ((SELECT * FROM board WHERE b_content LIKE '%'||p_key||'%' ORDER BY B_NUM DESC)b)
    )where rn>=p_startNum
    )where rn<=p_endNum;
END;
-------------------------------------------------------------------------------
create or replace PROCEDURE boardList3(
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_key IN board.id%TYPE,
    p_rc   OUT     SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_rc FOR
    select * from(
    select * from(
    select rownum as rn, b.*from
    ((SELECT * FROM board WHERE id LIKE '%'||p_key||'%' ORDER BY B_NUM DESC)b)
    )where rn>=p_startNum
    )where rn<=p_endNum;
END;
-------------------------------------------------------------------------------