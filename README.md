# Grock Proxy

## Upload từ iPhone (Working Copy) – làm đúng 1 lần

1. Giải nén file zip này trên iPhone.
2. Mở **Working Copy** → tạo repo mới tên `GrockProxy` (hoặc xóa sạch repo cũ).
3. Import **toàn bộ nội dung bên trong** thư mục vừa giải nén (phải thấy 4 thứ chính):
   - folder `.github`
   - folder `GrockProxy`
   - folder `GrockProxy.xcodeproj`
   - file `README.md` + `ExportOptions.plist`
4. Commit → Push.
5. Vào GitHub → tab **Actions** → **Build IPA** → **Run workflow**.
6. Tải artifact → Esign → Sign → Cài.

Nếu tab Actions không hiện "Build IPA" = bạn thiếu folder `.github`.
