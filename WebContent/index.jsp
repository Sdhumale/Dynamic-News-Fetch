<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html > <!-- PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<title>Project</title>
<script>  

 function onload(){
	 
	var today = new Date();
	today.setDate(today.getDate() - 1);
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!

	var yyyy = today.getFullYear();
	
	if(dd<10){
		dd='0'+dd
	} 
	if(mm<10){
		mm='0'+mm
	} 
	
	today = yyyy+'-'+mm+'-'+dd;
	
	document.getElementById("theDate").value = today;
	
	 var clientOptions = "";
	 clientsByCategory = ["ALL","1MG Technologies","20th Century Fox","21st Century Fox","3i Infotech","3M Healthcare","3RDFlix","63Ideas Infolabs","A Saravanan","A10 Networks","Aakash Educational Services","AAPC","Aashirwad","Aavas Financiers","Aavishkar","ABB","ABG","Able Marine","ABN AMRO","Abu Dhabi Bank","Abu-Dhabi National-Exhibitions","Accel","Accelerator","Accenture","Accion Frontier","Accor","ACI","Acme Solar Holdings","Actis","Actua Corporation","Adani","Adel Landmarks", "Aditya Birla", "Adrian Zecha","Advance Financials","Advanced Construction Technology","Advanced Technology Ventures","Advent","Aero Sail Services","Aeroports deParis","AES Energy Storage Holdings","Affirma Capital","Affle","Agritrade Resources","AGS Transact Technologies","AIA Group","AIMCo","Aims Impex India","AION Capital","Ajanta Packaging","Akorn Inc.","Alembic Pharmaceuticals","Alexis Multispecialty Hospital","Alfamation S.p.A","Alibaba","Alight Solutions","Alkem Laboratories","Alkemi Venture Partners","Allnex","Alpha Alternatives", "Alpha Capital","Alsthom Industries","Amar Ujala","Amazon","Amber Enterprises","Ambit Pragma","American Tower Corporation","Amfora Wine and Foods","Amicus Capital","AMPSolar India","Anand Rathi Wealth Services","Andreessen Horowitz","ANI","Anmol Industries","Annika Promoters","Anthea Aromatics","ANZ","APAC","Apax Partners","APG Asset Management", "Apis Partners", "Apollo Global Management", "Apollo Tyres.", "Aquasail Distribution Company", "Aravali Investment","ArcelorMittal","Arctech Solar Holding","Arneg S.p.A.","Arohan Financial Services", "Arthasashtra Fintech",	 "Artis Ventures","Arun Sarin","Ascent Capital", "ASG Hospital","Ashiana Housing","Ashok Goel Trust","Ashok Leyland","Asian Bank","Asiateaexpress","ASK Investment","Aspada Investment","Associated British Foods", "Astrome Technologies","Astrum Management","Atal Nagar Vikas Pradhikaran","Atha Group","Ather Energy","Atlas Venture","ATN Inc","Atomberg Technologies","Atomico Ventures","Atria","Au Small Finance Bank","August Capital","August Jewellery","Aujas Networks","Aurecon Group","Aurobindo Pharma","Auroma Logistics","Austin Ventures","Autus Capital Mauritius","Avaana Capital Advisors","Avail Finance","Avalara","Avalon Ventures","Avantha Group","Avantor Performance Materials","Aviva","Avvashya CC Logistics Pvt Ltd","Awfis Space Solutions","AXA Group","Axis Asset Management","Axis Bank","Axis Capital","Aye Finance","Azure Capital Partners","Azure Power Global", 
		 "B Capital","Babcock Power Inc", "BAC Acquisitions", "Bain Capital","Bajaj Auto", "Bajaj Finance","Balderton Capital","BAML","Bandhan Bank","Bank of America Merrill Lynch","Bank of Baroda","Bank of New York Mellon","Bank of Nova Scotia","Barclays","Baring Private Equity","Battery Ventures", "Bayer Intellectual Property GmbH","Bear Stearns","Belaire","Benchmark Capital","Berar Finance","Berger Paints","Berggruen Investments","Bertelsmann","Bertram Capital","Bessemer Venture Partners","BGF","Bharat Forge","Bharat Heavy Electricals","Bharat Petroleum Corporation","Bharat Serums and Vaccines","Bharti Airtel","Bhushan Steel","Bigbasket","Binary Capital","Binny Bansal","Biosense Technologies","Birds Eye Systems","Bizongo","Blackboard Transact","Blackstone","Blue Umbrella India","BNP Paribas","BOB Capital Markets","Bombay Hemp Company","Borealis OMERS Infrastructure","Bounce","Box8","Brainbees Solutions (FirstCry)","Brigade Group","Brinton Pharmaceuticals","British Asian Trust","BroadviewBV","Bromford Holdings","Brookfield","Browndove Healthcare","Bruno","BSCPL Infrastructure","BSE","BT Alex. Brown","BT TechLabs",
		 "C&S Electric","Café Coffeeday","Camden Town Technologies(ZestMoney)","Ca Pack S.A., Poland","Canada Pension Plan Investment Board","Canara Bank","Capacit'e Infraprojects", "Capital Dynamics","Capital First","Capital Square Partners","CapitalG","Cardinal Healthcare","Cardpdiem Advisors","Carestream Health","Carlyle Group","Cashfree","CDC Group","CDH","CDH Vision Fund","Celanese Corporation", "Celox Pandion","Central Depository Services","Centrum Capital","Centrum Housing Finance","Centrum Microcredit","Century Textiles and Industries","CESC VenturesIndia","CGG France","Chalet Hotels","Charles River Ventures","Chart Industries","Chennai Port Trust","China Light & Power","China Vanke","Chiratae","Chqbook","Chrys Capital","CIBC World Markets","Ciena Corporation","Cigna Corporation","CIIE Advisors","Cinestaan Digital","Circle Park Capital Advisors","Cisco","Citibank Global Markets","Citigroup","City Football Group","CK Jaipuria Group","Claranet Group","Clarivate Analytics","Classplus","Clayton, Dubilier & Rice","Clearstone Venture Partners","Cleartrip","Clearwater investment Advisors","Clix Capital","CLP","CLSA","CMS Computers","Coal India","Cobham","Coca-Cola Company","Cognizant Technology","Coldex","Colfax Corporation","Colgate","CoLife Advisory","Colliers International","Columbus Nova Technology Partners","Committee of Creditors","Commonwealth Bank of Australia","Companhia Brasileira de Cartuchos","Conneqt Business Solutions","Consort Medical","Consortium of Investors","Continental GmbH","Continental Illinois", "Convergent Capital","Corisol","Corona Remedies","Covance","Coventry Properties","Coverfox","CoWrks","CPP Assistance Services","Craftsman Automation","Credit Suisse","CreditAccess Grameen","Crestline Direct Finance","Crosslink Capital","CrunchFund","Cruz City 1 Mauritius Holdings Ltd","Ctrip","CureFit Healthcare","CVC Capital Partners","Cvent", "CX Advisors LLP", "Cyber Carrier",
		 "DAG Ventures","Dakshin Mercantile","Dalian Wanda Group", "Dalmia Bharat","Dana Incorporated","Danish Microfinance Partners","DB Trustees","DBS Bank", "DCB", "Deepak Fertilisers", "DEG", "Delhi International Airport", "Delhivery", "Dell EMC", "Delta Corp", "Den Networks", "Dentsu Aegis Network", "Department ofInvestment and Public Asset Management", "Department Transport(DfT) and HM Treasury", "Design Edge", "Deutsche Bank", "DFM Foods", "Dhanuka Laboratories","Dhunseri Tea & Industries","Diageo Plc", "Diamond Services", "DIC Corporation", "Digital Sky Technologies", "Dilip Buildcon", "Dimension Data", "Dindigul Thalappakatti Biryani","Dion Global", "Direct Line", "Dish TV and Videocon d2h", "DLF", "DMI Finance", "DNP", "Dodla Dairy", "Donaldson, Lufkin & Jenrette", "Donear Industries", "Dr. Archana Hingorani", "Draper Fisher Jurvetson","Dredging Corporation of India","DSG Consumer Partners", "DSP","DST Global","DSV Air and Sea","Dunar Foods & Ors.","Dunzo Digital","Dutch development finance institution FMO","DWF", "DWS", 
		 "E2open Group", "Eastbridge Capital", "EasyRewardz Software Services", "ebay", "Ebix", "Ecom Express", "ECR Pharmaceuticals Co., Inc.", "Edelweiss", "EID Parry", "Elantas Beck India", "Electra Private Equity", "Electronica Finance","Elementis","Elevar","Elevation Partners","Eli Lilly and Company","Elica PB India","Emaar Group PJSC","Emami Cement","Embassy Office Parks REIT","Embassy Property","Emso Asset Management","EnCap Investments", "Encourage Capital", "Endiya","Endurance Technologies","English and Singapore law project","Ensono","Enzen Global Solutions","Epventure Partners","EQT","Equis Funds Group Pte Ltd","Equistone Partners Europe","Equitix","Equity International Management", "Era Infra Engineering", "Erich UTSCH AG Germany", "Essar Group", "Essel Propack","Estée Lauder", "Etco Industries Pvt", "Etechaces Marketing and Consulting", "Eternis Fine Chemicals","Etihad","Euramco GmBh","Evans Randall","Everbridge Partners","Eveready Industries","Everstone","Evolvence Capital", "Excel Crop Care","Excel Industries","Exide Industries","Exilant Technologies","Exponent Private Equity","Export-Import Bank of India", "Export-Import Bank of Korea","Exxon Mobil","EY India","FabIndia Overseas","Facebook", "Fastway Transmissions", "FedEx","ff Venture Capital","Fidelity Ventures","FieslandCampina","Filter Capital India Advisors","Finesse International Design","Finova Capital", "Fireside Ventures","Firmenich","First Abu Dhabi Bank","First Chicago Bank","First Data Corporation","First Round Capital","First Solar India","FirstCry","FirstMark Capital","Fitternity","Flemingo","Fleur Hotels","Flipkart", "Flipspaces Technologies Labs","Flybridge Capital Partners", "Fonterra","Footpath Ventures","Ford","Forstar Hariom Agro Foods","Fortis Healthcare","Fosun Group","Foundamental VC","Foundation Capital","Framestore","Franklin Templeton","Frauscher Sensor Technology Group","FSN E-Commerce Ventures (Nykaa)","Fuji Electric","FunSpot","Future","G R Infraprojects","G.C. Beverages","Gail", "Gaja Capital Fund","Galaxy Surfactants","Galen Partners","Gamma Pizzakraft Overseas","Ganesh Ventures Capital", "Garden Reach Shipbuilders & Engineers","Gateway Distriparks","GCC Services India","GE Ventures", "General Atlantic",
		 "General Catalyst","General Electronics","General Motors","Generali","Generico","Genesis Partners","Genpact USA","GFB Great Foods","GGV Capital","Gibson Guitars","GIC","Gildemeister Beteiligungen","Ginni Systems","GIP","Girnar Software","GlaxoSmithKline","Glenmark Pharmaceuticals","Global Business Process Outsourcing Solutions Provider","Global Chartered Accountants","Global Cloud Xhange","Global United Shipping","Global University Systems","GLP","GMM Pfaudler","GMR","Godrej","Golden Highway","Goldman Sachs", "Good Capital","Google","Government of India","Grammer AG","Granite Ventures","Grasim Industries","Great Portland Estates","Green Agrevolution","Green Climate Fund","Greenko group","Greylock Partners","GTI Mediventures","GV","GVK Hancock",
		 "H.I.G Capital", "Hain Celestial Group","Hakuhodo","Haldirams","Halma","Hancock Galilee","Hanon Systems","Hansa Customer Equity","Haptik Infotech","HarbourVest Partners","Harris & Harris Group", "Hasbro","HBM","HCL Technologies","HDFC","HDFC Asset Management Company","HDFC Bank","HDFC Capital","HDFC Property Ventures","HDFC Standard Life Insurance Company","HealthCap","Healthkart","HealthQuad Advisors","Heineken","Helix Investments","Hella Infra Market","Hellenic Bank","Hellman & Friedman","Help Animals & Birds Association","Hem Securities","Hema Engineering Industries","Henry Ford Health Systems","Heritage Foods","Hero","Hexaware Technologies","Hg Capital","HIG Capital","Highland Capital Partners","Hinduja Leyland Finance","Hindustan Aeronautics","Hindustan Construction","Hindustan Media Ventures","Hindustan Petroleum","Hindustan Unilever","Hiranandani Gas","Hiscox","Hitachi","Hitachi Power Europe","Hi-Tech Pharmacal","HMSCorp.","Honasa Consumerin MamaEarth series D funding","Honda Motor Europe","Horizon Nuclear","Horizon Ventures","Horizons Ventures","HP","HSBC","HT Media","Huawei","Hubergroup","Hyderabad Industries","Hydrochina International Engineering Co. Ltd","Hydromine","Hyundai Mobis",
		 "I Squared Capital","Ian Martin Group Inc.","IAPMO Plumbing Codes and Standards India","Ibstock","ICG Strategic Equity and Affirma Capital's Fund 1","ICICI Bank","ICICI Prudential Asset Management","ICICI Securities","ICICI Ventures","IDBI Bank", "IDBI Capital Markets & Securities","Idea","IDFC","IDFC Bank","IDFC Equity","IDFC Parampara","IDG Ventures","IFC","IFFCO Tokio General Insurance", "IFM Investors","IHH Healthcare","IIFL","IIFL Seed Ventures Fund I and IIFL Select Equity Fund","IIFL Wealth Management Group","IL&FS Transportation","ILP II Ventures VII (IndoSpace)","IMC International Metalworking Companies B.V.","IMCD group","Imerys S.A.","Imperial Auto","Imperial Brands","Impresario Entertainment and Hospitality","Incofin","InCred","Indecomm Global Services","Index Ventures","India AlternativesEquity Fund","India Grid Trust","India Infrastructure Finance Company","India Quotient","India Resurgence Fund","Indiabulls Asset Management","Indiabulls Housing Finance","Indiabulls Real Estate","Indiabulls Ventures","Indian Oil Corporation","Indian Renewable Energy Development Agency","IndiGo","Indigrid","IndInfravit Trust","IndoSpace","IndoStar","IndusInd Bank","Industrial and Financial Systems, IFS AB","INEOS","Inflexion","Info Edge India","Infosys","ING Bank NV","Ingersoll Rand plc","Initialized Capital","Innovacom","Innovative Logistics Service","INOX Leisure","In-Q-Tel","INR Energy Ventures","Insight Venture Management","Insight Venture Partners","Instamojo Inc.","Institutional Venture Partners","Intel Capital","Intellect Design Arena","Intellectual Ventures","InterGlobe","International Finance Corporation","International Lift System","International Property Consultants","International Swaps and Derivatives Association","Intertape Polymer Group, Inc.(ITP:CA)","Inventus","Investcorp","Investec Bank","Iona Capital","Ircon International","IREO Group", "Israel Cleantech Ventures","ISS Group","istyle Inc., Japan","Italmatch Group","Italtractor ITM","ITC","Ivanhoe Cambridge","IvyCap Advisors","J M Financial","J&K Bank","JP Morgan",
		 "Jain Irrigation Systems","Jammu and Kashmir Bank","Japan Airlines","Japan Bank for International Cooperation","Jaypee Group","JB Cerestra Investment Management","Jerusalem Venture Partners","Jindal ITF","Jindal SAW","Jindal Steel & Power","Jio Haptik Technologies","JM Financial","JMI Equity","JohnLaing Infrastructure Fund","JonesLangLasalle Property Consultants India","JSW Energy","JSW Steel","JSW Ventures","Jubilee Capital Management","Jungle Ventures","Just Dial","Just Energy","Jwalamukhi Investment","Jyothy Laboratories","Kaiho Sangyo","Kalpataru Power Transmission","Kalpavriksh Fund","Kalpraj Dharamshi","Kandla Port Trust","Kapor Capital","Karun Carpets","Karvy","Kayu","KEF","Kerala Infrastructure Investment Fund Board","Kesoram Industries","Key Safety Systems Inc. (KSS)","KGD","Khan Global Engineering Solutions","Khazanah Nasional Berhad","Khosla Ventures","Kia Motors Corporation","Kiabi Europe","KIMS Healthcare Group","KKR","Kleiner Perkins","Kobe Steel","Kobelco Machinery India","Koch Industries", "Kohlberg Kravis Roberts & Co","Kolkata Port Trust","Kora Management","Kotak","Kotak Asset Management","Kotak Investment Advisors","Kotak Mahindra Bank","Kotak Mahindra Capital Company","Kraft Heinz Company","Krishak Bharati Cooperative","Kwench Global Technologies",
		 "L&T","L&T Finance","L&T IDPL","L&T Infotech","L&T Infrastructure Debt Fund","L&T Technology Services","Laboratories Fill-Med","Lakshmi Vilas Bank", "Lambert Energy LLP", "Laureate Education", "Lazard", "L-Brands", "Leadec Holding Bv & co.", "Leap India", "LeapFrog", "Lehman Brothers", "Lemon Tree Hotels","Leo", "Lexzau, Scharbau GmbH & Co. KG", "LGT", "LIC", "Lifcare","Lifelong Online Retail", "Lightbank","Lightbox Ventures","Lighter Capital", "Lightspeed Venture Partners", "Lightstone Global Fund", "Linde India", "Lionsgold", "Livfin India", "Livguard Batteries", "Livspace","Lloyds Banking Group", "Lodha Group", "Lok Capital", "LT Foods", "Lubrizol Corporation", "Lumis Partners","Lupin","Lux Capital", "Lyka BDR International",
		 "M.Pallonji & Company","M3","M3M Group","Macquarie Group", "Macquarie Group", "Madhu Jayanti International", "Madison Pacific Trust", "MAF Mauritius", "Mahagun Real Estate", "Mahindra", "Maiden Marketing", "Maj Invest", "MakeMyTrip India", "Malabar","Man Group", "Manchester United", "Manipal Education and Medical Group", "Manipal Integrated Services","Manta Ray Ventures", "Marcus Spurway","Marina Projects","Marks & Spencer", "Marriott", "Maschinenfabrik Reinhausen","MasterCard International","Matrix Partners", "Maverick","Maveron","Max Ventures and Industries", "Mayfield", "McCarthy & Stone", "McDonald's", "Medics International Life Sciences", "Medusind Solution", "Meidensha Corporation", "MEMG Family Office LLP", "Menlo Ventures", "Mercator", "Meritech Capital Partners", "Merlin Entertainment", "Merrill Lynch", "MESTECH Services", "Metlife", "Metropolis Healthcare", "Michael & Susan Dell Foundation", "Microsoft", "Midtown Acquisitions", "Millicom","Minafin Group", "Mindgate Solutions", "Mindtree", "Mintifi", "Mirae", "Mishry.com", "Misonix", "MiTAC Holdings Corporation.", "Mitsubishi Corporation", "Mitsui", "Mizuho Bank", "Mobisy Technologies", "Modern Food Enterprises", "Mohalla Tech", "Mom's Co","Moody","Moore", "Morgan Stanley","Morgenthaler Ventures", "Morningside", "Motherson Sumi", "Motilal Oswal", "Motive Partners", "MPC Rhine River", "MPOF Mauritius", "Mr. Gigi George", "Mrs. Bectors Food Specialities", "MUFG Bank", "MUGH 2", "Multi-Act", "Mumbai City FC", "Music Broadcast", "Muthoot","mValu Technology Services","Mylan Laboratories","MyMoneyMantra", 
		 "NAPL","Narayana Group", "Naspers", "Natco Pharma", "National Aluminium Company","National Grid Partners","National Infrastructure & Investment Fund","National Westminster Bank", "Naval Group", "Nayara Energy","Nazara Technologies", "NBCUniversal", "Neogen Chemicals", "Nephroplus", "Nestle", "Network International", "Neuberger Berman", "New Delhi Centre for Sight", "New Enterprise Associates", "New Lane Trading", "New MMI Holdings", "New SilkRoute", "New Vernon Equity", "News UK", "Next Events", "Next47", "Nexus Venture", "NHPEA Kamet", "NIIT", "Nippon LifeInsurance Company", "Nisa Industrial Services", "Nitin Saluja","Nobroker Technologies Solutions","Nomura", "Nordea", "Nordic Microfinance Initiative Fund", "Norwegian Microfinance Initiative", "Norwest Venture Partners", "Novartis India", "Novocura Tech Health Services","NSE", "NSPIRA Management Services","NTPC Ltd", "NTT Data Corporation", "NVR Mahasolar",
		 "O3 Capital","Oak Investment Partners","Oberoi Realty", "Ola","Oman India Joint Investment Fund Management", "Oman Insurance Company","Omax Autos","OMERS", "Omidyar Network","Omnicare", "Omnivore Partners", "ON Mauritius", "Ontario Municipal Employees Retirement System", "OpenOcean","Oracle","Orbimed Asia","Orchid Asia","Orion Capital Managers", "Orissa Stevedores", "OSL Healthcare","OTPP, AimCo and Wren House Infrastructure Management", "Oxford Properties","Oyorooms",
		 "Pacific Horizon Investment Trust Plc","Pactera Technology", "PAI Partners", "Palo Alto Networks", "Panchsheel Buildtech", "Pando", "Pandocorp", "Paragon Partners","Paras Healthcare","Parkwind NV","Patanjali Ayurved", "PayPal", "Paysense Pte", "Paytm","PayU Global", "Peepul Capital", "Peninsula Brookfield", "Penna Cement Industries","Penver Products","PEP Technologies(mCaffeine)","Pepperfry","PepsiCo","Permira","PestControl  India", "PetroChina","Petroineos", "Petroleum Nasional Berhad","Pharmaspectra", "Phillips 66", "PHL Fininvest","Phoenix Mills","Ping An","Piramal Capital","Piramal Enterprises", "Piramal Fund Management", "Piramal Group", "Pisces Eservices  (Foodpanda)", "Pitney Bowes", "Platinum Equity", "PNB Investment Services", "Pocket Aces Pictures", "Polaris Consulting & Services","Polaris Partners","Polycabs India","Power Finance Corporation","Pravega Ventures Trust","Prayag Polytech","Premaitha Health plc", "President ofIndia","Prestellar Ventures Fund 1","Prestige Estates Projects","PricewaterhouseCoopers","Principal Asset Management", "Procter & Gamble","Prosperfit Technologies","Prudential Corporation Holdings","PTC India","Pune Metropolitan Regional Development Authority","Puranik Builders",
		 "Q10","Qatar Holding LLC","Qdesq Realtech","Qiming Ventures", "Quadria Capital Investment Advisors", "Qualcomm", "Quantiphi", "Quess Corp","Quest2Travel", "Quicko Technosoft Labe", "Quikr", "Quilter","QVC Realty Developers", 
		 "R Jagadish", "Radius Ventures", "RAG-Stiftung Beteiligungsgesellschaft", "Rahi Care","Rainshine Entertainment","Raksha Energy","Rakyan Beverages","Ramky Enviro Engineers", "Ramky Infrastructure", "Rampart Trust","Ranbaxy", "REC", "Redefine Capital Fund LP", "Rediff.com","Redpoint Ventures","Regeneron Pharmaceuticals","Rekha Jhunjhunwala","Reliance","Reliance Capital", "Reliance Communications", "Reliance General Insurance Company", "Reliance Group", "Reliance Industrial Investment and Holdings", "Reliance Industries", "Reliance Infrastructure","Reliance Jio Digital Services","Reliance Jio Infocomm","Reliance Life Sciences", "Reliance Power","Reliance Strategic Business Ventures","RELX Overseas","ReNew Power", "RenewBuy.com", "Resolution Professional","Resonance Eduventures","Responsability","Resurgent Power Ventures","Reverence Capital Partners","Reverie Language Technologies","Revolution LLC","Rho Ventures","RHT Health Trust", "Ribbit","Ribbon Communications","Rincon Realty","Rio Tinto","Rise Fund","RNT Associates and Tahoe","Robert Bosch","Rockman Industries","Rockstud Capital","Rockwell Automation","Rolta India","Ronin Wines","Rosneft","Rothenberg Ventures","Royal Bank of Scotland N.V","Royal Group, UAE","RPG Ventures","RPSG Group","Rubicon Research","Rubique Technologies India","Rubixis Inc.","Ru-Net Investments","Ruptub Solutions Pvt Ltd (Treebo Hotels)",
		 "S.C.S.L Buildwell", "Saama Capital", "Sabre Investments","Sachin Bansal","SAEL", "Sagar Cements", "Sage Group","Sagent Lending Technologies","SAIF Partners","Sales Force","Samara Capital","Samhi Hotels","Samsung Ventures","Samunnati Financial Intermediation and Services","Sanaka Capital","Sanathnagar Enterprises","Sandhar Technologies","Sanghvi Beauty & Technology Private","Sanghvi Brands","Sankalp Semiconductor","Sanofi India","Sanofi S.A","Santander","Sapat International","Sapphire Foods","SAR Group","Sastasundar Healthbuddy","Saudi Arabian Oil Company","Savis Retail","SBI","SBI Capital Markets","Scale Venture Partners", "Schneider Electric SAS", "Schroders", "SCI Investments", "SCIOInspire", "Scorpio Group","SCP","SD Corporation","Sealink Capital Partners", "SenseHawk Inc.","Sensyne Health","Sentini Sanitarywares","Seoul Semiconductor","Sequoia Capital","Sethness Products Company","Seven Islands Shipping","Sevin Rosen Funds","Shantanu & Nikhil","Shapoorji Pallonji","ShareChat","ShopClues","Shopsense Retail","Shunwei Capital","SIDBI Venture Capital","Siemens","Sigma Systems Canada","Sigular Guff","Silver Lake Partners", "Sindhuja Microfinance","SingTel","Sirius Minerals", "Sixth Sense", "Sixth Sense India Opportunities II", "SJVN", "Smart Ventures", "SmartE", "Smartpaddle Technology", "Smartsign", "Snaptrude", "Social Capital", "Société Générale", "Sodexo", "Sofinnova Ventures", "Softbank","SoftTech VC", "Sojitz Corporation", "Somerset Indus Capital Partners", "Soros Economic Development Fund", "Spark Capital", "Spencer's Retail", "Sprng Energy (Actis)", "Sri Kauvery Medical Care", "Standard Chartered Bank", "Standard Life", "Steadview Capital", "SteelMint Info Services", "Stellapps Technologies", "Stellar Value Chain Solutions", "Stellaris Venture Partners", "Sterling Pharma", "Sterlite Power", "STMicroelectronics", "Strides Pharma Science", "Strides Shasun","STS", "Sulphur Mills", "Sumitomo", "Sun Packaging Systems", "Sun Pharmaceutical Industries", "Sun TV Network", "Sundaram Alternatives","Sunrise Containers", "Sunshine Teahouse", "Sunstone Education Technology", "Superskies Aviation","Supreme Treon", "Suryoday Small Finance Bank", "Suryodaya Small Bank", "SV Creditline", "Swaymbhu Natural Resources",
		 "TA Associates","TAL Education Group","Tangible Play", "Tano Capital","TAQA","Tata Alternative Investment Funds","Tata Asset Management","Tata AutoComp Systems", "Tata Capital", "Tata Communications", "Tata Consultancy Services", "Tata Group","Tata Sons","Tata Steel","Tata Teleservices","Taurus Armas SA","Taurus Asset Management Company  and Taurus Investment Trust Company", "TCNS Clothing","Teabox-Asian Tea Xpress", "Tech Mahindra", "Techmed Health Care and Diagnostics", "Teleperformance SE", "Temasek Holdings", "Tenaya Capital", "Tencent", "Tencent Holdings", "Tenneco Inc.", "Tevva Motors", "The Founders Fund", "Think", "Third Rock Ventures", "Thoma Bravo", "Thomas Cook", "Thomson Reuters", "THRE's European Cities Fund", "Thriveni Earthmovers", "Thyssenkrupp AG", "Tiger Global Management","Times Internet","Tirupati Infraprojects","Toba Capital", "Tomorrow Capital", "Toppr Technologies", "Total", "Toyo", "Toyota", "TP ICAP", "TPG", "TPG Capital", "Trans Adriatic Pipeline", "Treasure Vase Ventures", "Trive Capital", "True North","TrustLine Holdings", "TRW Automotive","Tudor","TUI", "Tulip Diagnostics","Tupperware India","TV Asia","TVS Automobile Solutions", "TVS Capital Funds", "Twentieth Century Fox","Twitter",
		 "U.S. Venture Partners","UAE Exhange","Uber","UBM Plc","UBS", "UFO Moviez India","Ultratech Cement","Ummeed Housing Finance","Uncanny Vision","Unilever","Union Square Ventures","Unitech Corporate Park PLC","United Research Laboratories","UnitedLex BPO","UPL","Urbanpiper Technology","UTI Capital","Utkarsh Small Finance Bank","UV Asset Reconstruction Company",
		 "Vaalon Capital","Valeant Pharmaceuticals","VantagePoint Venture Partners","Varde Partners Asia","Varroc Engineering","Varuna Investments","Vasuda","Vedanta Resources","Vedantu Innovations","Veen Waters","Venrock","Venture Highway","Ventureast Funds","Veriown Global Incorporated","Veritas","Vertafore","Vertex Ventures","Vertext Growth Fund","Vibrant Energy","Vikram Kapahi","Vikram Solar","Village Capital","Viola Ventures","Virgin Money","Visa International","Vista Equity Partners","Visteon Corporation","Vodafone","Vodafone Idea","Voith Turbo","Volcan Investments","Voltas","VTB","VVDN",
		 "W. L. Gore","Walmart Inc.","Walworth Investments","WANDA Group","Warburg Pincus","Warner Bros","WaterBridge Ventures","Waterland","WeGot Utilities","Wellington Partners Venture Capital","Wells Fargo","Welspun Group","WestBridge","Westbrook","Westpac Banking Corporation","Whirlpool Corporation","WHISHWORKS IT Consulting","White Oak Capital Partners","White Owl Brewery","Wibmo","Wickedride Adventure Services","William Blair & Company","William Grant and Sons","Wipro","Wockhardt","Wolverine Worldwide","World Learning","Worldpay","WoW Momo Foods","WPP","WRV Capital",
		 "Xander Group","Xiaomi Corporation",
		 "Yatra Online","YES Bank","Yodoyabashi & Yamagami LPC","YourOwnRoom",	 
		 "Zee Group","Zentiva Group","ZF Friedrichshafen AG","Zolostays Property Solutions","Zomato","Zykaa"];
     for (categoryId in clientsByCategory) {
    	 clientOptions += "<option>" + clientsByCategory[categoryId] + "</option>";
     }
     document.getElementById("client").innerHTML = clientOptions;
     
    
     var lawfirmoptions = "";
     lawfirmByCategory = ["","Advaita Legal", "Allen & Overy LLP", "ALMT Legal", "Altas Law Partners", "ARA Law", "Ashurst", "AZB & Partners","Baker McKenzie Wong & Leow","Bharucha & Partners","Bird & Bird LLP","BRUS CHAMBERS, Advocates & Solicitors", "Chadha & Co", "Clasis Law", "Cleary Gottlieb Steen & Hamilton","Clifford Chance", "Covington & Burling", "Cyril Amarchand Mangaldas", "Davis Polk & Wardwell LLP","Debevoise & Plimpton LLP", "Desai & Diwanji","Dhir & Dhir Associates", "DSK Legal","Dua Associates","Duane Morris & Selvam LLP", "Economic Laws Practice", "Fox Mandal","Freshfields Bruckhaus Deringer","Gibson Dunn","Hariani & Co., Advocates and Solicitors","Herbert Smith Freehills LLP","Hogan Lovells Lee & Lee","HSA Advocates","India Juris","IndusLaw","J Sagar Associates","Jones Day","Kanga & Co","Khaitan & Co","King & Spalding LLP","Kirkland & Ellis LLP","Kochhar & Co.","L&L Partners","Latham & Watkins LLP","LexCounsel","Link Legal India Law Services","Linklaters LLP","Majmudar & Partnrs","Manilal Kher Ambalal & Co Advocates, Solicitors and Notary","Mayer Brown","Milbank","Nishith Desai Associates","Norton Rose Fulbright","PDS Legal","Phoenix Legal","Rajani Associates","Reed Smith LLP","RNClegal","Ropes & Gray LLP","S&R Associates","Samvad Partners","Shardul Amarchand Mangaldas & Co","Shearman & Sterling LLP","Singh & Associates Founder - Manoj K Singh Advocates and Solicit","Singhania & Partners LLP","Skadden, Arps, Slate, Meagher & Flom LLP","Slaughter and May","SNG & PARTNERS","Solomon & Co. Advocates & Solicitors","Spice Route Legal","Squire Patton Boggs","Stephenson Harwood","Talwar Thakore & Associates","Tatva Legal","Titus & Co","Trilegal","Vaish Associates","Vertices Partners","Wadia Ghandy & Co","White & Case LLP","WongPartnership LLP","ZBA"];
     for (categoryId in lawfirmByCategory) {
    	 lawfirmoptions += "<option>" + lawfirmByCategory[categoryId] + "</option>";
     }
     document.getElementById("law_firm").innerHTML = lawfirmoptions; 
} 

function httpGet()
{
	var ajaxRequest = new XMLHttpRequest();
	ajaxRequest.onreadystatechange = function(){
	
		if(ajaxRequest.readyState == 4){
			//the request is completed, now check its status
			if(ajaxRequest.status == 200){
				//alert("Hiiiiiii");
				document.getElementById("client").innerHTML = ajaxRequest.responseText;
			}
			else{
				console.log("Status error: " + ajaxRequest.status);
			}
		}
		else{
			console.log("Ignored readyState: " + ajaxRequest.readyState);
		}
	}
	ajaxRequest.open('GET', '/ClientLawFirm');
	ajaxRequest.send();
	
	//refresh the chats in one second
	//setTimeout(getChats, 1000);
}


function validateForm()
{
	var client = document.getElementById('client');
    var law_firm = document.getElementById("law_firm");
    var date = document.getElementById("date");
    var addkey = document.getElementById("addkey");
    
    if(client.value !="" && law_firm.value!="")
    {
    	alert("Select either client or law_firm");
    	return;
    }
    var keylist = document.getElementsByName('keyword');
	var count=0;
	for(var i=1; i<=keylist.length; i++){
    	if(document.getElementById('key_'+i).checked == true){
    		count=count+1;
    	}
    }
   	
   	if(client.value == "ALL" && count==0 && addkey.value==""){
   		alert("Invalid Selection. Select keyword for all client selection");
   		return;
    }
   	else if(client.value == "" && law_firm.value == ""){
	   	
	   	if(count == 0 && addkey.value==""){
	   		alert("Invalid Selection. Select either client or law_firm or keywords");
	    	return;
	   	}
	   	else if(count > 3){
	   		alert("Too many keywords. Keywords should be less than 4");
	    	return;
	   	}
   	}
}

function checkAll(source){
    var keylist =document.getElementsByName('keyword'); //.checked = source.checked;
    var count=0;
    for(i=1;i<=keylist.length;i++){
    	document.getElementById('key_'+i).checked = source.checked;
    }
}

function checkSelectAll(){
	var selectall = document.getElementById('selectall');
	var keylist = document.getElementsByName('keyword');
	var count=0;
	for(var i=1; i<=keylist.length; i++){
    	if(document.getElementById('key_'+i).checked == true){
    		count=count+1;
    	}
    }
    if(count==keylist.length){
    	selectall.checked = true;
    }
    else{
    	selectall.checked = false;
    }
    
}
function checkkey(source){
	var tablerow =document.getElementById('tablerow');
	//.checked = source.checked;
    if(source.checked){
    	tablerow.style.display = 'table-row';
    }
    else{
    	tablerow.style.display = 'none';
    }
}

</script>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}
</style>
</head>
<body bgcolor="lightgrey"  onload="onload()">
<h2 align="center">News Details</h2>
<ul>
  <!-- <li><a href="index.jsp">Home</a></li> -->
  <li><a class="active" href="news.jsp">Latest News</a></li>
  <!-- <li><a href="historicdata.jsp">Historic Data</a></li>
  <li><a href="addDetails.jsp">Add New Deal</a></li>
  <li><a href="addkeyword.jsp">Add New Keyword</a></li> -->
</ul>
<br/>
<form action = "NewsServlet" method = "POST" target="_self">
	<table border="2" width="100%">
	<tr>
		<td width="25%"><b><label for="client">Select a client name:</label></b></td>
		<td width="50%">
			<select name="client" id="client"></select>
  			<%-- <input list="clients" name="client" id="client" width="250px" >
  			<jsp:useBean id="client" class="com.project.dropdown.ClientBean" scope="page"/>
  			<datalist id="clients">
			  <c:forEach var="item" items="${client.items}">
			     <option>${item}</option>
			  </c:forEach>
			</datalist> --%>	</td>	
	</tr>
	<tr>
		<td><b><label for="law_firm">Select a law firm:</label></b></td>
		<td>
			<select name="law_firm" id="law_firm"></select>
			<%-- <input list="law_firms" name="law_firm" id="law_firm" width="250px">
  			<jsp:useBean id="law_firm" class="com.project.dropdown.LawFirmBean" scope="page"/>
  			<datalist id="law_firms">
			  <c:forEach var="item" items="${law_firm.items}">
			     <option>${item}</option>
			  </c:forEach>
			</datalist> --%> 	</td>	
	</tr>
	<tr>
		<td><b>Date:</b></td>
		<td><input type="date" id="theDate" name="theDate" required >	</td>	
	</tr>
	
	<tr> 
	<td></td>
	<td><input type="checkbox" name="check" id="check" value="check" onclick="checkkey(this)">View Keywords<br/></td>
	</tr>
	
	<%-- <tr id="tablerow" style="display:none">
			<td><b>Keywords:</b></td>
			<td>
			<!-- <input list="key_name" name="key_name" id="key_name" width="250px"> -->
	  			<jsp:useBean id="key_name" class="com.project.dropdown.KeyBean" scope="page"/>
	  			<table>
	  				<tr> <td colspan="4" align="left"><u><input type="checkbox" name="selectall" id="selectall" value="selectall" onclick="checkAll(this)">Select All<br/></u> </td></tr>
					<tr>
				 	<c:forEach var="item" items="${key_name.items}" varStatus="theCount">
				      <td align="left" width="25%"><input type="checkbox" id="key_${theCount.count}" name="keyword"  value="${item}" onclick="checkSelectAll()">${item}<br/></td>
				       <c:if test="${ theCount.count % 4 == 0}">
				      	</tr><tr>
				      </c:if>
				  	</c:forEach>
				  	</tr>
				 </table>
			</td>
	</tr> --%>
	<tr id="tablerow" style="display:none">
		<td><b>Keywords:</b></td>
		<td>
		<table width="100%" id="keytbl">
		<tr> <td colspan="4" align="left"><u><input type="checkbox" name="selectall" id="selectall" value="selectall" onclick="checkAll(this)">Select All<br/></u> </td>
		<tr>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_1" value="Acquiring" onclick="checkSelectAll()">Acquiring<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_2" value="Acquisition" onclick="checkSelectAll()">Acquisition<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_3" value="Asia" onclick="checkSelectAll()">Asia<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_4" value="Broker" onclick="checkSelectAll()">Broker<br/> </td>
		</tr>
		<tr>	
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_5" value="Buy" onclick="checkSelectAll()">Buy<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_6" value="Buyout" onclick="checkSelectAll()">Buyout <br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_7" value="Capital" onclick="checkSelectAll()">Capital<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_8" value="Commodities" onclick="checkSelectAll()" >Commodities<br/> </td>
		</tr>
		<tr>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_9" value="Convertible debentures" onclick="checkSelectAll()">Convertible debentures<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_10" value="Deal" onclick="checkSelectAll()">Deal<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_11" value="Debt" onclick="checkSelectAll()" >Debt<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_12" value="Dis-stressed" onclick="checkSelectAll()">Dis-stressed<br/> </td>
		</tr>
		<tr>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_13" value="Exit" onclick="checkSelectAll()">Exit<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_14" value="Exited" onclick="checkSelectAll()">Exited<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_15" value="Eyes" onclick="checkSelectAll()">Eyes<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_16" value="Fund" onclick="checkSelectAll()">Fund<br/> </td>
		</tr>
		<tr>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_17" value="Grapevine" onclick="checkSelectAll()">Grapevine<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_18" value="Growth capital" onclick="checkSelectAll()">Growth capital<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_19" value="IBC" onclick="checkSelectAll()">IBC<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_20" value="India" onclick="checkSelectAll()">India<br/> </td>
		</tr>
		<tr>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_21" value="Insolvency" onclick="checkSelectAll()">Insolvency<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_22" value="Invest" onclick="checkSelectAll()">Invest<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_23" value="IPO" onclick="checkSelectAll()">IPO<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_24" value="Issue" onclick="checkSelectAll()">Issue<br/> </td>
		</tr>
		<tr>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_25" value="LBO" onclick="checkSelectAll()">LBO<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_26" value="Leveraged buyout" onclick="checkSelectAll()">Leveraged buyout<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_27" value="Merger" onclick="checkSelectAll()">Merger<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_28" value="Mezzanine Capital" onclick="checkSelectAll()">Mezzanine Capital<br/> </td>
		</tr>
		<tr>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_29" value="NCD" onclick="checkSelectAll()">NCD<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_30" value="New launch" onclick="checkSelectAll()">New launch<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_31" value="Non-convertible debentures" onclick="checkSelectAll()">Non-convertible debentures<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_32" value="PE" onclick="checkSelectAll()">PE<br/> </td>
		</tr>
		<tr>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_33" value="Private Equity" onclick="checkSelectAll()">Private Equity<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_34" value="Sell" onclick="checkSelectAll()">Sell<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_35" value="Shares" onclick="checkSelectAll()">Shares<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_36" value="Stake" onclick="checkSelectAll()">Stake<br/> </td>
		</tr>
		<tr>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_37" value="Stressed" onclick="checkSelectAll()">Stressed<br/> </td>
			<td align="left" width="25%"> <input type="checkbox" name="keyword" id="key_38" value="Venture Capital" onclick="checkSelectAll()">Venture Capital<br/> </td>
			<td></td>
			<td></td>
		</tr>	
		</table>
		</td>	
	</tr> 
	<tr>
		<td><b>Additional Keywords:</b>
		<td><input type="text" name="addkey" id="addkey"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type = "submit" value = "Fetch News" id="Submit" onclick="validateForm()" /></td>			
	</tr>
	
	</table>
	</form>
	
	
	
	
	<div id="fetcheddata" class="fetcheddata">
	
	<%-- <table border="2" width="100%" id="tbl1">
	<tr>
		<td width="100%">Most used Keywords for <b>${cname}</b><b>${lname}</b></td>
		
	</tr>
	<tr>
	<td>
   	<c:forEach items="${keycount}" var="keycount">
   		<c:if test="${not empty keycount[1]}">	   		
		   		<c:out value="${keycount[1]}" /> ;    	
    	</c:if>
	</c:forEach> </td>
	</tr>
	</table> --%>
	<c:choose>
	<c:when test="${not empty ndetails}">
	<h4>Fetched News</h4>
	<table border="2" width="100%" id="tbl1">
	<tr align="center">
		<td width="15%"><b>Date</b></td>
		<td width="45%"><b>URL</b></td>
		<td><b>Details</b></td>
	</tr>
   	<c:forEach items="${ndetails}" var="ndetails">
    	<tr>
    		<td><c:out value="${ndetails.date}" /></td>
    		<td><a href='${ndetails.url}' target="_blank">${ndetails.url}</a></td>
    		<td><c:out value="${ndetails.details}" /></td>
    	</tr>
	</c:forEach>
	
	</table>
	</div>
	</c:when>
	<c:otherwise>
		<div>
		<h4 style="color:red">${errorMessage}</h4>
	</div>
	</c:otherwise>
	</c:choose>

	
	
	
</body>
</html>