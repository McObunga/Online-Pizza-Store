<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Offer</title>
<script type="text/javascript" src="resources/js/jquery-1.7.1.min.js"></script>
<style type="text/css">
.error {
	color: #212121;
	font-style: italic;
}

.mainTable {
	border-style: inset;
	font-size: large;
	margin-top: 100px;
	background-color: white;
	width: 40%;
}

.label {
	width: 30px;
	font-size: x-large;
	font-style: oblique;	
}
</style>
<script>
	function validate() {
		var flag = false;	
		var string = "Enter Offer Name";
		var string1 = "when amount exceeds";
		var string2 = "when quantity exceeds";
		var name = document.getElementById("name").value;
		var amount = document.getElementById("amount").value;
		var quant = document.getElementById("quant").value;
		var dis = document.getElementById("dis").value; 

		var dtCh= "/";
		var minYear=2012;
		var maxYear=2100;

		function ValidateForm(){
			var sdt=document.addoffer.startDate;
			var edt=document.addoffer.endDate;
			
			if (isDate(sdt.value)==false || isDate(edt.value)==false){
				sdt.focus();
				flag = true;
			} 
			
		    return true;
		 }
		
		function isInteger(s){
			var i;
		    for (i = 0; i < s.length; i++){   
		        // Check that current character is number.
		        var c = s.charAt(i);
		        if (((c < "0") || (c > "9"))) return false;
		    }
		    // All characters are numbers.
		    return true;
		}

		function stripCharsInBag(s, bag){
			var i;
		    var returnString = "";
		    // Search through string's characters one by one.
		    // If character is not in bag, append to returnString.
		    for (i = 0; i < s.length; i++){   
		        var c = s.charAt(i);
		        if (bag.indexOf(c) == -1) returnString += c;
		    }
		    return returnString;
		}

		function daysInFebruary (year){
			// February has 29 days in any year evenly divisible by four,
		    // EXCEPT for centurial years which are not also divisible by 400.
		    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
		}
		function DaysArray(n) {
			for (var i = 1; i <= n; i++) {
				this[i] = 31;
				if (i==4 || i==6 || i==9 || i==11) {this[i] = 30;}
				if (i==2) {this[i] = 29;}
		   } 
		   return this;
		}

		function isDate(dtStr){
			var daysInMonth = DaysArray(12);
			var pos1=dtStr.indexOf(dtCh);
			var pos2=dtStr.indexOf(dtCh,pos1+1);
			var strMonth=dtStr.substring(0,pos1);
			var strDay=dtStr.substring(pos1+1,pos2);
			var strYear=dtStr.substring(pos2+1);
			strYr=strYear;
			if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1);
			if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1);
			for (var i = 1; i <= 3; i++) {
				if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1);
			}
			month=parseInt(strMonth);
			day=parseInt(strDay);
			year=parseInt(strYr);
			if (pos1==-1 || pos2==-1){
				alert("The date format should be : mm/dd/yyyy");
				return false;
			}
			if (strMonth.length<1 || month<1 || month>12){
				alert("Please enter a valid month");
				return false;
			}
			if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
				alert("Please enter a valid day");
				return false;
			}
			if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
				alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear);
				return false;
			}
			if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
				alert("Please enter a valid date");
				return false;
			}
		return true;
		}
		
		if (name == "" || name == null) {
			window.alert("Please enter a name");
			name.focus();
			flag = true;
		} else if (name == string) {
			window.alert("Enter Offer Name");
			name.focus();
			flag = true;
		} else if (name.length < 5) {
			window.alert("Enter Offer Name of atleast 5 characters");
			name.focus();
			flag = true;
		}  else if ((amount == string1 || amount == null) &&  (quant == string2 || quant == null)){
			window.alert("Enter the value for either amount or quantity");
			document.getElementById("amount").focus();
			flag = true;
		}  else if ( (isNaN(amount)) && (isNaN(quant)) ) {
			window.alert("Enter the value in digits");
			document.getElementById("amount").focus();
			flag = true;
		}   else if (dis == "") {
			alert("Enter the discount");
			document.getElementById("dis").focus();
			flag = true;
		}  else if (isNaN(dis)) {
			alert("Enter the discount in number");
			document.getElementById("dis").focus();
			flag = true;
		}  else {
			ValidateForm();
		}
		if (!flag) {
			//document.addPizza.action = "addNewPizza";
			document.addoffer.submit();
		}
	}
	</script>
</head>
<body>

    <form:form id="addoffer" name="addoffer" method="post" modelAttribute="addoffer">
			<table class="mainTable" cellpadding="5" cellspacing="5">
				<tr>
					<td>
						<h3 style="color: orange; text-align: center; font-size: x-large;">Add
							Offer -:</h3></td>
				</tr>
				<tr>
					<td><form:label path="offerName" cssClass="label">Offer Name<span> * </span></form:label>
					</td> 
					<td><form:input id="name" path="offerName" maxlength="20" onClick="this.value='';"
									onblur="this.value=!this.value?'Enter Offer Name':this.value;"
							value="Enter Offer Name" /></td>
				</tr>
				<tr>
					<td><form:label path="startDate" cssClass="label">Start Date<span> * </span></form:label>
					</td>
					<td><form:input path="startDate" id="startDate" onClick="this.value='';"
									onblur="this.value=!this.value?'Start Of Offer':this.value;"
							value="Start Of Offer" /></td>
				</tr>
				<tr>
					<td><form:label path="endDate" cssClass="label">End Date<span> * </span></form:label>
					</td>
					<td><form:input path="endDate" id="endDate" onClick="this.value='';"
									onblur="this.value=!this.value?'End Of Offer':this.value;"
							value="End Of Offer" /></td>
				</tr>
				<tr>
					<td><form:label path="amount" cssClass="label">On Amount<span> * </span></form:label>
					</td>
					<td><form:input path="amount" id="amount" maxlength="20" onClick="this.value='';"
									onblur="this.value=!this.value?'when amount exceeds':this.value;"
							value="when amount exceeds" /></td>
				</tr>
				<tr>
					<td><form:label path="quantity" cssClass="label">On Quantity<span> * </span></form:label>
					</td>
					<td><form:input path="quantity" id="quant" maxlength="20" onClick="this.value='';"
									onblur="this.value=!this.value?'when quantity exceeds':this.value;"
							value="when quantity exceeds" /></td>
				</tr>
				<tr>
					<td><form:label path="discount" cssClass="label">Discount(%)<span> * </span></form:label>
					</td>
					<td><form:input id="dis" path="discount" maxlength="20" onClick="this.value='';"
									onblur="this.value=!this.value?'Discount % is':this.value;"
							value="Discount % is" /></td>
				</tr>
				<tr>
					<td><input type="button" value="Save" onClick="validate()"
						style="width: 100px; font-size: large; margin-left: 200px" /></td>
				</tr>
			</table>
		 
	</form:form>

</body>
</html>