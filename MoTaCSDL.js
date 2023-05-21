/*
<!-------------------->
Collection DiemBan:
DB001
{
    DB_Ma: "DB001"
    DB_DiaChi: "1 Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ"
    DB_TrangThai: "Dang hoat dong"
    DB_ToaDo: Object
                {
                    KinhDo: "..."
                    ViDo: "..."
                }
    DB_HopDongThue: Object
                {
                    HD_Ma: "HD001"
                    HD_Gia: "5.000.000/tháng"
                    HD_ThoiGian: "2 nam"
                    HD_BatDau: "01-01-2020"
                }
}


<!-------------------->
Collection NhanVien:
NV0001
{
    NV_Ma: "NV001"
    NV_HoTen: "Nhan Vien"
    NV_MatKhau: "123"
    NV_TrangThai: "Hoat dong"
    // Nơi làm việc sử dụng array để lưu lại thông tin nhân viên đã từng làm ở địa điểm nào
    NV_NoiLamViec: Array
                    1: Object
                     {
                        DB_Ma: "DB0001"
                     }    
    NV_Quyen: Object
            {
                Q_Ma: "1"
                Q_MoTa: "Quyen Admin"
            }
    NV_DanhSachHoaDon: Array
                    1: 
                    {
                        HD_Ma: "HD0001"
                    }
}


<!-------------------->
Collection KhachHang:
Trung001
{
    KH_Ma: "001"
    KH_HoTen: "Dang Thanh Trung"
    KH_Password: "123"
    KH_DanhSachHoaDon: Array
                    1: 
                    {
                        HD_Ma: "HD0001"
                    }
}


<!-------------------->
Collection SanPham:
CaPheSua
{
    SP_Ma: "SP0001"
    SP_Ten: "Cà phê sữa"
    SP_Gia: "15.000"
    SP_DiemBan: Array
            1: Object
            {
                DB_Ma: "DB0001"
            }
}


<!-------------------->
//Collection hóa đơn sẽ lưu thông tin theo mã hóa đơn, mỗi lần thêm sẽ đồng thời thêm mã hóa đơn đã lập vào nhân viên
Collection HoaDon:
HD001
{
    HD_Ma: "HD0001"
    HD_TongTien: "2.500.000"
    HD_TrangThai: "Chưa thanh toán"
    HD_GhiChu: "Để đá riêng"
    HD_ThoiGian: "12:00-10-10-2023"
    KH_Ma: "Trung001"
    NV_Ma: "NV0001"
    BD_Ma: "DB001"
    HD_DanhSachSanPham: Array
        1: Object
        {
            SP_Ma: "SP0001"
            SP_SoLuong: "10"
        }
    
}


<!-------------------->
Collection ChuongTrinhKhuyenMai:
KM0001
{
    KM_Ma: "KM0001"
    KH_ThoiGian: "7 ngày"
    KH_BatDau: "01-03-2020"
    KM_DiaDiem: "DB001"
}



*/