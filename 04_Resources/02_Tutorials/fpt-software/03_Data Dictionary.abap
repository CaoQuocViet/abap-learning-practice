" Real World => Data Model => ABAP Dictionnary => Relational DB
" Domain & Data Element

" Bộ công cụ quản tạo và quản lý các đối tượng CSDL --> Không cần kết nối xuống hệ thống CSDL để làm điều đó
" Đơn giản quá quá trình CRUD bằng tool, tải sử dụng và dùng chung các đối tượng CSDL

" Table --> Field --> Data Element --> Domain

" Field (Kiểu dữ liệu của Record, structure): Field name, Primary key indicator, Attributes inherited from data element. Nó quy định rất chặc chẽ các kiểu dữ liệu thành phần (type, hoa thường, thập phân mấy số,...
" Domain (kiểu dữ liệu kĩ thuật): Datatype, Num of chracters, output length, value table
" Dataelement (kiểu dữ liệu nghiệp vụ, người dùng): Attributes inherited from domain, field labels

" SAP định nghĩa kiểu dữ liệu phức tạp hơn các kiểu bình thường hay thấy, thông qua Domain & Data Element

" SAP Data: Master Data, System Data, Transaction Data, Configuration Data
" Master Data: G/L Account, Vendors, Materials, Stock Locations
" System Data: Meta Data, Programs, Doccumentation, System Settings
" Transaction Data: Sales Orders, Purchase Orders, Journal Entries, Goods Receipts
" Configuration Data: Currency Codes, Order Types, Payment Terms, Filed Status Codes


Structure & Work area: ST chỉ là cái khuôn, khi mình dùng thì cần một vùng nhớ để chứa dữ liệu làm việc, vùng này là WR

TYPES:	BEGIN OF TY_SPFLI,				" Define a structure
		CARRID		TYPE  SPFLI-CARRID,	" Airline
		CONNID		TYPE  SPFLI-CONNID,	" Flight Number
		CITYFROM	TYPE  SPFLI-CITYFROM,	" Departure City
		CITYTO		TYPE  SPFLI-CITYTO,	" Arrival City
		COUNTRYFR	TYPE  SPFLI-COUNTRYFR,	" Departure Country
		COUNTRYTO	TYPE  SPFLI-COUNTRYTO,	" Arrival Country
		NOTE		TYPE  TEXT40,
	END OF TY-SPFLI.

