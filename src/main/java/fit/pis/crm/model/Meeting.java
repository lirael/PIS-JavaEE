package fit.pis.crm.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="meeting")
public class Meeting implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "meeting_id")
	private Long id;
	
	@NotEmpty(message = "Title cannot be empty")
	@Column(name = "title")
	private String title;
	
	@Column(name = "place")
	private String place;
	
	@NotNull(message = "Select a date")
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "results")
	private String results;
	
	@NotEmpty(message = "Enter time")
	@Column(name = "time")
	private String time;
	
	@Column(name = "contract_state")
	private String contractState;
	
	@Column(name = "meeting_state")
	private String meetingState;
	
	//@NotNull(message = "Select client")
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "client", nullable = false)
	private Client client;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "manager")
	private UserAcc manager;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getResults() {
		return results;
	}

	public void setResults(String results) {
		this.results = results;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContractState() {
		return contractState;
	}

	public void setContractState(String contractState) {
		this.contractState = contractState;
	}

	public String getMeetingState() {
		return meetingState;
	}

	public void setMeetingState(String meetingState) {
		this.meetingState = meetingState;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public UserAcc getManager() {
		return manager;
	}

	public void setManager(UserAcc manager) {
		this.manager = manager;
	}

}
