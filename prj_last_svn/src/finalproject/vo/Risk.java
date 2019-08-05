package finalproject.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Risk {
	String riskno;
	String prjno;
	String title;
	String taskname;
	String description;
	String riskdegree;
	String posibility;
	String owner;
	String solutionPlan; 
	String canhappen; 
	String updateIssue; 
	String realSolution; 
	String status;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	Date rgsdte;
	
	
	public Risk() {
		super();
	}


	public String getRiskno() {
		return riskno;
	}


	public void setRiskno(String riskno) {
		this.riskno = riskno;
	}


	public String getPrjno() {
		return prjno;
	}


	public void setPrjno(String prjno) {
		this.prjno = prjno;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getTaskname() {
		return taskname;
	}


	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getRiskdegree() {
		return riskdegree;
	}


	public void setRiskdegree(String riskdegree) {
		this.riskdegree = riskdegree;
	}


	public String getPosibility() {
		return posibility;
	}


	public void setPosibility(String posibility) {
		this.posibility = posibility;
	}


	public String getOwner() {
		return owner;
	}


	public void setOwner(String owner) {
		this.owner = owner;
	}


	public String getSolutionPlan() {
		return solutionPlan;
	}


	public void setSolutionPlan(String solutionPlan) {
		this.solutionPlan = solutionPlan;
	}


	public String getCanhappen() {
		return canhappen;
	}


	public void setCanhappen(String canhappen) {
		this.canhappen = canhappen;
	}


	public String getUpdateIssue() {
		return updateIssue;
	}


	public void setUpdateIssue(String updateIssue) {
		this.updateIssue = updateIssue;
	}


	public String getRealSolution() {
		return realSolution;
	}


	public void setRealSolution(String realSolution) {
		this.realSolution = realSolution;
	}


	public Date getRgsdte() {
		return rgsdte;
	}


	public void setRgsdte(Date rgsdte) {
		this.rgsdte = rgsdte;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	
}
