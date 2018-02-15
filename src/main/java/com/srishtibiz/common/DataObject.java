package com.srishtibiz.common;

public class DataObject {

    public Integer employeeNumber;
    public double amount;
    public String currentDesignation;
    public String autogenerateNumber;
    public String customerName;
    public String remarks;
    public String purpose;
    public String totime;
    public String ReleaseStartDate;
    public String ReleaseEndDate;
    public String RevisedReleaseStartDate;
    public String RevisedReleaseEndDate;
    public double salary;

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

   
    public void setCurrentDesignation(String currentDesignation) {
        this.currentDesignation = currentDesignation;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getTotime() {
        return totime;
    }

    public void setTotime(String totime) {
        this.totime = totime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String employeeName;

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getAutogenerateNumber() {
        return autogenerateNumber;
    }

    public void setAutogenerateNumber(String autogenerateNumber) {
        this.autogenerateNumber = autogenerateNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Integer getEmployeeNumber() {
        return employeeNumber;
    }

    public Integer setEmployeeNumber(Integer employeeNumber) {
        return this.employeeNumber = employeeNumber;
    }

    public DataObject() {
        this.employeeNumber = 1;
    }
}
