package cs636.music.domain;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the TRACK database table.
 * 
 */
@Entity
@NamedQuery(name="Track.findAll", query="SELECT t FROM Track t")
public class Track implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id

	@Column(name="TRACK_ID")
	private int id;

	@Column(name="SAMPLE_FILENAME")
	private String sampleFilename;

	private String title;

	@Column(name="TRACK_NUMBER")
	private int trackNumber;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="PRODUCT_ID")
	private Product product;

	public Track() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSampleFilename() {
		return this.sampleFilename;
	}

	public void setSampleFilename(String sampleFilename) {
		this.sampleFilename = sampleFilename;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getTrackNumber() {
		return this.trackNumber;
	}

	public void setTrackNumber(int trackNumber) {
		this.trackNumber = trackNumber;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}