package cs636.music.domain;

import java.io.Serializable;

import javax.persistence.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the INVOICE database table.
 * 
 */
@Entity
@NamedQuery(name="Invoice.findAll", query="SELECT i FROM Invoice i")
public class Invoice implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@TableGenerator(name="InvoiceIdGen",
	table = "music_id_gen",
	pkColumnName = "GEN_NAME",
	valueColumnName = "GEN_VAL",
	pkColumnValue = "invoiceid_gen")
	@GeneratedValue(generator="InvoiceIdGen")

	@Column(name="INVOICE_ID")
	private int invoiceId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="INVOICE_DATE")
	private Date invoiceDate;

	@Column(name="IS_PROCESSED")
	private String isProcessed;

	@Column(name="TOTAL_AMOUNT")
	private BigDecimal totalAmount;

	//uni-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="USER_ID")
	private User user;

	//bi-directional many-to-one association to Lineitem
	@OneToMany(mappedBy="invoice")
	private Set<LineItem> lineItems;

	public Invoice() {
	}

	public int getInvoiceId() {
		return this.invoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}

	public Date getInvoiceDate() {
		return this.invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public String getIsProcessed() {
		return this.isProcessed;
	}

	public void setIsProcessed(String isProcessed) {
		this.isProcessed = isProcessed;
	}

	public BigDecimal getTotalAmount() {
		return this.totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<LineItem> getLineItems() {
		return this.lineItems;
	}

	public void setLineItems(Set<LineItem> lineitems) {
		this.lineItems = lineitems;
	}

	public LineItem addLineItem(LineItem lineitem) {
		getLineItems().add(lineitem);
		lineitem.setInvoice(this);

		return lineitem;
	}

	public LineItem removeLineItem(LineItem lineitem) {
		getLineItems().remove(lineitem);
		lineitem.setInvoice(null);

		return lineitem;
	}
	// calculate the invoice total
	public BigDecimal calculateTotal() {
		BigDecimal total = new BigDecimal(0);
		for (LineItem item: lineItems){
			 total = total.add(item.calculateItemTotal());	
		}
		return total;
	}

}