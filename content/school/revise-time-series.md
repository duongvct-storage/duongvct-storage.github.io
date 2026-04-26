---
title: Y4T2-Time Series revise
keywords: [school, time-series, revise]
date: 2026-04-26
theme: time-series
description:
Year 4 Term 2 - Time Series revise
---

# ON TAP CUOI KY: PHAN TICH DU LIEU CHUOI THOI GIAN

---

## MUC LUC

1. [PHẦN 1: Giới thiệu & Đặc điểm chuỗi thời gian](#phần-1-giới-thiệu--đặc-điểm-chuỗi-thời-gian)
2. [PHẦN 2: Kỹ thuật xử lý dữ liệu chuỗi thời gian](#phần-2-kỹ-thuật-xử-lý-dữ-liệu-chuỗi-thời-gian)
3. [PHẦN 3: Trích chọn đặc trưng](#phần-3-trích-chọn-đặc-trưng)
4. [PHẦN 4: Mô hình thống kê](#phần-4-mô-hình-thống-kê)

---

# PHẦN 1: GIỚI THIỆU & ĐẶC ĐIỂM CHUỖI THỜI GIAN

## 1.1 Lý thuyết

### 1.1.1 Định nghĩa Chuỗi Thời gian

**Chuỗi thời gian (Time Series)** là tập hợp các quan sát về một hiện tượng nào đó được thu thập theo trình tự trong một khoảng thời gian nhất định.

**Đặc điểm quan trọng:**
- Dữ liệu được thu thập theo thứ tự thời gian (time-ordered)
- Các quan sát tại các thời điểm cách đều nhau (hàng ngày, hàng tháng, hàng năm,...)

**Ký hiệu:**
- $Y_t$: giá trị quan sát được tại thời điểm $t$
- $T = 1, 2, \ldots, T$: Chỉ số thời gian

### 1.1.2 Phân loại chuỗi thời gian

#### a) Chuỗi liên tục (Continuous-time)
- Các quan sát được thực hiện liên tục theo thời gian
- Ví dụ: Điện tâm đồ (ECG), tín hiệu rung động máy, micro thu âm, cảm biến gia tốc

#### b) Chuỗi rời rạc (Discrete-time)
- Các quan sát chỉ được thực hiện tại những thời điểm cụ thể, thường cách đều nhau
- Ví dụ: Doanh số theo ngày/tuần/tháng, nhiệt độ ghi mỗi 10 phút

### 1.1.3 Nguồn gốc chuỗi thời gian rời rạc

1. **Từ chuỗi liên tục**: Lấy mẫu tại các khoảng thời gian bằng nhau
2. **Tổng hợp**: Tích lũy giá trị trong khoảng thời gian bằng nhau (sản lượng hàng tháng, lượng mưa hàng ngày)
3. **Vốn dĩ rời rạc**: Ví dụ cổ tức công ty qua các năm

### 1.1.4 Đặc điểm quan trọng của dữ liệu chuỗi thời gian

| Đặc điểm | Mô tả |
|----------|-------|
| **Thứ tự thời gian quan trọng** | Dữ liệu không thể xáo trộn thứ tự mà không làm mất ý nghĩa |
| **Phụ thuộc lẫn nhau (Autocorrelation)** | Giá trị hiện tại thường liên quan đến giá trị trước đó |
| **Không độc lập & đồng phân phối (Non-iid)** | Khác với dữ liệu thông thường, các quan sát không độc lập |

### 1.1.5 Minh họa bằng ví dụ

**Ví dụ 1**: Nhiệt độ trung bình hàng tháng ở một thành phố trong 6 năm
**Ví dụ 2**: Lợi nhuận thu được của một công ty trong 50 năm
**Ví dụ 3**: Doanh số bán hàng hàng tháng của một sản phẩm công nghiệp trong 15 năm

### 1.1.6 Tính dự đoán được

- Khi các quan sát liên tiếp phụ thuộc lẫn nhau, các giá trị tương lai có thể được dự đoán từ các quan sát trong quá khứ
- **Chuỗi xác định**: Có thể dự đoán chính xác
- **Chuỗi ngẫu nhiên**: Tương lai chỉ được xác định một phần bởi quá khứ → phải dùng phân phối xác suất có điều kiện

---

## 1.2 Bài tập

### Câu hỏi trắc nghiệm

**Câu 1**: Chuỗi thời gian là gì?
- A. Tập hợp các quan sát được thu thập ngẫu nhiên
- B. Tập hợp các quan sát được thu thập theo trình tự thời gian
- C. Tập hợp các quan sát độc lập với nhau
- D. Tập hợp các quan sát trong một thời điểm cố định

**Câu 2**: Đặc điểm nào KHÔNG phải của chuỗi thời gian?
- A. Thứ tự thời gian quan trọng
- B. Các quan sát độc lập với nhau
- C. Có tính tự tương quan (autocorrelation)
- D. Phụ thuộc vào thời gian

**Câu 3**: Chuỗi liên tục và chuỗi rời rạc khác nhau ở điểm nào?
- A. Số lượng quan sát
- B. Cách thu thập dữ liệu theo thời gian
- C. Độ chính xác của phép đo
- D. Không có sự khác biệt

**Câu 4**: Tại sao chuỗi thời gian không thể xáo trộn thứ tự?
- A. Vì dữ liệu quá lớn
- B. Vì thứ tự thời gian chứa thông tin quan trọng về mối quan hệ giữa các quan sát
- C. Vì máy tính không cho phép
- D. Vì các quan sát giống nhau

**Câu 5**: Khi nào một chuỗi thời gian có thể được dự đoán chính xác?
- A. Khi chuỗi là ngẫu nhiên hoàn toàn
- B. Khi chuỗi là chuỗi xác định (deterministic)
- C. Khi chuỗi có nhiều nhiễu
- D. Khi chuỗi có phương sai lớn

### Bài tập tự luận

**Bài 1**: Cho ví dụ về chuỗi thời gian trong thực tế và phân tích các đặc điểm của nó.

**Bài 2**: Giải thích sự khác biệt giữa chuỗi liên tục và chuỗi rời rạc. Cho 2 ví dụ cho mỗi loại.

**Bài 3**: Tại sao các phương pháp thống kê thông thường (giả định i.i.d) không áp dụng trực tiếp cho chuỗi thời gian?

---

## 1.3 Lời giải

### Đáp án trắc nghiệm

| Câu | Đáp án | Giải thích |
|-----|--------|------------|
| 1 | **B** | Chuỗi thời gian được định nghĩa là tập hợp các quan sát theo trình tự thời gian |
| 2 | **B** | Các quan sát trong chuỗi thời gian KHÔNG độc lập, chúng có tự tương quan |
| 3 | **B** | Chuỗi liên tục được đo liên tục, chuỗi rời rạc chỉ được đo tại các thời điểm cố định |
| 4 | **B** | Thứ tự thời gian chứa thông tin về autocorrelation và các mối quan hệ giữa các quan sát |
| 5 | **B** | Chuỗi xác định có thể dự đoán chính xác, chuỗi ngẫu nhiên chỉ dự đoán được phân phối xác suất |

### Lời giải bài tự luận

**Bài 1**:

*Ví dụ: Doanh số bán hàng hàng tháng của một cửa hàng trong 12 tháng*

**Đặc điểm:**
- **Thứ tự thời gian quan trọng**: Doanh số tháng này phụ thuộc vào các tháng trước
- **Tính xu hướng (trend)**: Có thể tăng hoặc giảm theo thời gian
- **Tính mùa vụ (seasonality)**: Doanh số có thể tăng vào dịp lễ, Tết
- **Tính chu kỳ**: Lặp lại theo chu kỳ nhất định
- **Nhiễu**: Biến động ngẫu nhiên không giải thích được

**Bài 2**:

*Chuỗi liên tục:*
1. Tín hiệu điện tâm đồ (ECG) - đo liên tục 24/7
2. Âm thanh từ micro - được ghi liên tục theo thời gian

*Chuỗi rời rạc:*
1. Doanh số bán hàng theo ngày - chỉ ghi nhận vào cuối ngày
2. Nhiệt độ đo mỗi 10 phút - không phải liên tục

*Sự khác biệt chính:*
- Chuỗi liên tục: quan sát được thực hiện liên tục, có thể nhận giá trị bất kỳ thời điểm nào
- Chuỗi rời rạc: quan sát chỉ tại các thời điểm xác định, thường cách đều nhau

**Bài 3**:

Các phương pháp thống kê thông thường (như OLS linear regression) giả định:
1. **Độc lập**: Các quan sát không ảnh hưởng lẫn nhau
2. **Đồng phân phối (i.i.d)**: Phân phối xác suất không thay đổi theo thời gian

Trong chuỗi thời gian:
- Quan sát tại thời điểm $t$ phụ thuộc vào các quan sát tại $t-1, t-2, ...$ (autocorrelation)
- Phân phối có thể thay đổi theo thời gian (non-stationary)

→ Cần sử dụng các phương pháp đặc biệt như ARIMA, VAR, state-space models để xử lý.

---

# PHẦN 2: KỸ THUẬT XỬ LÝ DỮ LIỆU CHUỖI THỜI GIAN

## 2.1 Lý thuyết

### 2.1.1 Nhãn thời gian (Timestamp)

#### Định nghĩa
Nhãn thời gian là giá trị hoặc tập giá trị biểu diễn thời điểm xảy ra của một quan sát trong chuỗi dữ liệu.

#### Các dạng nhãn thời gian

| Dạng | Ví dụ | Mô tả |
|------|-------|-------|
| **Real-time** | 2025-07-22 09:15:23 | Theo thời gian thực |
| **Interval** | Tháng 1/2025, Tuần 23 | Theo khoảng thời gian |
| **Index-based** | Quan sát 1, 2, 3 | Dạng số thứ tự |

#### Tầm quan trọng của nhãn thời gian
- Xác định thứ tự và khoảng cách giữa các quan sát
- Phân tích xu hướng & mùa vụ
- Tính toán độ trễ, hồi quy, dự báo
- Gắn kết dữ liệu từ nhiều nguồn theo cùng trục thời gian

#### Lưu ý khi xử lý
- Kiểm tra định dạng & chuẩn hóa (YYYY-MM-DD HH:MM:SS)
- Kiểm tra tính đồng nhất (khoảng cách giữa các mốc)
- Xử lý dữ liệu thiếu / lỗi nhãn
- Chuyển múi giờ khi cần
- Lựa chọn độ phân giải phù hợp: Giây, Phút, Giờ, Ngày, Tuần, Tháng, Quý, Năm

### 2.1.2 Làm sạch dữ liệu (Data Cleaning)

#### Mục đích
- Loại bỏ hoặc chỉnh sửa dữ liệu sai, thiếu, không hợp lệ
- Khử nhiễu & làm mịn: Giảm dao động ngẫu nhiên, làm rõ xu hướng
- Tăng cường dữ liệu: Tạo thêm dữ liệu để cải thiện mô hình

#### Các vấn đề cần xử lý
1. **Missing values**: Dữ liệu bị thiếu
2. **Outliers**: Giá trị ngoại lai
3. **Inconsistent timestamps**: Nhãn thời gian không đồng nhất
4. **Seasonality**: Tính thời vụ
5. **Look-ahead**: Vấn đề nhìn trước

### 2.1.3 Xử lý dữ liệu bị thiếu (Missing Data)

#### Nguyên nhân
- Gánh nặng của việc lấy mẫu
- Phép đo không chính xác (chủ quan/khách quan)
- Nhập sai dữ liệu

#### Các phương pháp điền giá trị thiếu

##### a) Forward Fill (Điền tiếp)

Thay thế giá trị bị thiếu bằng giá trị gần nhất trước đó:

$$x_t = x_{t-1} \text{ nếu } x_t \text{ bị thiếu}$$

**Ưu điểm**: Đơn giản nhất
**Nhược điểm**:
- Không phù hợp khi có trend mạnh
- Khoảng missing dài → dữ liệu bị phẳng (flat-line)
- Không dùng được cho điểm thiếu ở đầu chuỗi

**Phù hợp khi**:
- Giá trị giữ ổn định cho đến khi có thay đổi mới
- Đặc trưng step function / piecewise constant
- Ví dụ: Giá trị tài khoản ngân hàng, trạng thái thiết bị (on/off)

##### b) Simple Moving Average (SMA) - Trung bình động đơn giản

$$\tilde{x}_t = \frac{x_{t-1} + x_{t-2} + \cdots + x_{t-k}}{k}$$

##### c) Centered Moving Average (CMA) - Trung bình động hai phía

$$\tilde{x}_t = \frac{\sum_{i=1}^{k} x_{t-i} + \sum_{i=1}^{k} x_{t+i}}{2k}$$

##### d) Weighted Moving Average (WMA) - Trung bình động có trọng số

$$\tilde{x}_t = \sum_{i=1}^{k} w_i x_{t-i}, \quad \sum w_i = 1$$

Điểm gần có trọng số lớn hơn.

##### e) Linear Interpolation (Nội suy tuyến tính)

Nếu có $x_{t_1} = a$ và $x_{t_2} = b$ với $t_1 < t < t_2$:

$$\tilde{x}_t = a + \frac{t - t_1}{t_2 - t_1}(b - a)$$

##### f) Cubic Spline Interpolation (Nội suy bậc ba)

Dùng đa thức bậc 3 ghép lại, đảm bảo:
- Liên tục về hàm số
- Liên tục về đạo hàm bậc 1
- Liên tục về đạo hàm bậc 2

#### So sánh các phương pháp

| Phương pháp | Ưu điểm | Hạn chế |
|-------------|---------|---------|
| Forward Fill | Đơn giản, nhanh | Sai lệch khi có trend |
| SMA | Làm mượt tốt | Mất tính biến động |
| CMA | Cân bằng 2 phía | Độ phức tạp cao hơn |
| WMA | Linh hoạt | Cần chọn trọng số phù hợp |
| Linear Interpolation | Đơn giản, khớp xu hướng | Không mượt ở điểm nối |
| Cubic Spline | Mượt, chính xác | Tính toán phức tạp |

---

## 2.2 Bài tập

### Bài tập tính toán

**Bài 1**: Cho chuỗi thời gian: $x = [10, 12, NaN, NaN, 15, 18, NaN, 22, 25]$

a) Điền giá trị NaN bằng Forward Fill
b) Điền giá trị NaN bằng SMA với $k = 2$ (chỉ nhìn backward)
c) Điền giá trị NaN bằng Linear Interpolation

**Bài 2**: Cho chuỗi: $x = [5, 8, 12, NaN, NaN, 20, 22]$

Sử dụng CMA với $k = 2$ để điền giá trị thiếu.

**Bài 3**: Cho chuỗi: $x = [100, 110, NaN, 125, 135, NaN, 150]$

a) Tính SMA(2) cho các điểm thiếu
b) Tính Linear Interpolation
c) So sánh kết quả và nhận xét

**Bài 4**: Một chuỗi nhiệt độ có missing data tại các thời điểm 5, 6, 7 (liên tiếp). Giá trị trước missing là 30°C, sau missing là 35°C. Tính giá trị điền cho mỗi thời điểm bằng:
a) Forward Fill
b) Backward Fill
c) Linear Interpolation
d) SMA(3) chỉ backward

**Bài 5**: Giải thích tại sao Forward Fill không phù hợp khi chuỗi có xu hướng tăng/giảm mạnh. Cho ví dụ minh họa.

---

## 2.3 Lời giải

### Bài 1:

**a) Forward Fill:**

```
x = [10, 12, NaN, NaN, 15, 18, NaN, 22, 25]
     1   2    3    4    5   6    7    8   9
```

- t=3: NaN → lấy giá trị t=2 = 12
- t=4: NaN → lấy giá trị t=3 (đã điền) = 12
- t=7: NaN → lấy giá trị t=6 = 18

**Kết quả:** $x_{ff} = [10, 12, 12, 12, 15, 18, 18, 22, 25]$

**b) SMA với k=2 (backward):**

- t=3: $\tilde{x}_3 = (x_2 + x_1)/2 = (12 + 10)/2 = 11$
- t=4: $\tilde{x}_4 = (x_3 + x_2)/2 = (11 + 12)/2 = 11.5$
- t=7: $\tilde{x}_7 = (x_6 + x_5)/2 = (18 + 15)/2 = 16.5$

**Kết quả:** $x_{sma} = [10, 12, 11, 11.5, 15, 18, 16.5, 22, 25]$

**c) Linear Interpolation:**

- Đoạn t=2 đến t=5: $(t_1=2, x_1=12), (t_2=5, x_2=15)$
  - t=3: $\tilde{x}_3 = 12 + \frac{3-2}{5-2}(15-12) = 12 + 1 = 13$
  - t=4: $\tilde{x}_4 = 12 + \frac{4-2}{5-2}(15-12) = 12 + 2 = 14$

- Đoạn t=6 đến t=8: $(t_1=6, x_1=18), (t_2=8, x_2=22)$
  - t=7: $\tilde{x}_7 = 18 + \frac{7-6}{8-6}(22-18) = 18 + 2 = 20$

**Kết quả:** $x_{li} = [10, 12, 13, 14, 15, 18, 20, 22, 25]$

---

### Bài 2:

Chuỗi: $x = [5, 8, 12, NaN, NaN, 20, 22]$

CMA với $k=2$: $\tilde{x}_t = \frac{x_{t-2} + x_{t-1} + x_{t+1} + x_{t+2}}{4}$

- t=4: $\tilde{x}_4 = \frac{x_2 + x_3 + x_5 + x_6}{4} = \frac{8 + 12 + 20 + 22}{4} = \frac{62}{4} = 15.5$
- t=5: $\tilde{x}_5 = \frac{x_3 + x_4 + x_6 + x_7}{4} = \frac{12 + 15.5 + 20 + 22}{4} = \frac{69.5}{4} = 17.375$

**Kết quả:** $x = [5, 8, 12, 15.5, 17.375, 20, 22]$

---

### Bài 3:

Chuỗi: $x = [100, 110, NaN, 125, 135, NaN, 150]$

**a) SMA(2) backward:**

- t=3: $\tilde{x}_3 = (110 + 100)/2 = 105$
- t=6: $\tilde{x}_6 = (135 + 125)/2 = 130$

**b) Linear Interpolation:**

- Đoạn t=2→4: $(t_1=2, x_1=110), (t_2=4, x_2=125)$
  - t=3: $\tilde{x}_3 = 110 + \frac{3-2}{4-2}(125-110) = 110 + 7.5 = 117.5$

- Đoạn t=5→7: $(t_1=5, x_1=135), (t_2=7, x_2=150)$
  - t=6: $\tilde{x}_6 = 135 + \frac{6-5}{7-5}(150-135) = 135 + 7.5 = 142.5$

**c) So sánh:**

| Phương pháp | t=3 | t=6 |
|-------------|-----|-----|
| SMA(2) | 105 | 130 |
| Linear Interpolation | 117.5 | 142.5 |

**Nhận xét:**
- Linear Interpolation cho giá trị cao hơn vì tính đến trend tăng
- SMA(2) chỉ nhìn backward nên bỏ qua thông tin từ tương lai gần
- Trong chuỗi có trend, Linear Interpolation thường chính xác hơn

---

### Bài 4:

Chuỗi: [..., 30, NaN, NaN, NaN, 35, ...]

**a) Forward Fill:**

- t=5: 30
- t=6: 30
- t=7: 30

**Kết quả:** $[30, 30, 30]$ - **Sai hoàn toàn!** Không phản ánh trend tăng

**b) Backward Fill:**

- t=7: 35
- t=6: 35
- t=5: 35

**Kết quả:** $[35, 35, 35]$ - **Sai!** Ngược chiều trend

**c) Linear Interpolation:**

$$\tilde{x}_t = 30 + \frac{t - 4}{8 - 4}(35 - 30) = 30 + \frac{t-4}{4} \times 5$$

- t=5: $30 + \frac{1}{4} \times 5 = 31.25$
- t=6: $30 + \frac{2}{4} \times 5 = 32.5$
- t=7: $30 + \frac{3}{4} \times 5 = 33.75$

**Kết quả:** $[31.25, 32.5, 33.75]$ - **Hợp lý nhất!**

**d) SMA(3) backward:**

- t=5: $(30 + 30 + 30)/3 = 30$ (cần 3 giá trị trước)
- t=6: $(30 + 30 + 30)/3 = 30$
- t=7: $(30 + 30 + 30)/3 = 30$

**Kết quả:** $[30, 30, 30]$ - Không tốt hơn Forward Fill

---

### Bài 5:

**Giải thích:**

Forward Fill lấy giá trị cuối cùng được quan sát và kéo dài nó cho đến khi có giá trị mới. Điều này gây ra vấn đề nghiêm trọng khi chuỗi có xu hướng.

**Ví dụ minh họa:**

Chuỗi nhiệt độ trung bình ngày trong tuần:
- Thứ 2: 20°C
- Thứ 3: 22°C
- Thứ 4: **Missing** → Forward Fill = 22°C
- Thứ 5: **Missing** → Forward Fill = 22°C
- Thứ 6: **Missing** → Forward Fill = 22°C
- Thứ 7: 30°C

Nếu nhiệt độ thực tế tăng dần (22→24→26→28→30), thì Forward Fill sẽ cho:
$[20, 22, 22, 22, 22, 30]$ → **Sai lệch rất lớn!**

Trong khi Linear Interpolation sẽ cho:
$[20, 22, 24, 26, 28, 30]$ → **Gần đúng với thực tế**

**Kết luận:**
- Forward Fill chỉ phù hợp với dữ liệu ít thay đổi hoặc step function
- Khi có trend rõ ràng, nên dùng Linear Interpolation hoặc các phương pháp phức tạp hơn

---

# PHẦN 3: TRÍCH CHỌN ĐẶC TRƯNG

## 3.1 Lý thuyết

### 3.1.1 Giới thiệu

#### Tại sao cần trích chọn đặc trưng?
- Dữ liệu thô thường rất dài và khó xử lý trực tiếp
- Chứa nhiều nhiễu
- Trích chọn đặc trưng giúp: Tóm tắt thông tin, giảm chiều dữ liệu, dễ huấn luyện mô hình

### 3.1.2 Phân đoạn chuỗi thời gian (Time Series Segmentation)

**Định nghĩa**: Chia chuỗi thời gian dài thành nhiều đoạn nhỏ, mỗi đoạn có tính chất ổn định hơn.

**Mục đích:**
- Tìm điểm thay đổi (change points)
- Đại diện chuỗi bằng các đoạn có ý nghĩa (piecewise constant, piecewise linear)
- Làm mô hình tốt hơn, giảm nhiễu

**Các kiểu phân đoạn:**
1. **Dựa trên mô hình**: Mỗi đoạn tuân theo một mô hình đơn giản
2. **Dựa trên thống kê**: Mean/variance/trend thay đổi → change point
3. **Dựa trên tín hiệu**: Dùng Fourier/Wavelet transform

### 3.1.3 Cửa sổ trượt (Sliding Window)

**Định nghĩa**: Kỹ thuật lấy các đoạn con có độ dài cố định từ chuỗi thời gian.

**Tham số:**
- Window size (W): Chiều dài cửa sổ
- Step size (S): Khoảng dịch chuyển mỗi lần

**Ví dụ:**
```
Chuỗi: [1, 2, 3, 4, 5, 6]
Window size = 3, Step = 1
→ Các cửa sổ: [1,2,3], [2,3,4], [3,4,5], [4,5,6]
```

### 3.1.4 Đặc trưng thống kê

#### Nhóm 1: Mức độ trung tâm

**Trung bình (Mean):**
$$\bar{x} = \frac{1}{n}\sum_{t=1}^{n} x_t$$

**Trung vị (Median):** Giá trị giữa khi sắp xếp tăng dần

#### Nhóm 2: Độ phân tán

**Phương sai (Variance):**
$$\sigma^2 = \frac{1}{n}\sum_{t=1}^{n}(x_t - \bar{x})^2$$

**Độ lệch chuẩn (Standard Deviation):**
$$\sigma = \sqrt{\sigma^2}$$

**Range:** $R = max - min$

- **Max**: Giá trị cao nhất
- **Min**: Giá trị thấp nhất

#### Nhóm 3: Hình dạng phân phối

**Độ lệch (Skewness):**
$$\text{Skewness} = \frac{E[(X - \mu)^3]}{\sigma^3}$$

- Skewness = 0: Phân phối đối xứng
- Skewness > 0: Lệch phải (right-skewed) - đuôi phải dài hơn
- Skewness < 0: Lệch trái (left-skewed) - đuôi trái dài hơn

#### Nhóm 4: Phụ thuộc theo thời gian

**Hàm tự hiệp phương sai (Autocovariance):**
$$\gamma_{t,s} = \text{Cov}(X_t, X_s) = E[(X_t - E[X_t])(X_s - E[X_s])]$$

**Hàm tự tương quan (ACF):**
$$\rho(t, t-k) = \frac{\gamma_{t, t-k}}{\gamma_{t,t}}$$

### 3.1.5 Tính dừng (Stationarity)

#### Tính dừng nghiêm ngặt (Strict Stationarity)

$$F(X_{t_1}, X_{t_2}, \ldots, X_{t_n}) = F(X_{t_1+k}, X_{t_2+k}, \ldots, X_{t_n+k})$$

∀ các điểm thời gian $t$ và độ dịch chuyển $k$ bất kỳ.

#### Tính dừng (yếu) ((Weak) Stationarity)

Một chuỗi là dừng yếu nếu:

1. $E[X_t] = \mu$ (không đổi theo thời gian)
2. $\text{Var}(X_t) = \sigma^2$ (không đổi theo thời gian)
3. $\gamma(t, s) = \gamma(t-s, 0)$ (chỉ phụ thuộc vào độ trễ)

### 3.1.6 Hàm tự tương quan (ACF) và PACF

#### ACF (Autocorrelation Function)

$$\rho_k = \frac{\gamma_k}{\gamma_0}$$

**Đặc điểm:**
- $\rho_0 = 1$
- $\rho_k = \rho_{-k}$
- $\rho_k \in [-1, 1]$

**Ý nghĩa:**
- ACF giảm từ từ → có trend hoặc chu kỳ
- ACF giảm nhanh → dữ liệu khá stationary

#### PACF (Partial Autocorrelation Function)

Hệ số tự tương quan giữa $Y_t$ và $Y_{t-k}$ sau khi loại bỏ ảnh hưởng của các biến ở giữa.

**Ý nghĩa:**
- PACF cắt tại lag p → gợi ý mô hình AR(p)
- ACF cắt tại lag q → gợi ý mô hình MA(q)

### 3.1.7 Đặc trưng miền tần số

#### Biến đổi Fourier rời rạc (DFT)

$$X(\omega_k) = \sum_{t=0}^{T-1} x_t e^{-i\omega_k t}, \quad \omega_k = \frac{2\pi k}{T}$$

#### Phổ công suất (Power Spectral Density - PSD)

$$S(\omega_k) = \frac{1}{T}|X(\omega_k)|^2$$

**Ý nghĩa:**
- Đỉnh (peaks) trong PSD → chu kỳ mạnh
- PSD rộng → tín hiệu nhiễu
- PSD sắc, cao → tín hiệu có chu kỳ rõ ràng

#### Tần số chủ đạo (Dominant Frequency)

$$f^* = \arg\max_f S(f)$$

$$T^* = \frac{1}{f^*}$$

#### Spectral Entropy

$$H = -\sum_k p_k \log(p_k)$$

Trong đó $p_k = \frac{S(\omega_k)}{\sum_j S(\omega_j)}$

- Entropy cao → năng lượng phân tán → khó dự đoán
- Entropy thấp → có vài tần số trội → dễ dự đoán

### 3.1.8 Toán tử chuỗi thời gian

#### Toán tử dịch ngược (Backshift Operator)

$$B x_t = x_{t-1}$$
$$B^k x_t = x_{t-k}$$

#### Toán tử sai phân (Difference Operator)

$$\nabla x_t = x_t - x_{t-1} = (1-B)x_t$$
$$\nabla^2 x_t = \nabla(\nabla x_t) = (1-B)^2 x_t$$

---

## 3.2 Bài tập

### Bài tập tính toán đặc trưng thống kê

**Bài 1**: Cho chuỗi $x = [2, 5, 3, 8, 1, 4, 6, 2]$

Tính:
a) Trung bình ($\bar{x}$)
b) Phương sai ($\sigma^2$)
c) Độ lệch chuẩn ($\sigma$)
d) Range
e) Max, Min

**Bài 2**: Cho chuỗi $y = [1, 3, 3, 3, 5, 5, 7, 9, 9, 9]$

Tính skewness và nhận xét về phân phối.

**Bài 3**: Tính autocorrelation (ACF) tại lag 1 và lag 2 cho chuỗi:
$x = [4, 2, 5, 8, 6]$

### Bài tập về tính dừng

**Bài 4**: Kiểm tra tính dừng của các chuỗi sau:

a) $x_t = \beta t + \varepsilon_t$ (với $\beta \neq 0$)
b) $x_t = \varepsilon_t - \beta \varepsilon_{t-1}$
c) $x_t = x_{t-1} + \varepsilon_t$
d) $x_t = \mu + \varepsilon_t$ (white noise)

**Bài 5**: Cho quá trình ngẫu nhiên $\{ \varepsilon_t \}$ với $E[\varepsilon_t] = 0$ và $\text{Var}(\varepsilon_t) = \sigma^2$. Tính ACF của:
a) $\varepsilon_t$ (white noise)
b) $x_t = \varepsilon_t - 0.5 \varepsilon_{t-1}$

### Bài tập cửa sổ trượt

**Bài 6**: Cho chuỗi $x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]$

Với window size = 4 và step size = 2, liệt kê tất cả các cửa sổ.

**Bài 7**: Với chuỗi ở Bài 6, tính trung bình của mỗi cửa sổ và nhận xét.

### Bài tập miền tần số

**Bài 8**: Giải thích ý nghĩa của PSD (Power Spectral Density). Khi nào thì một chuỗi có PSD với đỉnh cao và hẹp?

---

## 3.3 Lời giải

### Bài 1:

Chuỗi $x = [2, 5, 3, 8, 1, 4, 6, 2]$, $n = 8$

**a) Trung bình:**
$$\bar{x} = \frac{2 + 5 + 3 + 8 + 1 + 4 + 6 + 2}{8} = \frac{31}{8} = 3.875$$

**b) Phương sai:**
$$\sigma^2 = \frac{\sum(x_i - \bar{x})^2}{n}$$
$$= \frac{(2-3.875)^2 + (5-3.875)^2 + (3-3.875)^2 + (8-3.875)^2 + (1-3.875)^2 + (4-3.875)^2 + (6-3.875)^2 + (2-3.875)^2}{8}$$
$$= \frac{3.516 + 1.266 + 0.766 + 17.016 + 8.266 + 0.016 + 4.516 + 3.516}{8}$$
$$= \frac{38.878}{8} = 4.86$$

**c) Độ lệch chuẩn:**
$$\sigma = \sqrt{4.86} \approx 2.20$$

**d) Range:**
$$\text{Range} = \max - \min = 8 - 1 = 7$$

**e) Max, Min:**
$$\max = 8, \min = 1$$

---

### Bài 2:

Chuỗi $y = [1, 3, 3, 3, 5, 5, 7, 9, 9, 9]$, $n = 10$

**Tính skewness:**

$$\text{Skewness} = \frac{E[(Y - \mu)^3]}{\sigma^3}$$

$$\bar{y} = \frac{1+3+3+3+5+5+7+9+9+9}{10} = \frac{54}{10} = 5.4$$

Đếm tần suất:
- Giá trị 1: 1 lần
- Giá trị 3: 3 lần
- Giá trị 5: 2 lần
- Giá trị 7: 1 lần
- Giá trị 9: 3 lần

Tính $\sum (y_i - \bar{y})^3$:
- $(1-5.4)^3 = (-4.4)^3 = -85.184$
- $3 \times (3-5.4)^3 = 3 \times (-2.4)^3 = 3 \times (-13.824) = -41.472$
- $2 \times (5-5.4)^3 = 2 \times (-0.4)^3 = 2 \times (-0.064) = -0.128$
- $(7-5.4)^3 = (1.6)^3 = 4.096$
- $3 \times (9-5.4)^3 = 3 \times (3.6)^3 = 3 \times 46.656 = 139.968$

$$\sum = -85.184 - 41.472 - 0.128 + 4.096 + 139.968 = 17.28$$

$$\text{Skewness} = \frac{17.28}{10 \times \sigma^3}$$

Tính $\sigma^2$:
$$\sum(y_i - \bar{y})^2 = 19.36 + 17.28 + 0.128 + 2.56 + 38.88 = 78.208$$
$$\sigma^2 = \frac{78.208}{10} = 7.8208$$
$$\sigma = \sqrt{7.8208} \approx 2.797$$

$$\text{Skewness} = \frac{17.28}{10 \times 2.797^3} = \frac{17.28}{10 \times 21.87} = \frac{17.28}{218.7} \approx 0.079$$

**Nhận xét:** Skewness ≈ 0.079 > 0, nhưng gần bằng 0, nên phân phối gần như đối xứng. Tuy nhiên, do các giá trị 3 và 9 xuất hiện nhiều hơn (lệch về hai phía), đây là phân phối **platykurtic** (ít đỉnh hơn phân phối chuẩn).

---

### Bài 3:

Chuỗi $x = [4, 2, 5, 8, 6]$, $n = 5$

**Tính ACF:**

**Lag 0 (autocorrelation tại chính nó):**
$$\gamma_0 = \text{Var}(x) = \sigma^2_x$$

$$\bar{x} = \frac{4+2+5+8+6}{5} = 5$$

$$\gamma_0 = \frac{(4-5)^2 + (2-5)^2 + (5-5)^2 + (8-5)^2 + (6-5)^2}{5} = \frac{1+9+0+9+1}{5} = 4$$

**Lag 1:**
$$\gamma_1 = \frac{\sum_{t=1}^{4}(x_t - \bar{x})(x_{t+1} - \bar{x})}{n}$$
$$= \frac{(4-5)(2-5) + (2-5)(5-5) + (5-5)(8-5) + (8-5)(6-5)}{5}$$
$$= \frac{(-1)(-3) + (-3)(0) + (0)(3) + (3)(1)}{5} = \frac{3 + 0 + 0 + 3}{5} = \frac{6}{5} = 1.2$$

$$\rho_1 = \frac{\gamma_1}{\gamma_0} = \frac{1.2}{4} = 0.3$$

**Lag 2:**
$$\gamma_2 = \frac{\sum_{t=1}^{3}(x_t - \bar{x})(x_{t+2} - \bar{x})}{n}$$
$$= \frac{(4-5)(5-5) + (2-5)(8-5) + (5-5)(6-5)}{5}$$
$$= \frac{(-1)(0) + (-3)(3) + (0)(1)}{5} = \frac{0 - 9 + 0}{5} = -1.8$$

$$\rho_2 = \frac{-1.8}{4} = -0.45$$

---

### Bài 4:

**a) $x_t = \beta t + \varepsilon_t$ với $\beta \neq 0$**

$$E[x_t] = \beta t \quad \text{(phụ thuộc vào t!)}$$

→ **Không dừng** vì kỳ vọng thay đổi theo thời gian

**b) $x_t = \varepsilon_t - \beta \varepsilon_{t-1}$**

$$E[x_t] = 0 \quad \text{(không đổi)}$$
$$\text{Var}(x_t) = \sigma^2 + \beta^2\sigma^2 = (1+\beta^2)\sigma^2 \quad \text{(không đổi)}$$
$$\gamma_k = \text{Cov}(x_t, x_{t-k}) \quad \text{chỉ phụ thuộc vào k}$$

→ **Dừng** (đây là mô hình MA(1))

**c) $x_t = x_{t-1} + \varepsilon_t$**

Đây là **Random Walk**:
$$x_t = x_0 + \sum_{i=1}^{t}\varepsilon_i$$

$$E[x_t] = x_0 \quad \text{(không đổi)}$$
$$\text{Var}(x_t) = t\sigma^2 \quad \text{(phụ thuộc vào t!)}$$

→ **Không dừng** vì phương sai tăng theo thời gian

**d) $x_t = \mu + \varepsilon_t$ (white noise)**

$$E[x_t] = \mu \quad \text{(không đổi)}$$
$$\text{Var}(x_t) = \sigma^2 \quad \text{(không đổi)}$$
$$\gamma_k = 0 \text{ cho } k \neq 0 \quad \text{(chỉ phụ thuộc vào k)}$$

→ **Dừng**

---

### Bài 5:

**a) White noise $\varepsilon_t$:**

$$E[\varepsilon_t] = 0, \quad \text{Var}(\varepsilon_t) = \sigma^2$$

$$\gamma_0 = \text{Cov}(\varepsilon_t, \varepsilon_t) = \text{Var}(\varepsilon_t) = \sigma^2$$

$$\gamma_k = \text{Cov}(\varepsilon_t, \varepsilon_{t-k}) = 0 \text{ cho } k \neq 0$$

$$\rho_k = \frac{\gamma_k}{\gamma_0} = \begin{cases} 1 & k = 0 \\ 0 & k \neq 0 \end{cases}$$

**b) $x_t = \varepsilon_t - 0.5 \varepsilon_{t-1}$:**

Tính $\gamma_0$:
$$\gamma_0 = \text{Var}(\varepsilon_t - 0.5\varepsilon_{t-1}) = \sigma^2 + 0.25\sigma^2 = 1.25\sigma^2$$

Tính $\gamma_1$:
$$\gamma_1 = \text{Cov}(\varepsilon_t - 0.5\varepsilon_{t-1}, \varepsilon_{t-1} - 0.5\varepsilon_{t-2})$$
$$= E[(\varepsilon_t - 0.5\varepsilon_{t-1})(\varepsilon_{t-1} - 0.5\varepsilon_{t-2})]$$
$$= E[\varepsilon_t\varepsilon_{t-1}] - 0.5E[\varepsilon_t\varepsilon_{t-2}] - 0.5E[\varepsilon_{t-1}^2] + 0.25E[\varepsilon_{t-1}\varepsilon_{t-2}]$$
$$= 0 - 0 - 0.5\sigma^2 + 0 = -0.5\sigma^2$$

Tính $\gamma_2$:
$$\gamma_2 = \text{Cov}(\varepsilon_t - 0.5\varepsilon_{t-1}, \varepsilon_{t-2} - 0.5\varepsilon_{t-3})$$
$$= E[\varepsilon_t\varepsilon_{t-2}] - 0.5E[\varepsilon_t\varepsilon_{t-3}] - 0.5E[\varepsilon_{t-1}\varepsilon_{t-2}] + 0.25E[\varepsilon_{t-1}\varepsilon_{t-3}]$$
$$= 0 - 0 - 0 - 0 = 0$$

$$\rho_1 = \frac{-0.5\sigma^2}{1.25\sigma^2} = -0.4$$
$$\rho_2 = 0$$

---

### Bài 6:

Chuỗi: $x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]$
Window size = 4, Step = 2

**Các cửa sổ:**
- Cửa sổ 1 (t=1-4): [1, 2, 3, 4]
- Cửa sổ 2 (t=3-6): [3, 4, 5, 6]
- Cửa sổ 3 (t=5-8): [5, 6, 7, 8]
- Cửa sổ 4 (t=7-10): [7, 8, 9, 10]

---

### Bài 7:

**Trung bình của mỗi cửa sổ:**
- Window 1: $(1+2+3+4)/4 = 2.5$
- Window 2: $(3+4+5+6)/4 = 4.5$
- Window 3: $(5+6+7+8)/4 = 6.5$
- Window 4: $(7+8+9+10)/4 = 8.5$

**Nhận xét:**
- Trung bình tăng đều: 2.5 → 4.5 → 6.5 → 8.5 (mỗi cửa sổ tăng 2)
- Điều này phản ánh trend tăng tuyến tính của chuỗi gốc
- Có thể dùng để làm mịn dữ liệu hoặc phát hiện xu hướng

---

### Bài 8:

**Ý nghĩa của PSD:**

PSD (Power Spectral Density) cho biết **năng lượng của tín hiệu phân bố theo tần số** như thế nào.

$$S(\omega_k) = \frac{1}{T}|X(\omega_k)|^2$$

**PSD với đỉnh cao và hẹp có nghĩa là:**

1. **Tín hiệu có chu kỳ rõ ràng**: Tồn tại một hoặc vài tần số chiếm ưu thế năng lượng
2. **Tín hiệu ít nhiễu**: Năng lượng tập trung vào các thành phần có chu kỳ, không phân tán
3. **Dễ dự báo**: Có thể khai thác chu kỳ để dự báo ngắn hạn

**Ví dụ thực tế:**
- ECG (điện tâm đồ): PSD có đỉnh ở ~1Hz (nhịp tim)
- Tín hiệu điện: PSD có đỉnh ở 50Hz/60Hz (tần số lưới điện)
- Dữ liệu bán hàng theo tháng: PSD có đỉnh ở tần số 1/12 (chu kỳ năm)

---

# PHẦN 4: MÔ HÌNH THỐNG KÊ

## 4.1 Lý thuyết

### 4.1.1 Quá trình Ngẫu nhiên Tuyến tính

**Định lý Wold (1938):** Mọi quá trình dừng đều có thể biểu diễn dưới dạng:
$$y_t = \mu + \sum_{j=0}^{\infty}\psi_j \varepsilon_{t-j}$$

Trong đó $\{\varepsilon_t\}$ là quá trình nhiễu trắng với $E[\varepsilon_t] = 0$ và $\text{Var}(\varepsilon_t) = \sigma^2$.

**Điều kiện dừng:**
$$\sum_{j=0}^{\infty}|\psi_j| < \infty \quad \text{hoặc} \quad \sum_{j=0}^{\infty}\psi_j^2 < \infty$$

### 4.1.2 Mô hình tự hồi qui (Autoregression - AR)

#### Định nghĩa
Giá trị hiện tại $Y_t$ được mô tả như một hàm tuyến tính của các giá trị quá khứ:

$$Y_t = c + \phi_1 Y_{t-1} + \phi_2 Y_{t-2} + \cdots + \phi_p Y_{t-p} + \varepsilon_t$$

**Ký hiệu:** AR(p) với p là bậc (số lag).

#### Mô hình AR(1)
$$Y_t = c + \phi_1 Y_{t-1} + \varepsilon_t$$

**Điều kiện dừng:** $|\phi_1| < 1$

**Ý nghĩa:**
- $\phi_1 > 0$: có xu hướng cùng chiều với quá khứ
- $\phi_1 < 0$: có xu hướng ngược chiều (zig-zag)
- $|\phi_1| \to 1$: không dừng (unit root)

**Trung bình:**
$$E[Y_t] = \frac{c}{1 - \phi_1}$$

**Phương sai:**
$$\text{Var}(Y_t) = \frac{\sigma^2}{1 - \phi_1^2}$$

**Hàm tự tương quan (ACF):**
$$\rho_k = \phi_1^k \quad \text{(cho } |\phi_1| < 1\text{)}$$

#### Mô hình AR(2)
$$Y_t = c + \phi_1 Y_{t-1} + \phi_2 Y_{t-2} + \varepsilon_t$$

**Điều kiện dừng:**
$$| \text{những nghiệm của } 1 - \phi_1 B - \phi_2 B^2 = 0 | > 1$$

Tương đương với:
- $\phi_1 + \phi_2 < 1$
- $\phi_2 - \phi_1 < 1$
- $|\phi_2| < 1$

### 4.1.3 Mô hình trung bình động (Moving Average - MA)

#### Định nghĩa
Giá trị hiện tại phụ thuộc vào nhiễu hiện tại và các nhiễu quá khứ:

$$Y_t = \mu + \varepsilon_t + \theta_1 \varepsilon_{t-1} + \cdots + \theta_q \varepsilon_{t-q}$$

**Ký hiệu:** MA(q) với q là bậc.

#### Mô hình MA(1)
$$Y_t = \mu + \varepsilon_t - \theta_1 \varepsilon_{t-1}$$

**Tính chất quan trọng:** MA(q) luôn dừng bất kể giá trị tham số!

**Hàm tự hiệp phương sai:**
$$\gamma_0 = \sigma^2(1 + \theta_1^2)$$
$$\gamma_1 = -\theta_1 \sigma^2$$
$$\gamma_k = 0 \text{ cho } k > 1$$

**Hàm tự tương quan:**
$$\rho_1 = \frac{-\theta_1}{1 + \theta_1^2}$$
$$\rho_k = 0 \text{ cho } k > 1$$

### 4.1.4 Mô hình ARMA

#### Định nghĩa
Kết hợp AR và MA:

$$Y_t = c + \phi_1 Y_{t-1} + \cdots + \phi_p Y_{t-p} + \varepsilon_t + \theta_1 \varepsilon_{t-1} + \cdots + \theta_q \varepsilon_{t-q}$$

**Ký hiệu:** ARMA(p, q)

#### Tính khả nghịch (Invertibility)

MA(q) có tính khả nghịch nếu các nghiệm của $\theta(B) = 0$ nằm ngoài vòng tròn đơn vị.

**Ý nghĩa:**
- MA(1) khả nghịch khi $|\theta_1| < 1$
- Khi khả nghịch, có thể biểu diễn MA dưới dạng AR vô hạn
- Đảm bảo tính duy nhất của mô hình

#### Tính dừng và khả nghịch

| Tính chất | Điều kiện |
|-----------|-----------|
| Stationarity | Nghiệm của $\phi(B) = 0$ nằm **ngoài** vòng tròn đơn vị |
| Invertibility | Nghiệm của $\theta(B) = 0$ nằm **ngoài** vòng tròn đơn vị |

### 4.1.5 Mô hình ARIMA

#### Định nghĩa
ARIMA = AR + MA + Integration (sai phân)

$$\phi(B)(1-B)^d Y_t = \theta(B)\varepsilon_t$$

**Ký hiệu:** ARIMA(p, d, q)
- p: bậc AR
- d: bậc sai phân
- q: bậc MA

**Ý nghĩa của sai phân:**
- $d = 0$: Chuỗi đã dừng, dùng ARMA
- $d = 1$: Lấy sai phân bậc 1 để làm dừng
- $d = 2$: Lấy sai phân bậc 2

### 4.1.6 Mô hình tự hồi qui véc tơ (VAR)

#### Định nghĩa
Mở rộng AR từ một chuỗi sang nhiều chuỗi:

$$\mathbf{Y}_t = \mathbf{c} + \mathbf{A}_1 \mathbf{Y}_{t-1} + \cdots + \mathbf{A}_p \mathbf{Y}_{t-p} + \boldsymbol{\varepsilon}_t$$

Trong đó:
- $\mathbf{Y}_t$: vector cột k biến
- $\mathbf{A}_i$: ma trận hệ số $k \times k$
- $\boldsymbol{\varepsilon}_t$: vector nhiễu trắng

**Ví dụ VAR(1) 2 biến:**
$$\begin{cases} x_t = c_1 + a_{11} x_{t-1} + a_{12} y_{t-1} + \varepsilon_{1,t} \\ y_t = c_2 + a_{21} x_{t-1} + a_{22} y_{t-1} + \varepsilon_{2,t} \end{cases}$$

### 4.1.7 Bộ lọc Kalman (Kalman Filter)

#### Định nghĩa
Bộ lọc Kalman = bộ ước tính Bayesian đệ quy cho mô hình tuyến tính Gaussian.

#### Mô hình không gian trạng thái

**Phương trình trạng thái (State equation):**
$$x_t = F x_{t-1} + B u_t + w_t, \quad w_t \sim N(0, Q)$$

**Phương trình quan sát (Measurement equation):**
$$y_t = H x_t + v_t, \quad v_t \sim N(0, R)$$

#### Thuật toán Kalman Filter

**Bước 1 - Dự đoán (Predict):**
$$\hat{x}_{t|t-1} = F \hat{x}_{t-1|t-1} + B u_t$$
$$P_{t|t-1} = F P_{t-1|t-1} F^T + Q$$

**Bước 2 - Cập nhật (Update):**
$$K_t = P_{t|t-1} H^T (H P_{t|t-1} H^T + R)^{-1}$$
$$\hat{x}_{t|t} = \hat{x}_{t|t-1} + K_t (y_t - H \hat{x}_{t|t-1})$$
$$P_{t|t} = (I - K_t H) P_{t|t-1}$$

### 4.1.8 Mô hình Markov ẩn (HMM)

#### Định nghĩa
HMM có:
- **Chuỗi trạng thái ẩn** $z_t$ (không quan sát được)
- **Chuỗi quan sát** $x_t$ (quan sát được)

#### Ba thành phần chính

1. **Ma trận chuyển trạng thái (Transition matrix):**
$$A_{ij} = P(z_{t+1} = j | z_t = i)$$

2. **Ma trận phát xạ (Emission matrix):**
$$B_{ik} = P(x_t = o_k | z_t = i)$$

3. **Phân phối khởi tạo:**
$$\pi_i = P(z_1 = i)$$

#### Ba bài toán kinh điển

1. **Evaluation:** Tính $P(x_1, \ldots, x_T | \theta)$ → Forward-Backward
2. **Decoding:** Tìm chuỗi trạng thái ẩn tối ưu → Viterbi
3. **Learning:** Ước lượng $A, B, \pi$ từ dữ liệu → Baum-Welch (EM)

### 4.1.9 Chuỗi thời gian cấu trúc Bayes (BSTS)

**Ý tưởng:** Xác suất của mô hình được cập nhật khi quan sát dữ liệu mới.

$$P(\theta | y_{1:T}) = \frac{P(y_{1:T} | \theta) P(\theta)}{P(y_{1:T})}$$

**Bốn bước:**
1. Xác định mô hình cấu trúc + prior
2. Áp dụng Kalman Filter để cập nhật trạng thái
3. Spike-and-slab cho lựa chọn biến
4. Bayesian model averaging để dự báo

---

## 4.2 Bài tập

### Bài tập về AR(1)

**Bài 1**: Xét mô hình AR(1): $Y_t = 2 + 0.7 Y_{t-1} + \varepsilon_t$

a) Tính trung bình $E[Y_t]$
b) Tính phương sai $\text{Var}(Y_t)$ (giả sử $\text{Var}(\varepsilon_t) = 4$)
c) Chuỗi có dừng không? Tại sao?
d) Tính $\rho_1, \rho_2, \rho_3$

**Bài 2**: Cho mô hình AR(1): $Y_t = 5 + \phi_1 Y_{t-1} + \varepsilon_t$

Tìm điều kiện của $\phi_1$ để chuỗi dừng. Nếu $\phi_1 = 0.8$ và $\sigma^2 = 9$, tính phương sai của $Y_t$.

**Bài 3**: Cho 3 chuỗi AR(1):
- Chuỗi A: $\phi_1 = 0.95$
- Chuỗi B: $\phi_1 = -0.5$
- Chuỗi C: $\phi_1 = 1.2$

Xác định chuỗi nào dừng, chuỗi nào không dừng.

### Bài tập về MA

**Bài 4**: Xét mô hình MA(1): $Y_t = \varepsilon_t - 0.5 \varepsilon_{t-1}$

a) Tính $\gamma_0, \gamma_1, \gamma_2$
b) Tính $\rho_1$
c) MA(1) có luôn dừng không? Tại sao?

**Bài 5**: Cho mô hình MA(1): $Y_t = 100 + \varepsilon_t + 0.8 \varepsilon_{t-1}$

a) Tính trung bình
b) Tính $\rho_1$ nếu $\sigma^2 = 25$

### Bài tập về ARMA

**Bài 6**: Xét mô hình ARMA(1,1): $Y_t = 0.5 Y_{t-1} + \varepsilon_t - 0.3 \varepsilon_{t-1}$

Kiểm tra tính dừng và khả nghịch.

**Bài 7**: Giải thích sự khác biệt giữa AR và MA. Khi nào nên dùng AR, khi nào nên dùng MA, khi nào nên dùng ARMA?

### Bài tập về ARIMA

**Bài 8**: Cho chuỗi $Y_t$ không dừng với $E[Y_t] = \alpha t + \beta$.

a) Đề xuất cách làm dừng chuỗi
b) Nếu dùng ARIMA, xác định giá trị d phù hợp
c) Giải thích ý nghĩa của việc lấy sai phân

### Bài tập về VAR

**Bài 9**: Cho mô hình VAR(1) 2 biến:

$$\begin{cases} x_t = 1 + 0.5 x_{t-1} + 0.2 y_{t-1} + \varepsilon_{1,t} \\ y_t = 2 + 0.3 x_{t-1} + 0.4 y_{t-1} + \varepsilon_{2,t} \end{cases}$$

Viết dưới dạng ma trận $\mathbf{Y}_t = \mathbf{c} + \mathbf{A}_1 \mathbf{Y}_{t-1} + \boldsymbol{\varepsilon}_t$.

### Bài tập về Kalman Filter

**Bài 10**: Giải thích thuật toán Kalman Filter bằng 2 bước (Predict và Update) với các phương trình cụ thể.

**Bài 11**: Cho mô hình state-space:
- $x_t = 0.8 x_{t-1} + w_t$
- $y_t = x_t + v_t$

Với $Q = 0.1, R = 0.5$, giải thích ý nghĩa của các tham số.

### Bài tập về HMM

**Bài 12**: Một HMM có 2 trạng thái ẩn (Nắng, Mưa) với:

$$A = \begin{pmatrix} 0.8 & 0.2 \\ 0.3 & 0.7 \end{pmatrix}, \quad B = \begin{pmatrix} 0.1 & 0.9 \\ 0.8 & 0.2 \end{pmatrix}, \quad \pi = \begin{pmatrix} 0.6 & 0.4 \end{pmatrix}$$

a) Nếu hôm nay trời nắng, xác suất ngày mai mưa là bao nhiêu?
b) Nếu hôm nay nắng, xác suất quan sát được mặt đất khô (dry) là bao nhiêu?
c) Giải thích ý nghĩa của ma trận A và ma trận B

**Bài 13**: Liệt kê và mô tả ngắn gọn 3 bài toán kinh điển của HMM.

### Bài tập về ước lượng tham số

**Bài 14**: Cho chuỗi $y_t$ với $n = 121$ mẫu, các hệ số tự tương quan mẫu $r_1 = 0.936$ và $r_2 = 0.802$.

Ước lượng tham số $\phi_1, \phi_2$ của mô hình AR(2) bằng phương pháp Yule-Walker.

---

## 4.3 Lời giải

### Bài 1:

Mô hình: $Y_t = 2 + 0.7 Y_{t-1} + \varepsilon_t$

**a) Trung bình:**
$$E[Y_t] = 2 + 0.7 E[Y_{t-1}]$$
$$E[Y_t] = \frac{2}{1 - 0.7} = \frac{2}{0.3} \approx 6.67$$

**b) Phương sai:**
$$\text{Var}(Y_t) = \frac{\sigma^2}{1 - \phi_1^2} = \frac{4}{1 - 0.49} = \frac{4}{0.51} \approx 7.84$$

**c) Tính dừng:**
$$|\phi_1| = |0.7| = 0.7 < 1 \Rightarrow \text{Dừng}$$

**d) ACF:**
$$\rho_k = \phi_1^k$$
- $\rho_1 = 0.7^1 = 0.7$
- $\rho_2 = 0.7^2 = 0.49$
- $\rho_3 = 0.7^3 = 0.343$

---

### Bài 2:

Mô hình: $Y_t = 5 + \phi_1 Y_{t-1} + \varepsilon_t$

**a) Điều kiện dừng:**
$$|\phi_1| < 1$$

**b) Nếu $\phi_1 = 0.8, \sigma^2 = 9$:**
$$\text{Var}(Y_t) = \frac{9}{1 - 0.8^2} = \frac{9}{1 - 0.64} = \frac{9}{0.36} = 25$$

---

### Bài 3:

- **Chuỗi A**: $|\phi_1| = 0.95 < 1$ → **Dừng**
- **Chuỗi B**: $|\phi_1| = 0.5 < 1$ → **Dừng**
- **Chuỗi C**: $|\phi_1| = 1.2 > 1$ → **Không dừng**

---

### Bài 4:

Mô hình: $Y_t = \varepsilon_t - 0.5 \varepsilon_{t-1}$, $\theta_1 = -0.5$

**a) Autocovariance:**

$$\gamma_0 = \text{Var}(\varepsilon_t - 0.5\varepsilon_{t-1}) = \sigma^2 + 0.25\sigma^2 = 1.25\sigma^2$$

$$\gamma_1 = \text{Cov}(\varepsilon_t - 0.5\varepsilon_{t-1}, \varepsilon_{t-1} - 0.5\varepsilon_{t-2})$$
$$= -\theta_1 \sigma^2 = -(-0.5)\sigma^2 = 0.5\sigma^2$$

$$\gamma_2 = 0 \quad \text{(cho } k > 1\text{)}$$

**b) ACF:**
$$\rho_1 = \frac{-\theta_1}{1 + \theta_1^2} = \frac{0.5}{1 + 0.25} = \frac{0.5}{1.25} = 0.4$$

**c) Tính dừng:**
**MA(q) luôn dừng** bất kể giá trị tham số vì nó là tổ hữu hạn của nhiễu trắng.

---

### Bài 5:

Mô hình: $Y_t = 100 + \varepsilon_t + 0.8 \varepsilon_{t-1}$

**a) Trung bình:**
$$E[Y_t] = 100 + E[\varepsilon_t] + 0.8 E[\varepsilon_{t-1}] = 100 + 0 + 0 = 100$$

**b) $\rho_1$:**
$$\rho_1 = \frac{-\theta_1}{1 + \theta_1^2} = \frac{-0.8}{1 + 0.64} = \frac{-0.8}{1.64} \approx -0.488$$

---

### Bài 6:

Mô hình: $Y_t = 0.5 Y_{t-1} + \varepsilon_t - 0.3 \varepsilon_{t-1}$

**Kiểm tra dừng:**
$$\phi_1 = 0.5, \quad |\phi_1| = 0.5 < 1 \Rightarrow \text{Dừng}$$

**Kiểm tra khả nghịch:**
$$\theta_1 = -0.3, \quad |\theta_1| = 0.3 < 1 \Rightarrow \text{Khả nghịch}$$

---

### Bài 7:

| Đặc điểm | AR | MA |
|----------|-----|-----|
| **Phụ thuộc** | Giá trị quá khứ của chuỗi | Nhiễu quá khứ |
| **ACF** | Giảm dần theo hàm mũ hoặc sóng | Cắt tại lag q |
| **PACF** | Cắt tại lag p | Giảm dần |
| **Phương sai** | Hữu hạn khi dừng | Luôn hữu hạn (luôn dừng) |

**Khi nào dùng:**
- **AR**: Khi chuỗi có autocorrelation mạnh với quá khứ gần
- **MA**: Khi chuỗi bị ảnh hưởng bởi các cú sốc (shocks) tạm thời
- **ARMA**: Khi cả hai yếu tố đều quan trọng

---

### Bài 8:

Chuỗi $Y_t$ không dừng với $E[Y_t] = \alpha t + \beta$ (có trend tuyến tính)

**a) Cách làm dừng:**
Lấy sai phân bậc 1:
$$\nabla Y_t = Y_t - Y_{t-1}$$
$$E[\nabla Y_t] = E[Y_t - Y_{t-1}] = \alpha(t - (t-1)) = \alpha \quad \text{(hằng số)}$$

Sau khi lấy sai phân, kỳ vọng đã không đổi → chuỗi mới có thể dừng.

**b) Giá trị d:**
$$d = 1$$

**c) Ý nghĩa của sai phân:**
Sai phân loại bỏ trend bằng cách tính sự thay đổi giữa các thời điểm liên tiếp. Nếu trend phức tạp hơn, có thể cần $d = 2$.

---

### Bài 9:

$$\begin{cases} x_t = 1 + 0.5 x_{t-1} + 0.2 y_{t-1} + \varepsilon_{1,t} \\ y_t = 2 + 0.3 x_{t-1} + 0.4 y_{t-1} + \varepsilon_{2,t} \end{cases}$$

**Dạng ma trận:**

$$\mathbf{Y}_t = \begin{pmatrix} x_t \\ y_t \end{pmatrix}, \quad \mathbf{c} = \begin{pmatrix} 1 \\ 2 \end{pmatrix}, \quad \mathbf{A}_1 = \begin{pmatrix} 0.5 & 0.2 \\ 0.3 & 0.4 \end{pmatrix}$$

$$\mathbf{Y}_t = \mathbf{c} + \mathbf{A}_1 \mathbf{Y}_{t-1} + \boldsymbol{\varepsilon}_t$$

---

### Bài 10:

**Thuật toán Kalman Filter:**

**Bước 1 — Dự đoán (Predict):**

Từ trạng thái quá khứ:
$$\hat{x}_{t|t-1} = F \hat{x}_{t-1|t-1} + B u_t$$

Dự đoán sai số ước lượng:
$$P_{t|t-1} = F P_{t-1|t-1} F^T + Q$$

**Bước 2 — Cập nhật (Update):**

Tính Kalman Gain:
$$K_t = P_{t|t-1} H^T (H P_{t|t-1} H^T + R)^{-1}$$

Cập nhật ước lượng trạng thái:
$$\hat{x}_{t|t} = \hat{x}_{t|t-1} + K_t (y_t - H \hat{x}_{t|t-1})$$

Cập nhật sai số ước lượng:
$$P_{t|t} = (I - K_t H) P_{t|t-1}$$

**Ý nghĩa:**
- $K_t$ lớn → Tin vào đo lường nhiều hơn
- $K_t$ nhỏ → Tin vào mô hình dự đoán nhiều hơn

---

### Bài 11:

Mô hình:
- $x_t = 0.8 x_{t-1} + w_t$ (State equation)
- $y_t = x_t + v_t$ (Measurement equation)

**Ý nghĩa các tham số:**

| Tham số | Giá trị | Ý nghĩa |
|---------|---------|---------|
| $F = 0.8$ | 0.8 | Hệ số chuyển trạng thái - trạng thái hiện tại phụ thuộc 80% vào trạng thái trước |
| $H = 1$ | 1 | Quan sát được trực tiếp trạng thái (không có biến đổi) |
| $Q = 0.1$ | 0.1 | Phương sai nhiễu hệ thống (process noise) - độ không chắc chắn của mô hình |
| $R = 0.5$ | 0.5 | Phương sai nhiễu đo lường (measurement noise) - độ không chính xác của phép đo |

**Nhận xét:** $R > Q$ nên Kalman Filter sẽ tin tưởng mô hình dự đoán hơn là đo lường thực tế.

---

### Bài 12:

$$A = \begin{pmatrix} 0.8 & 0.2 \\ 0.3 & 0.7 \end{pmatrix}, \quad B = \begin{pmatrix} 0.1 & 0.9 \\ 0.8 & 0.2 \end{pmatrix}, \quad \pi = \begin{pmatrix} 0.6 & 0.4 \end{pmatrix}$$

**a) Xác suất ngày mai mưa khi hôm nay nắng:**
$$P(z_{t+1} = \text{Mưa} | z_t = \text{Nắng}) = A_{12} = 0.2 = 20\%$$

**b) Xác suất quan sát dry khi trời nắng:**
$$P(x_t = \text{dry} | z_t = \text{Nắng}) = B_{12} = 0.9 = 90\%$$

**c) Ý nghĩa:**

**Ma trận A (Transition matrix):**
- Hàng i, cột j = xác suất chuyển từ trạng thái i sang trạng thái j
- $A_{11} = 0.8$: Nếu hôm nay nắng, 80% ngày mai vẫn nắng
- $A_{21} = 0.3$: Nếu hôm nay mưa, 30% ngày mai nắng

**Ma trận B (Emission matrix):**
- Hàng i, cột k = xác suất trạng thái i phát ra quan sát k
- $B_{11} = 0.1$: Khi trời nắng, chỉ 10% khả năng đất ướt
- $B_{21} = 0.8$: Khi trời mưa, 80% khả năng đất ướt

---

### Bài 13:

**Ba bài toán kinh điển của HMM:**

| Bài toán | Mục tiêu | Thuật toán |
|----------|----------|------------|
| **Evaluation** | Tính xác suất quan sát được chuỗi $P(x_1, \ldots, x_T \| \theta)$ | Forward-Backward |
| **Decoding** | Tìm chuỗi trạng thái ẩn tối ưu $\arg\max_z P(z_1, \ldots, z_T \| x_1, \ldots, x_T)$ | Viterbi Algorithm |
| **Learning** | Ước lượng tham số $A, B, \pi$ từ dữ liệu quan sát | Baum-Welch (EM algorithm) |

---

### Bài 14:

Cho $r_1 = 0.936, r_2 = 0.802$, ước lượng $\phi_1, \phi_2$ cho AR(2).

**Phương trình Yule-Walker:**
$$\begin{cases} \rho_1 = \phi_1 + \phi_2 \rho_1 \\ \rho_2 = \phi_1 \rho_1 + \phi_2 \end{cases}$$

Thay $\rho_1 = r_1 = 0.936$ và $\rho_2 = r_2 = 0.802$:
$$\begin{cases} 0.936 = \phi_1 + 0.936 \phi_2 \\ 0.802 = 0.936 \phi_1 + \phi_2 \end{cases}$$

**Giải hệ phương trình:**

Từ phương trình 1:
$$\phi_1 = 0.936 - 0.936\phi_2 = 0.936(1 - \phi_2)$$

Thế vào phương trình 2:
$$0.802 = 0.936 \times 0.936(1 - \phi_2) + \phi_2$$
$$0.802 = 0.876(1 - \phi_2) + \phi_2$$
$$0.802 = 0.876 - 0.876\phi_2 + \phi_2$$
$$0.802 = 0.876 + 0.124\phi_2$$
$$0.124\phi_2 = -0.074$$
$$\phi_2 = \frac{-0.074}{0.124} \approx -0.597$$

Thế ngược:
$$\phi_1 = 0.936 - 0.936 \times (-0.597) = 0.936 + 0.559 = 1.495$$

**Kết quả:**
$$\hat{\phi}_1 \approx 1.495, \quad \hat{\phi}_2 \approx -0.597$$

**Kiểm tra điều kiện dừng:**
- $\phi_1 + \phi_2 = 1.495 - 0.597 = 0.898 < 1$ ✓
- $\phi_2 - \phi_1 = -0.597 - 1.495 = -2.092 < 1$ ✓
- $|\phi_2| = 0.597 < 1$ ✓

→ Mô hình AR(2) với các tham số ước lượng này thỏa mãn điều kiện dừng.

---

## TỔNG KẾT CÔNG THỨC QUAN TRỌNG

### Chương 1: Giới thiệu
- Định nghĩa chuỗi thời gian: quan sát theo thứ tự thời gian
- 3 đặc điểm: thứ tự quan trọng, autocorrelation, non-iid

### Chương 2: Xử lý dữ liệu
- Forward Fill: $x_t = x_{t-1}$
- SMA: $\tilde{x}_t = \frac{1}{k}\sum_{i=1}^{k}x_{t-i}$
- Linear Interpolation: $\tilde{x}_t = x_{t_1} + \frac{t-t_1}{t_2-t_1}(x_{t_2}-x_{t_1})$

### Chương 3: Đặc trưng
- Mean: $\bar{x} = \frac{1}{n}\sum x_t$
- Variance: $\sigma^2 = \frac{1}{n}\sum(x_t - \bar{x})^2$
- Skewness: $\frac{E[(X-\mu)^3]}{\sigma^3}$
- ACF: $\rho_k = \frac{\gamma_k}{\gamma_0}$
- Stationarity: $E[Y_t]$ và $\text{Var}(Y_t)$ không đổi, ACF chỉ phụ thuộc lag

### Chương 4: Mô hình
- **AR(1)**: $Y_t = c + \phi_1 Y_{t-1} + \varepsilon_t$, dừng khi $|\phi_1| < 1$
- **MA(1)**: $Y_t = \mu + \varepsilon_t - \theta_1\varepsilon_{t-1}$, luôn dừng
- **ARMA(p,q)**: Kết hợp AR và MA
- **ARIMA(p,d,q)**: ARMA + sai phân bậc d
- **VAR(p)**: Mở rộng AR cho nhiều biến
- **Kalman Filter**: Predict + Update
- **HMM**: Forward-Backward, Viterbi, Baum-Welch

---

## MẸO ÔN TẬP

1. **Nhớ công thức AR(1)**: Trung bình $= c/(1-\phi_1)$, Phương sai $= \sigma^2/(1-\phi_1^2)$, ACF $= \phi_1^k$

2. **Phân biệt AR và MA**: AR dùng giá trị quá khứ, MA dùng nhiễu quá khứ

3. **Điều kiện dừng**: AR cần $|\phi_1| < 1$, MA luôn dừng

4. **Khi nào dùng ARIMA**: Khi chuỗi không dừng, cần lấy sai phân trước

5. **HMM 3 bài toán**: Evaluation (Forward-Backward), Decoding (Viterbi), Learning (Baum-Welch)

---

*File ôn tập được tạo dựa trên nội dung 4 slides của môn học*