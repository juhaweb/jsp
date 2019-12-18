package kr.co.jcinema.config;

public class SQL {

	
	// 제이시네마
	
	// 회원가입
	public static final String INSERT_MEMBER  = "INSERT INTO `JC_MEMBER` SET "
											+ "`user_id`=?,"
											+ "`user_pass`=PASSWORD(?),"
											+ "`user_name`=?,"
											+ "`user_email`=?,"
											+ "`user_tel`=?,"
											+ "`user_hp`=?,"
											+ "`user_grade`=?,"
											+ "`user_point`=100,"
											+ "`user_addr_type`=?,"
											+ "`user_zip`=?,"
											+ "`user_addr_main`=?,"
											+ "`user_addr_detail`=?,"
											+ "`user_regip`=?,"
											+ "`user_rdate`=NOW();";
	
	public static final String UPDATE_MEMBER  = "UPDATE `JC_MEMBER` SET "
											+ "`user_pass`=PASSWORD(?),"
											+ "`user_name`=?,"
											+ "`user_tel`=?,"
											+ "`user_addr_type`=?,"
											+ "`user_zip`=?,"
											+ "`user_addr_main`=?,"
											+ "`user_addr_detail`=?,"
											+ "`user_agree_point`=?,"
											+ "`user_agree_site`=?, "
											+ "WHERE `user_id`=?;";
	
	
	public static final String SELECT_TERMS = "SELECT * FROM `JC_TERMS`;";

	public static final String SELECT_CHECK_UID = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `user_id`=? ";
	public static final String SELECT_CHECK_EMAIL = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `user_email`=? ";
	public static final String SELECT_CHECK_HP = "SELECT COUNT(*) FROM `JC_MEMBER` WHERE `user_hp`=? ";
	
	
	// 회원로그인
	public static final String SELECT_LOGIN = "SELECT * FROM `JC_MEMBER` WHERE `user_id`=? AND `user_pass`=PASSWORD(?);";
	
	
	
	
	
	// 예매관련(티켓)
	
	
	
	
	// 영화관련
	public static final String SELECT_POSTERS = "SELECT `movie_no`, `movie_title`,`movie_poster` FROM `JC_MOVIE` ORDER BY `movie_release_date` DESC LIMIT 10; ";
	
	
	
	
	// 관리자페이지
	// 관리자 api
	public static final String SELECT_THEATER = "SELECT `theater_no`,`theater_local_code`,`theater_name` FROM `JC_THEATER` WHERE `theater_city`=?; ";
	public static final String SELECT_SCREEN = "SELECT * FROM `JC_SCREEN` WHERE `screen_theater_no`=?; ";
	
	
	
	
	
	
	
	
	
	
	
	//   아래는 수정전.★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ 
	
	public static final String INSERT_USER  = "INSERT INTO `JC_MEMBER` SET "
								  + "`uid`=?,"
								  + "`pass`=PASSWORD(?),"
								  + "`name`=?,"
								  + "`nick`=?,"
								  + "`email`=?,"
								  + "`hp`=?,"
								  + "`zip`=?,"
								  + "`addr1`=?,"
								  + "`addr2`=?,"
								  + "`regip`=?,"
								  + "`rdate`=NOW();";
	
	   
	// 게시물관련
	
	public static final String SELECT_ARTICLE_TOTAL = "SELECT COUNT(*) FROM `JC_ARTICLE` WHERE `parent`=0";
	
	public static final String SELECT_ARTICLE_LIST = "SELECT a.*, b.nick FROM `JC_ARTICLE` AS a "
												   + "JOIN `JC_MEMBER` AS b "
												   + "ON a.uid = b.uid "
												   + "WHERE a.parent = 0 "
												   + "ORDER BY seq DESC "
												   + "LIMIT ?, 10";
	
	// public static final String SELECT_ARTICLE_VIEW = "SELECT * FROM `JC_ARTICLE` WHERE `seq`=?";
	public static final String SELECT_ARTICLE_VIEW = "SELECT * FROM `JC_ARTICLE` AS a "
													+ "LEFT JOIN `JC_FILE` AS b "
													+ "ON a.seq = b.parent "
													+ "WHERE a.seq=? ";
			
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `JC_ARTICLE` SET `hit`=`hit`+1 WHERE `seq`=?; ";
	
	public static final String INSERT_ARTICLE = "INSERT INTO `JC_ARTICLE` SET "
										      + "`parent`=?,"
										      + "`cate`=?,"
										      + "`title`=?,"
										      + "`content`=?,"
										      + "`file`=?,"
										      + "`uid`=?,"
										      + "`regip`=?,"
										      + "`rdate`=NOW();";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(seq) FROM `JC_ARTICLE`";
	
	public static final String SELECT_FILE = "SELECT * FROM `JC_FILE` WHERE `parent`=?";
	
	public static final String UPDATE_FILE_COUNT = "UPDATE `JC_FILE` SET `download`=`download`+1 WHERE `parent`=?";	
	
	public static final String INSERT_FILE = "INSERT INTO `JC_FILE` SET "
											+ "`parent`=?, "
											+ "`oldName`=?, "
											+ "`newName`=?, "
											+ "`rdate`=NOW()";
	public static final String DELETE_FILE = "DELETE FROM `JC_FILE` WHERE `parent`=? ";

	public static final String UPDATE_MODIFY_ARTICLE = "UPDATE `JC_ARTICLE` SET `title`=?, `content`=? WHERE `seq`=?";
	public static final String UPDATE_ARTICLE_DELETE = "DELETE FROM `JC_ARTICLE` WHERE `seq`=? ";

	
	public static final String SELECT_COMMENT_LIST = "SELECT * FROM `JC_ARTICLE` WHERE `parent`=?";
	public static final String INSERT_COMMENT = "INSERT INTO `JC_ARTICLE` SET "
											  + "`parent`=?, "
											  + "`content`=?, "
											  + "`uid`=?, "
											  + "`regip`=?, "
											  + "`rdate`=NOW()"; 
	
	public static final String UPDATE_COMMENT_COUNT  = "UPDATE `JC_ARTICLE` SET `comment`=`comment`+1 WHERE `seq`=?";
	
	
	
	
	
	
	
}
