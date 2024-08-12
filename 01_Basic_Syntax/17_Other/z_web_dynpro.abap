" Web Dynpro là công nghệ giao diện người dùng chuẩn của SAP để phát triển các ứng dụng web trong môi trường ABAP. 
" Nó bao gồm môi trường runtime và môi trường phát triển đồ họa với các công cụ Web Dynpro đặc biệt. 
" Các công cụ này được tích hợp trong ABAP Workbench (SE80).

" Web Dynpro sử dụng ABAP làm ngôn ngữ lập trình và chạy trên ABAP stack để thực thi các đối tượng Web Dynpro ABAP.

" Kiến trúc Model -> View -> Controller (MVC):

" Request -> Controller: Event handling, Update application data, determine the control flow

" Controller ->(set)-> Model: Define the application data, Useful connection to the Business functionality

" Model ->(get)-> View: Provide the data to the view

" Controller -> View

" View -> Response