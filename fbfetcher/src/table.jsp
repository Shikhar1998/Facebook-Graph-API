<%@page import="java.sql.*" %>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<% Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hr","abc"); 
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM fbc order by shares+likes DESC");
	out.println("<center><h3>DATA FETCHED FROM NSIT FB PAGE  : </h3></center><hr>");
	String t="<table><tr><th>Position</th><th>Sno.</th><th>Post-ID</th><th>Post-Caption</th><th>Post-Message</th><th>Likes</th><th>Shares</th></tr>";
	int i=1;
	while(rs.next()){
		t="<tr>"+t+"<td>"+i+"</td>";
		t=t+"<td>"+rs.getString(1)+"</td>";
		t=t+"<td>"+rs.getString(2)+"</td>";
		t=t+"<td>"+rs.getString(4)+"</td>";
		t=t+"<td>"+rs.getString(3)+"</td>";
		t=t+"<td>"+rs.getString(5)+"</td>";
		t=t+"<td>"+rs.getString(6)+"</td></tr>";
		i=i+1;
	}
	t=t+"</table>";
	out.println(t);
	rs.close();
	st.close();
	con.close();
%>