package mygolf.model;

public class BoardBean {
	private int board_num;
	private String board_title;
	private String board_content;
	private int board_readcount;
	private int board_ref;
	private int board_lev;
	private int board_seq;
	private String board_date;	
	private int board_evaluation;
	private String board_coursename;
	private String board_picture;
	private String board_del;
	private int num;
	private int course_num;
	
	private String id;
	private String icon;
	
	//private String id;
	

	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public int getBoard_ref() {
		return board_ref;
	}
	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}
	public int getBoard_lev() {
		return board_lev;
	}
	public void setBoard_lev(int board_lev) {
		this.board_lev = board_lev;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date.substring(0, 16);
	}
	public int getBoard_evaluation() {
		return board_evaluation;
	}
	public void setBoard_evaluation(int board_evaluation) {
		this.board_evaluation = board_evaluation;
	}
	public String getBoard_coursename() {
		return board_coursename;
	}
	public void setBoard_coursename(String board_coursename) {
		this.board_coursename = board_coursename;
	}
	public String getBoard_picture() {
		return board_picture;
	}
	public void setBoard_picture(String board_picture) {
		this.board_picture = board_picture;
	}
	public String getBoard_del() {
		return board_del;
	}
	public void setBoard_del(String board_del) {
		this.board_del = board_del;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCourse_num() {
		return course_num;
	}
	public void setCourse_num(int course_num) {
		this.course_num = course_num;
	}
	//public String getId() {
	//	return id;
	//}
	//public void setId(String id) {
	//	this.id = id;
	//}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
}
