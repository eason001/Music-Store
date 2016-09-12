package cs636.music.domain;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the DOWNLOAD database table.
 * 
 */
@Entity
@NamedQuery(name="Download.findAll", query="SELECT d FROM Download d")
public class Download implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@TableGenerator(name="DownloadIdGen",
	table = "music_id_gen",
	pkColumnName = "GEN_NAME",
	valueColumnName = "GEN_VAL",
	pkColumnValue = "downloadid_gen")
	@GeneratedValue(generator="DownloadIdGen")

	@Column(name="DOWNLOAD_ID")
	private int downloadId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DOWNLOAD_DATE")
	private Date downloadDate;

	//uni-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="USER_ID")
	private User user;

	//uni-directional many-to-one association to Track
	@ManyToOne
	@JoinColumn(name="TRACK_ID")
	private Track track;

	public Download() {
	}

	public int getDownloadId() {
		return this.downloadId;
	}

	public void setDownloadId(int downloadId) {
		this.downloadId = downloadId;
	}

	public Date getDownloadDate() {
		return this.downloadDate;
	}

	public void setDownloadDate(Date downloadDate) {
		this.downloadDate = downloadDate;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Track getTrack() {
		return this.track;
	}

	public void setTrack(Track track) {
		this.track = track;
	}

}