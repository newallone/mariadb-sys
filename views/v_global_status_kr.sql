#
# Only for Korean
#
# Name: v$global_status_kr
# Author: YJ
# Date: 2016.08.08
# Desc: information_schema.global_status 시스템뷰에 한국어 설명을 덧붙여서 보여줌
# 
# MariaDB [sys]> select * from v$global_status_kr;
# +-------------------+----------------+------------------------------------------------------------------------------+
# | variable_name     | variable_value | variable_desc_kr                                                             |
# +-------------------+----------------+------------------------------------------------------------------------------+
# | ABORTED_CLIENTS   | 69             | 연결을 닫지 않고 클라이언트가 죽어서 중지된 연결의 수                        |
# | ABORTED_CONNECTS  | 303382         | MySQL 서버에 연결 실패한 횟수                                                |
# ...
# | COM_INSERT_SELECT | 22305          | INSERT ... SELECT ... 쿼리 실행횟수                                          |
# | COM_LOAD          | 0              | LOAD 쿼리 실행횟수                                                           |
# +-------------------+----------------+------------------------------------------------------------------------------+
#
CREATE OR REPLACE
ALGORITHM=UNDEFINED 
DEFINER = 'root'@'localhost'
SQL SECURITY INVOKER
VIEW `v$global_status_kr`
AS
SELECT variable_name,
       variable_value,
       CASE variable_name
          WHEN 'BINLOG_CACHE_USE'
          THEN '바이너리 로그 캐시를 사용한 트랜잭션 수'
          WHEN 'BINLOG_CACHE_DISK_USE'
          THEN '트랜잭션의 구문을 임시로 저장하기 위해 바이너리 로그 캐시를 사용했지만 binlog_cache_size 값을 넘어버려 임시 파일을 사용한 트랜잭션 수'
          WHEN 'QUESTIONS'
          THEN '전체 쿼리 실행횟수(제외대상: COM_PING/ COM_STMT_REPREPARE/ COM_STMT_CLOSE/ COM_STMT_RESET 횟수, stored program 내부에서 실행하는 쿼리'
          WHEN 'COM_SELECT'
          THEN 'SELECT 쿼리 실행횟수'
          WHEN 'COM_DELETE'
          THEN 'DELETE 쿼리 실행횟수'
          WHEN 'COM_INSERT'
          THEN 'INSERT 쿼리 실행횟수'
          WHEN 'COM_UPDATE'
          THEN 'UPDATE 쿼리 실행횟수'
          WHEN 'COM_REPLACE'
          THEN 'REPLACE 쿼리 실행횟수'
          WHEN 'COM_LOAD'
          THEN 'LOAD 쿼리 실행횟수'
          WHEN 'COM_DELETE_MULTI'
          THEN 'DELETE(다중테이블) 쿼리 실행횟수'
          WHEN 'COM_INSERT_SELECT'
          THEN 'INSERT ... SELECT ... 쿼리 실행횟수'
          WHEN 'COM_UPDATE_MULTI'
          THEN 'UPDATE(다중테이블) 쿼리 실행횟수'
          WHEN 'COM_REPLACE_SELECT'
          THEN 'REPLACE ... SELECT ... 쿼리 실행횟수'
          WHEN 'MAX_USED_CONNECTIONS'
          THEN '최대로 동시 접속했던 접속자 수'
          WHEN 'ABORTED_CLIENTS'
          THEN '연결을 닫지 않고 클라이언트가 죽어서 중지된 연결의 수'
          WHEN 'ABORTED_CONNECTS'
          THEN 'MySQL 서버에 연결 실패한 횟수'
          WHEN 'THREADS_CONNECTED'
          THEN '현재 오픈된 커넥션 수'
          WHEN 'CONNECTIONS'
          THEN '연결 시도된 총 커넥션 수'
          WHEN 'OPEN_TABLES'
          THEN '현재 오픈된 테이블 수'
          WHEN 'OPEN_STREAMS'
          THEN '열린 스트림 수 (주로 로그 남기기용)'
          WHEN 'OPEN_FILES'
          THEN '현재 오픈된 파일 수'
          WHEN 'OPENED_FILES'
          THEN '현재까지 오픈된 파일 수. 열린 테이블이 많다면, 테이블 캐시값이 작은 경우일 수도 있음'
          WHEN 'HANDLER_WRITE'
          THEN '1행을 쓰기위한 요청 횟수'
          WHEN 'HANDLER_UPDATE'
          THEN '1행을 업데이트하기 위한 요청 횟수'
          WHEN 'HANDLER_DELETE'
          THEN '1행을 삭제하기 위한 횟수'
          WHEN 'HANDLER_READ_FIRST'
          THEN '인덱스의 첫 번째 키 값을 FETCH한 횟수'
          WHEN 'HANDLER_READ_KEY'
          THEN '단일 행의 인덱스 키 값을 읽은 횟수'
          WHEN 'HANDLER_READ_NEXT'
          THEN '인덱스의 후속 행의 키 값을 읽은 횟수'
          WHEN 'HANDLER_READ_PREV'
          THEN '인덱스의 이전 행의 키를 읽은 횟수'
          WHEN 'HANDLER_READ_RND'
          THEN '고정된 위치의 특정 행을 읽은 횟수'
          WHEN 'HANDLER_READ_RND_NEXT'
          THEN '고정된 위치의 특정 행에 대한 후속 행 읽기 횟수'
          WHEN 'BYTES_SENT'
          THEN '모든 클라이언트에게 송신한 데이터 전송량'
          WHEN 'BYTES_RECEIVED'
          THEN '모든 클라이언트로부터 수신한 데이터 전송량'
          WHEN 'SLAVE_RUNNING'
          THEN '슬레이브 실행 상태'
          WHEN 'SLAVE_OPEN_TEMP_TABLES'
          THEN 'SQL 쓰레드가 현재 오픈한 임시 테이블 개수'
          WHEN 'SLAVE_RETRIED_TRANSACTIONS'
          THEN 'SQL 쓰레드가 트랜잭션을 재시도한 횟수'
          WHEN 'SELECT_FULL_JOIN'
          THEN '인덱스를 사용하지 않은 조인의 수. 0에 근접할 수록 좋음'
          WHEN 'SELECT_FULL_RANGE_JOIN'
          THEN '레퍼런스 테이블의 레인지 검색에 사용된 조인의 수'
          WHEN 'SELECT_RANGE'
          THEN 'SELECT RANGE 횟수'
          WHEN 'SELECT_RANGE_CHECK'
          THEN 'SELECT RANGE CHECK 횟수'
          WHEN 'SELECT_SCAN'
          THEN '첫번째 테이블을 풀스캔한 조인의 갯수'
          WHEN 'SORT_ROWS'
          THEN '정렬한 전체 레코드 수'
          WHEN 'SORT_RANGE'
          THEN '인덱스 레인지 스캔 결괄에 대한 정렬 작업 횟수'
          WHEN 'SORT_MERGE_PASSES'
          THEN '멀티 머지 처리 횟수'
          WHEN 'SORT_SCAN'
          THEN '전체 테이블 스캔 결과에 대한 정렬 작업 횟수'
          WHEN 'TABLE_LOCKS_IMMEDIATE'
          THEN '즉시 획득한 테이블 락(Lock) 횟수'
          WHEN 'TABLE_LOCKS_WAITED'
          THEN '테이블 락(Lock)을 즉시 획득하지 못하고 대기해서 획득한 횟수'
          WHEN 'SLOW_QUERIES'
          THEN '슬로우 쿼리 발생 횟수'
          WHEN 'CREATED_TMP_TABLES'
          THEN '구문을 실행하는 동안 서버가 메모리에 임시로 생성한 테이블 수'
          WHEN 'CREATED_TMP_DISK_TABLES'
          THEN '구문을 실행하는 동안 서버가 디스크에 임시로 생성한 테이블 수. 만약 Created_tmp_disk_tables 값이 크면, tmp_table_size 값을 늘려서 임시 테이블을 디스크에 생성하지 않고 메모리에 생성하도록 할 수도 있음'
          WHEN 'CREATED_TMP_FILES'
          THEN 'mysqld가 생성한 임시파일의 갯수'
          WHEN 'DELAYED_ERRORS'
          THEN '어떤 오류(중복된 키 등)로 인해 INSERT DELAYED로 기록된 행의 수'
          WHEN 'NOT_FLUSHED_DELAYED_ROWS'
          THEN 'INSERT DELAYED 큐에서 쓰기 작업을 대기중인 행의 수'
          WHEN 'THREADS_RUNNING'
          THEN '현재 할동중인 쓰레드 수'
          WHEN 'THREADS_CREATED'
          THEN '커넥션을 맺기 위해 생성된 쓰레드 수'
          WHEN 'THREADS_CACHED'
          THEN '쓰레드 캐시에 있는 쓰레드 수'
          WHEN 'HANDLER_COMMIT'
          THEN '내부의 커밋 횟수'
          WHEN 'HANDLER_ROLLBACK'
          THEN '롤백 요청 횟수'
          WHEN 'HANDLER_SAVEPOINT'
          THEN '세이브포인트 요청 횟수'
          WHEN 'HANDLER_SAVEPOINT_ROLLBACK'
          THEN '세이브포인트로의 롤백 요청 횟수'
          WHEN 'INNODB_PAGES_CREATED'
          THEN 'InnoDB 신규 생성한 페이지 갯수'
          WHEN 'INNODB_PAGES_READ'
          THEN 'InnoDB 읽은 페이지 갯수'
          WHEN 'INNODB_PAGES_WRITTEN'
          THEN 'InnoDB 쓴 페이지 갯수'
          WHEN 'INNODB_BUFFER_POOL_READ_REQUESTS'
          THEN 'InnoDB 버퍼 풀 읽기 요청 횟수'
          WHEN 'INNODB_BUFFER_POOL_READS'
          THEN 'InnoDB 버퍼 풀 읽은 횟수'
          WHEN 'INNODB_BUFFER_POOL_PAGES_TOTAL'
          THEN 'InnoDB 버퍼 풀 사이즈(페이지 수)'
          WHEN 'INNODB_BUFFER_POOL_PAGES_DATA'
          THEN '데이터가 존재하는 InnoDB 버퍼 풀 사이즈(페이지 수)'
          WHEN 'INNODB_BUFFER_POOL_PAGES_FREE'
          THEN '데이터가 존재하지 않는 InnoDB 버퍼 풀 사이즈(페이지 수) '
          WHEN 'INNODB_BUFFER_POOL_PAGES_DIRTY'
          THEN '디스크에 저장이 필요한 페이지 수 = InnoDB 버퍼 풀의 데이터 중 변경된 페이지'
          WHEN 'INNODB_CHECKPOINT_AGE'
          THEN '플러시되지 않은 변경된 페이지 사이즈'
          WHEN 'INNODB_DATA_FSYNCS'
          THEN 'InnoDB 스토리지 엔진의 fsync() 호출에 의한 파일 동기화 횟수'
          WHEN 'INNODB_DATA_PENDING_FSYNCS'
          THEN '현재 미완료된 fsync() 작업의 갯수'
          WHEN 'INNODB_DATA_PENDING_READS'
          THEN '현재 미완료된 읽기 작업의 갯수'
          WHEN 'INNODB_DATA_PENDING_WRITES'
          THEN '현재 미완료된 쓰기 작업의 갯수'
          WHEN 'INNODB_DATA_READ'
          THEN '현재까지 읽은 데이터의 바이트 수'
          WHEN 'INNODB_DATA_READS'
          THEN '데이터를 읽은 총 횟수'
          WHEN 'INNODB_DATA_WRITES'
          THEN '데이터를 쓴 총 횟수'
          WHEN 'INNODB_DATA_WRITTEN'
          THEN '현재까지 쓴 데이터의 바이트 수'
          WHEN 'INNODB_DBLWR_PAGES_WRITTEN'
          THEN '이중쓰기 작업으로 쓰여진 페이지 수'
          WHEN 'INNODB_DBLWR_WRITES'
          THEN '이중쓰기 작업이 수행된 횟수'
          WHEN 'INNODB_IBUF_MERGED_INSERTS'
          THEN 'INSERT에 대한 인서트 버퍼 병합 횟수'
          WHEN 'INNODB_IBUF_MERGED_DELETES'
          THEN 'DELETE에 대한 인서트 버퍼 병합 횟수'
          WHEN 'INNODB_IBUF_MERGED_DELETE_MARKS'
          THEN 'DELETE에 대한 인서트 버퍼 병합 횟수'
          WHEN 'INNODB_IBUF_SEGMENT_SIZE'
          THEN '인서트 버퍼의 총 세그먼트 갯수'
          WHEN 'INNODB_IBUF_SIZE'
          THEN '사용 중인 인서트 버퍼 세그먼트 갯수'
          WHEN 'INNODB_IBUF_FREE_LIST'
          THEN '사용 중이지 않은 인서트 버퍼 세그먼트 갯수'
          WHEN 'INNODB_ROW_LOCK_TIME'
          THEN '행 단위 락 발생시간'
          WHEN 'INNODB_ROW_LOCK_TIME_MAX'
          THEN '행에 대한 락을 획득하기 위해 기다릴 최대 시간 (밀리초)'
          WHEN 'INNODB_ROW_LOCK_WAITS'
          THEN '행 단위 락 대기 횟수'
          WHEN 'INNODB_ROWS_READ'
          THEN '읽은 행 갯수'
          WHEN 'INNODB_ROWS_DELETED'
          THEN '삭제된 행 갯수'
          WHEN 'INNODB_ROWS_UPDATED'
          THEN '변경된 행 갯수'
          WHEN 'INNODB_ROWS_INSERTED'
          THEN '입력된 행 갯수'
          WHEN 'INNODB_MUTEX_SPIN_ROUNDS'
          THEN '쓰레드가 Spin Waiting 상태에서 뮤텍스를 체크한 횟수'
          WHEN 'INNODB_MUTEX_SPIN_WAITS'
          THEN '쓰레드가 뮤텍스 획득을 시도한 횟수'
          WHEN 'INNODB_MUTEX_OS_WAITS'
          THEN '쓰레드가 Spin Waiting을 포기하고 유휴 상태로 변경된 횟수'
          WHEN 'QCACHE_FREE_BLOCKS'
          THEN '쿼리 캐시에 비어있는 메모리 블럭 수. 숫자가 크다면 파편화 문제가 있을 수 있으며, FLUSH QUERY CACHE 구문으로 해결할 할 수도 있음'
          WHEN 'QCACHE_FREE_MEMORY'
          THEN '쿼리 캐시의 빈 메모리 양.'
          WHEN 'QCACHE_HITS'
          THEN '쿼리 캐시 히트 수'
          WHEN 'QCACHE_INSERTS'
          THEN '쿼리 캐시에 추가된 쿼리의 수'
          WHEN 'QCACHE_LOWMEM_PRUNES'
          THEN '쿼리 캐시에 새 쿼리를 캐시하기 위해 메모리에서 삭제된 캐시의 수. 쿼리캐시는 LRU 알고리즘을 사용하여 삭제할 쿼리를 선택함'
          WHEN 'QCACHE_NOT_CACHED'
          THEN '쿼리 캐시에 캐시되지 않은 쿼리의 수(캐시 불가능한 것 또는 query_cache_type 설정때문에 캐시되지 않은 것)'
          WHEN 'QCACHE_QUERIES_IN_CACHE'
          THEN '쿼리 캐시에 등록된 쿼리 수'
          WHEN 'QCACHE_TOTAL_BLOCKS'
          THEN '쿼리 캐시의 총 블럭 수'
          WHEN 'KEY_READ_REQUESTS'
          THEN '키 블럭 읽기 요청 횟수'
          WHEN 'KEY_READS'
          THEN '키 블럭 읽기 요청 시 디스크에서 읽은 횟수'
          WHEN 'KEY_WRITE_REQUESTS'
          THEN '키 블럭 쓰기 요청 횟수'
          WHEN 'KEY_WRITES'
          THEN '키 블럭 쓰기 요청 시 디스크에 쓴 횟수'
       END AS variable_desc_kr
  FROM information_schema.GLOBAL_STATUS
;
