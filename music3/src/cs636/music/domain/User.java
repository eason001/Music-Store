package cs636.music.domain;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the SITE_USER database table.
 * 
 */
@Entity
@Table(name="SITE_USER")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@TableGenerator(name="UserIdGen",
	table = "music_id_gen",
	pkColumnName = "GEN_NAME",
	valueColumnName = "GEN_VAL",
	pkColumnValue = "userid_gen")
	@GeneratedValue(generator="UserIdGen")

	@Column(name="USER_ID")
	private int id;

	private String address1;

	private String address2;

	private String city;

	@Column(name="COMPANY_NAME")
	private String companyName;

	private String country;

	@Column(name="CREDITCARD_EXPIRATIONDATE")
	private String creditcardExpirationdate;

	@Column(name="CREDITCARD_NUMBER")
	private String creditcardNumber;

	@Column(name="CREDITCARD_TYPE")
	private String creditcardType;

	@Column(name="EMAIL_ADDRESS")
	private String emailAddress;

	private String firstname;

	private String lastname;

	private String state;

	private String zip;

	public User() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress1() {
		return this.address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return this.address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCreditcardExpirationdate() {
		return this.creditcardExpirationdate;
	}

	public void setCreditcardExpirationdate(String creditcardExpirationdate) {
		this.creditcardExpirationdate = creditcardExpirationdate;
	}

	public String getCreditcardNumber() {
		return this.creditcardNumber;
	}

	public void setCreditcardNumber(String creditcardNumber) {
		this.creditcardNumber = creditcardNumber;
	}

	public String getCreditcardType() {
		return this.creditcardType;
	}

	public void setCreditcardType(String creditcardType) {
		this.creditcardType = creditcardType;
	}

	public String getEmailAddress() {
		return this.emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return this.zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

}