package com.project.news;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

//import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
//import com.project.connection.DatabaseConnection;

public class NewsInformationManager {

	public static void fetchData(HttpServletRequest request, String searchquery, String[] keyword,
			String date) {

		String clientURL[][] = new String[300][4];
		String refSites[] = new String[3];
		DateFormat df1 = new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat df3 = new SimpleDateFormat("MMM dd, yyyy");
		int i = 0;

		System.out.println(date);
		String inputLine;
		try {

			if (request.getParameter("law_firm") == "") {
				refSites[0] = "vccircle";
				refSites[1] = "business-standard";
				refSites[2] = "legally-india";
			} else {
				refSites[0] = "legally-india";
				refSites[1] = "business-standard";
				refSites[2] = "grapevine+vccircle";
			}

			if (!searchquery.contains("S&R")) {
				searchquery = searchquery.replace("&", "and");
			}
			String arrwords[] = searchquery.split(" ");

			String shortquery;

			switch (searchquery) {

			case "Cyril Amarchand Mangaldas":
				shortquery = "cam";
				break;
			case "Shardul Amarchand Mangaldas and Co":
				shortquery = "sam";
				break;
			case "Economic Laws Practice":
				shortquery = "elp";
				break;
			case "Nishith Desai Associates":
				shortquery = "nda";
				break;
			case "Talwar Thakore and Associates":
				shortquery = "tta";
				break;
			case "S&R Associates":
				shortquery = "s-r";
				break;
			default:
				shortquery = arrwords[0];
			}

			if (arrwords.length > 2)
				searchquery = arrwords[0] + " " + arrwords[1];

			searchquery = searchquery.replaceAll(" ", "+");

			String key = "";
			if (searchquery.equalsIgnoreCase("")) {
				shortquery = "";
				for (int j = 0; j < keyword.length; j++) {
					key = key + "+" + keyword[j];
				}
				key = key.replaceAll(" ", "+");
			}

			String generate_URL;
			for (int n = 0; n < 6; n++) {

				for (int r = 0; r < refSites.length; r++) {
					if (searchquery == "")
						generate_URL = "https://www.google.com/search?q=" + key + "+" + refSites[r] + "&tbm=nws";
					else
						generate_URL = "https://www.google.com/search?q=" + searchquery.trim().replace("&", "%26") + "+"
								+ refSites[r] + "&tbm=nws";

					if (n != 0)
						generate_URL = generate_URL + "&start=" + n + "0";

					URL data = new URL(generate_URL);
					/**
					 * Proxy code start If you are working behind firewall uncomment below lines.
					 * Set your proxy server
					 */

					/*
					 * Proxy proxy = new Proxy(Proxy.Type.HTTP, new
					 * InetSocketAddress("192.168.0.202", 8080));
					 */
					/* HttpURLConnection con = (HttpURLConnection) data.openConnection(proxy); */

					/* Proxy code end */

					/* Open connection */
					/* comment below line in case of Proxy */
					HttpURLConnection con = (HttpURLConnection) data.openConnection();
					Thread.sleep(2000);
					con.setRequestProperty("User-Agent",
							"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11");
					/* Read webpage coontent */
					BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
					// BufferedReader reader = new BufferedReader(new
					// InputStreamReader(.getInputStream(), Charset.forName("UTF-8")));

					/* Read line by line */
					String input = "";
					while ((inputLine = in.readLine()) != null) {
						input = input + inputLine;
					}

					Document document = Jsoup.parse(input);
					
					org.jsoup.nodes.Element div_result = document.getElementById("main");//;("res");
					Elements header = div_result.getElementsByTag("div");
					for (org.jsoup.nodes.Element head : header) {
						if (head.className().equals("ZINbbc xpd O9g5cc uUPGi")) {
							Elements headtags = head.getElementsByClass("kCrYT");
							int count=0;
							Elements desc=null,header_links = null;
							for (org.jsoup.nodes.Element headtag : headtags) {
								if(count%2==0) {
								 header_links = headtag.getElementsByTag("a");
								if ((header_links.attr("href").toLowerCase().contains(shortquery.toLowerCase())
									|| shortquery == "") && !header_links.attr("href").contains("google")) {
									 desc = headtag.getElementsByClass("zBAuLc");			
									}
								count++;
								continue;
								}	
								else {
									if(desc!=null) {
									Elements tags = headtag.getElementsByTag("span");
									int cnt = 0;
									Date dt = null;
									for (org.jsoup.nodes.Element tag : tags) {
									if(cnt%2==0) {
										if (tag.text().contains("month")) {
											Calendar calendar = Calendar.getInstance();
											calendar.setTime(new Date());
											calendar.add(Calendar.MONTH,
													(-1) * Integer.parseInt(tag.text().substring(0, 1).trim()));
											dt = calendar.getTime();
											clientURL[i][0] = df1.format(dt);
										} else if (tag.text().contains("week")) {
											Calendar calendar = Calendar.getInstance();
											calendar.setTime(new Date());
											calendar.add(Calendar.DAY_OF_YEAR,
													(-1) * Integer.parseInt(tag.text().substring(0, 1).trim()) * 7);
											dt = calendar.getTime();
											clientURL[i][0] = df1.format(dt);
										} else if (tag.text().contains("day")) {
											Calendar calendar = Calendar.getInstance();
											calendar.setTime(new Date());
											calendar.add(Calendar.DAY_OF_YEAR,
													(-1) * Integer.parseInt(tag.text().substring(0, 1).trim()));
											dt = calendar.getTime();
											clientURL[i][0] = df1.format(dt);
										} else if (tag.text().contains("hour")) {
											Calendar calendar = Calendar.getInstance();
											calendar.setTime(new Date());
											calendar.add(Calendar.HOUR_OF_DAY,
													(-1) * Integer.parseInt(tag.text().substring(0, 1).trim()));
											dt = calendar.getTime();
											clientURL[i][0] = df1.format(dt);
										} else if (tag.text().contains("min")) {
											Calendar calendar = Calendar.getInstance();
											calendar.setTime(new Date());
											calendar.add(Calendar.HOUR_OF_DAY,
													(-1) * Integer.parseInt(tag.text().substring(0, 1).trim()) / 60);
											dt = calendar.getTime();
											clientURL[i][0] = df1.format(dt);
										} else {
											Date d = (Date) df3.parse(tag.text());
//											Date dte = df2.parse(date);
//											// dt.setMonth(dt.getMonth()+1);
//											if (d.compareTo(df1.parse(df1.format(dte))) > 0) {
											Calendar calendar = Calendar.getInstance();
											calendar.setTime(d);
											dt = calendar.getTime();
//											}
										}
										
									}
									cnt++;
									}
									
									Date d = df1.parse(df1.format(dt));
									Date dte = df2.parse(date);
									// dt.setMonth(dt.getMonth()+1);
									if (d.compareTo(dte) >= 0) {
										clientURL[i][0] = df1.format(dt);
										clientURL[i][1] = header_links.attr("href").substring(7);
										clientURL[i][2] = desc.text();
										i++;
									}
									}
								}
/*										Elements linktext = head.getElementsByTag("div");
										for (org.jsoup.nodes.Element txt : linktext) {
											// tag.text();
											int cnt=0;
											if (txt.className().equals("zBAuLc")) {
												Date d = df1.parse(df1.format(dt));
												Date dte = df2.parse(date);
												// dt.setMonth(dt.getMonth()+1);
												if (d.compareTo(dte) >= 0) {
													clientURL[i][0] = df1.format(dt);
													clientURL[i][1] = header_links.attr("href");
													clientURL[i][2] = txt.text();
													i++;
												}
												}
											
											}
*/									
								}
									
							}
								
						}
					

					/* close BufferedReader */
					in.close();
					/* close HttpURLConnection */
					con.disconnect();
				}
			}

			removeduplicates(clientURL, i);

			String urlListFull[][] = new String[i][3];
			int k = 0, m;
			for (int j = 0; j < i; j++) {
				if ((clientURL[j][1].toLowerCase().contains(shortquery.toLowerCase()) || shortquery == "")
						&& !clientURL[j][3].equals("1")) {
					if (keyword != null && keyword.length > 0) {
						for (m = 0; m < keyword.length; m++) {
							keyword[m] = keyword[m].replace(" ", "-");
							if (clientURL[j][1].toLowerCase().contains(keyword[m].toLowerCase()))
								break;
						}
						if (m < keyword.length) {
							urlListFull[k][0] = clientURL[j][0];
							urlListFull[k][1] = clientURL[j][1];
							urlListFull[k][2] = clientURL[j][2];
							k++;
						}
					} else {
						urlListFull[k][0] = clientURL[j][0];
						urlListFull[k][1] = clientURL[j][1];
						urlListFull[k][2] = clientURL[j][2];
						k++;
					}
				}
			}

//			insertIntoKeywordMapping(request, urlListFull);	
			sortList(urlListFull, k);

			NewsDetails[] ndetails = new NewsDetails[k];
			int p = 0;	
			for (int j = 0; j < k; j++) {
				ndetails[p] = new NewsDetails();
				ndetails[p].setDate(urlListFull[j][0]);
				ndetails[p].setUrl(urlListFull[j][1]);
				ndetails[p].setDetails(urlListFull[j][2]);
				p++;
			}

			ResultSet clt = null;
			String sql = null;

			/*Statement st = conn.createStatement();
			if (request.getParameter("client") != "") {
				sql = "SELECT c.keywords FROM client_keyword_mapping c WHERE c.client like " + "\'%"
						+ request.getParameter("client") + "%\'";
			} else if (request.getParameter("law_firm") != "") {
				sql = "SELECT l.keywords FROM lawfirm_keyword_mapping l WHERE l.lawfirm_name like " + "\'%"
						+ request.getParameter("law_firm") + "%\'";
			} else {
				sql = "SELECT c.keywords FROM client_keyword_mapping c ,lawfirm_keyword_mapping l WHERE c.deal_details = l.deal_details and c.url=l.url and c.client like "
						+ "\'%" + request.getParameter("client") + "%\'" + " and l.lawfirm_name like " + "\'%"
						+ request.getParameter("law_firm") + "%\'";
			}

			// sql = "select * from client_lawfirm_mapping where client like " + "\'%" +
			// request.getParameter("client") + "%\'" + " and law_firm like " + "\'%" +
			// request.getParameter("law_firm") + "%\'" ;
			clt = st.executeQuery(sql);
			clt.last();

			String keylist = "";
			clt.first();
			if (clt.getRow() > 0) {
				do {
					keylist = keylist + clt.getString("keywords").toLowerCase() + ";";
				} while (clt.next());
			}

			String keywords[] = keylist.split(";");
			String keycount[][] = new String[keywords.length][3];
			for (int j = 0; j < keywords.length; j++) {
				qloop: for (int q = 0; q < keycount.length; q++) {
					if (keywords[j].trim().equalsIgnoreCase(keycount[q][1])) {
						int a = Integer.parseInt(keycount[q][0]);
						a = a + 1;
						keycount[q][0] = String.valueOf(a);
						break qloop;
					} else if (keycount[q][1] == null) {
						keycount[q][1] = keywords[j].trim();
						keycount[q][0] = String.valueOf(1);
						break qloop;
					}
				}
			}

			int count = 0, mean = 0, total = 0;
			for (int j = 0; j < keycount.length; j++) {
				if (keycount[j][1] != null && !keycount[j][1].trim().equals("")) {
					total = total + Integer.parseInt(keycount[j][0]);
					count++;
				}
			}
			if (count > 0)
				mean = total / count;
			for (int j = 0; j < keycount.length; j++) {
				if (keycount[j][1] != null) {
					if (keycount[j][1].equals("") || Integer.parseInt(keycount[j][0]) < mean) {
						keycount[j][1] = null;
						keycount[j][0] = null;
						keycount[j][2] = null;
					}
				}
			}*/
			request.setAttribute("ndetails", ndetails);
//			request.setAttribute("keycount", keycount);

			if (ndetails.length == 0) {
				request.setAttribute("errorMessage", "No Records Found");
			}
//			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error Processing Request.. Check connection");
		}

	}

	/*private static void insertIntoKeywordMapping(HttpServletRequest request, String[][] urlListFull) {

		ResultSet clt = null;
		String sql = null;
		DateFormat df1 = new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
		Statement st;
		try {
			Connection conn = DatabaseConnection.getConnection();
			st = conn.createStatement();
			sql = "select * from keyword_master";
			clt = st.executeQuery(sql);
			clt.last();
			String keylist[] = new String[clt.getRow()];
			clt.first();
			if (clt.getRow() > 0) {
				int i = 0;
				do {
					keylist[i] = clt.getString("key_name");
					keylist[i] = keylist[i].replaceAll(" ", "-");
					i++;
				} while (clt.next());
			}

			sql = "select distinct lawfirm_name from lawfirm_keyword_mapping where firm_type='Foreign'";
			clt = st.executeQuery(sql);
			clt.last();
			String foreignfirmlist[] = new String[clt.getRow()];
			clt.first();
			if (clt.getRow() > 0) {
				int i = 0;
				do {
					foreignfirmlist[i] = clt.getString("lawfirm_name");
					i++;
				} while (clt.next());
			}

			for (int i = 0; i < urlListFull.length; i++) {
				String key = "";
				if (urlListFull[i][1] != null) {
					for (int j = 0; j < keylist.length; j++) {
						if (urlListFull[i][1].toLowerCase().contains(keylist[j].toLowerCase())) {
							key = key + keylist[j] + ";";
						}
					}
				}

				if (key != "") {
					conn.setAutoCommit(false);
					PreparedStatement statement = null;
					if (request.getParameter("client") != "") {
						String sqlinsert = "INSERT INTO client_keyword_mapping (Client, Deal_Details, URL,keywords,date) VALUES (?, ?, ?,?,?)";
						statement = conn.prepareStatement(sqlinsert);
						String client = request.getParameter("client");
						statement.setString(1, client);
						statement.setString(2, urlListFull[i][2]);
						statement.setString(3, urlListFull[i][1]);
						statement.setString(4, key);
						
						Date d = (Date) df1.parse(urlListFull[i][0]);
						statement.setString(5, df2.format(d));
						
						try {
							statement.execute();
							conn.commit();
						} catch (SQLException e) {
							continue;
						}

					} else if (request.getParameter("law_firm") != "") {
						String sqlinsert = "INSERT INTO lawfirm_keyword_mapping (lawfirm_name, Deal_Details, URL, firm_type,practice_area,keywords,date) VALUES (?, ?, ?, ?, ?,?,?)";
						statement = conn.prepareStatement(sqlinsert);
						String law_firm = request.getParameter("law_firm");
						statement.setString(1, law_firm);
						statement.setString(2, urlListFull[i][2]);
						statement.setString(3, urlListFull[i][1]);
						int k;
						for (k = 0; k < foreignfirmlist.length; k++) {
							if (foreignfirmlist[k].toLowerCase().contains(law_firm.toLowerCase())) {
								statement.setString(4, "Foreign");
								break;
							}
						}
						if (k == foreignfirmlist.length) {
							statement.setString(4, "Domestic");
						}

						if (urlListFull[i][1].contains("private-equity")) {
							statement.setString(5, "Private Equity / VC");
						} else if (urlListFull[i][1].contains("mna")) {
							statement.setString(5, "Corporate and M&A");
						} else {
							statement.setString(5, "Capital Markets");
						}

						statement.setString(6, key);
						
						Date d = (Date) df1.parse(urlListFull[i][0]);
						statement.setString(7, df2.format(d));
						
						try {
							statement.execute();
							conn.commit();
						} catch (SQLException e) {
							continue;
						}
					}

					// String law_firm = request.getParameter("law_firm");
					// statement.setString(2, law_firm);

					// statement.setString(2, key);

					// if(urlListFull[i][0].contains("hour") || urlListFull[i][0].contains("min")) {
					// Date date = new Date();;
					// statement.setTimestamp(6, new Timestamp(date.getTime()));
					// }
					// else {
					// Date d = (Date) df1.parse(urlListFull[i][0]);
					// statement.setString(6, df2.format(d) );
					// }

				}
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
*/
	private static void removeduplicates(String[][] clientURL, int n) {
		clientURL[0][3] = "0";
		for (int i = 0; i < n; i++) {
			for (int j = i + 1; j < n; j++) {
				if ((clientURL[i][1] == clientURL[j][1]) && clientURL[i][3] != "1" && clientURL[j][3] != "1") {
					clientURL[j][3] = "1";
				} else
					clientURL[j][3] = "0";
			}
		}

	}

/*	private static void sortA(String[][] urlListA, int x) throws ParseException {
		String tempdate;
		String tempurl;
		String tempdet;
		for (int i = 0; i < x - 1; i++) {
			for (int j = 0; j < x - i - 1; j++) {
				if (urlListA[j][0] != null) {
					if (Integer.parseInt(urlListA[j][0].substring(0, 2).trim()) > Integer
							.parseInt(urlListA[j + 1][0].substring(0, 2).trim())) {
						tempdate = urlListA[j][0];
						urlListA[j][0] = urlListA[j + 1][0];
						urlListA[j + 1][0] = tempdate;

						tempurl = urlListA[j][1];
						urlListA[j][1] = urlListA[j + 1][1];
						urlListA[j + 1][1] = tempurl;

						tempdet = urlListA[j][2];
						urlListA[j][2] = urlListA[j + 1][2];
						urlListA[j + 1][2] = tempdet;
					}
				}
			}
		}
	}*/

	private static void sortList(String[][] urlList, int y) throws ParseException {

		DateFormat df1 = new SimpleDateFormat("dd-MMM-yyyy");
		String tempdate;
		String tempurl;
		String tempdet;
		for (int i = 0; i < y - 1; i++) {
			for (int j = 0; j < (y - i - 1); j++) {
				if (((Date) df1.parse(urlList[j][0])).compareTo(df1.parse(urlList[j + 1][0])) < 0) {
					tempdate = urlList[j][0];
					urlList[j][0] = urlList[j + 1][0];
					urlList[j + 1][0] = tempdate;

					tempurl = urlList[j][1];
					urlList[j][1] = urlList[j + 1][1];
					urlList[j + 1][1] = tempurl;

					tempdet = urlList[j][2];
					urlList[j][2] = urlList[j + 1][2];
					urlList[j + 1][2] = tempdet;
				}
			}
		}
	}

}
