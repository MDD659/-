package cn.wyu.pojo;

public class NoticeInf {
	private Integer id;
	private String title;
	private String noticename;
	private String matter;
	
	public String getMatter() {
		return matter;
	}
	public void setMatter(String matter) {
		 this.matter = matter == null ? null : matter.trim();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		 this.title = title == null ? null : title.trim();
	}
	public String getNoticename() {
		return noticename;
	}
	public void setNoticename(String noticename) {
		 this.noticename = noticename == null ? null : noticename.trim();
	}
	

}
