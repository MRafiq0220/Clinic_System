<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Report of All Patients</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }
            .container {
                width: 80%;
                margin: 50px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h2 {
                text-align: center;
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            table, th, td {
                border: 1px solid #ccc;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .back-button {
                background-color: #f4f4f4;
                color: black;
                border: 1px solid #ccc;
                text-align: center;
                text-decoration: none;
                padding: 10px;
                border-radius: 5px;
                display: inline-block;
                margin-top: 20px;
            }
            .back-button:hover {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Report of All Patients</h2>
            <table>
                <tr>
                    <th>Patient IC</th>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Gender</th>
                </tr>
                <%
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                        con = DriverManager.getConnection("jdbc:mysql://localhost/sql_mrafiq", "sql_mrafiq", "yDB5npdN8jXaZpL8");

                        stmt = con.createStatement();
                        String sql = "SELECT * FROM patient";
                        rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            String patientIC = rs.getString("patient_IC");
                            String name = rs.getString("patient_Name");
                            String phone = rs.getString("patient_PhoneNumber");
                            String address = rs.getString("patient_Address");
                            String gender = rs.getString("patient_Gender");
                %>
                <tr>
                    <td><%= patientIC %></td>
                    <td><%= name %></td>
                    <td><%= phone %></td>
                    <td><%= address %></td>
                    <td><%= gender %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </table>
            <a href="clerkmenu.jsp" class="back-button">Back</a>
        </div>
    </body>
</html>
