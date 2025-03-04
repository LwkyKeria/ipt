<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Hotel Listings</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        margin: 0;
                        padding: 20px;
                    }
                    h2, h3 {
                        color: #333;
text-align: center;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                    }
                    th, td {
                        padding: 10px;
                        border: 1px solid #ddd;
                        text-align: left;
                    }
                    th {
                        background-color: #4CAF50;
                        color: white;
                    }
                    tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h2>🏨 Grand Vista Hotel</h2>
                <h3>Location: 123 Main St, Cityville, ST 12345</h3>
                <h3>Contact Number: (123) 456-7890</h3>

                <table>
                    <tr>
                        <th>Room ID</th>
                        <th>Room Type</th>
                        <th>Category</th>
                        <th>Room Rates</th>
                        <th>Rating</th>
                        <th>Amenities</th>
                        <th>Customer Name</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Services</th>
                    </tr>
                    <xsl:for-each select="HotelDataRecords/hotel">
                        <tr>
                            <td><xsl:value-of select="room_id"/></td>
                            <td><xsl:value-of select="room_type"/></td>
                            <td><xsl:value-of select="category"/></td>
                            <td><xsl:value-of select="RoomRates/Rate"/></td>
                            <td><xsl:value-of select="rating"/></td>
                            <td><xsl:value-of select="amenities"/></td>
                            <td>
                                <xsl:value-of select="customerDetails/customer/identity/firstName"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="customerDetails/customer/identity/lastName"/>
                            </td>
                            <td><xsl:value-of select="customerDetails/customer/checkInTime"/></td>
                            <td><xsl:value-of select="customerDetails/customer/checkOutTime"/></td>
                            <td>
                                <xsl:for-each select="servicesProvided/service">
                                    <xsl:value-of select="serviceName"/>
                                    <xsl:text> (</xsl:text>
                                    <xsl:value-of select="fee"/>
                                    <xsl:text>)</xsl:text>
                                    <xsl:if test="position() != last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>