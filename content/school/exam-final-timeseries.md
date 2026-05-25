---
title: Đề thi cuối kỳ – Phân tích dữ liệu chuỗi thời gian
---

**Thời gian:** 90 phút  
**Tổng điểm:** 10  
**Thang điểm:** Câu 1: 1đ – Câu 2: 2đ – Câu 3: 3đ – Câu 4: 4đ  
**Ghi chú:** Sinh viên được sử dụng tài liệu

---

## Câu 1 (1 điểm) – Lý thuyết

Hãy nêu và giải thích **3 đặc điểm quan trọng** của dữ liệu chuỗi thời gian so với dữ liệu dạng bảng (tabular) thông thường. Cho một ví dụ minh họa cụ thể cho mỗi đặc điểm.

---

## Câu 2 (2 điểm) – Lý thuyết

a) Trình bày mô hình tự hồi quy AR(p). Nêu điều kiện dừng của mô hình AR(1) và AR(2).  
b) So sánh **mạng nơ-ron tích chập (CNN)** và **mạng nơ-ron hồi quy (RNN)** khi áp dụng vào phân tích dữ liệu chuỗi thời gian. Nêu ít nhất 2 điểm khác biệt về kiến trúc và cách thức hoạt động.

---

## Câu 3 (3 điểm) – Bài tập

Cho dữ liệu doanh thu theo tháng của một cửa hàng (đơn vị: triệu đồng):

| Tháng       | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
|-------------|---|---|---|---|---|---|---|---|---|----|
| Doanh thu   | 45 | 48 | ? | 52 | 48 | ? | 55 | 58 | ? | 60 |

**a)** Sử dụng phương pháp **trung bình động đơn giản (Simple Moving Average – SMA)** với kích thước cửa sổ \(k = 2\) để điền các giá trị bị thiếu (các ô có dấu ?). Công thức SMA: \(\widehat{Y}_t = \frac{Y_{t-1} + Y_{t-2}}{2}\).

**b)** Sau khi đã điền đầy đủ, hãy tính các đặc trưng thống kê: **giá trị trung bình (mean)**, **phương sai (variance)**, **giá trị nhỏ nhất (min)** và **giá trị lớn nhất (max)** của chuỗi.

**c)** Sử dụng kỹ thuật **cửa sổ trượt (sliding window)** với kích thước cửa sổ \(W = 3\) và bước trượt \(S = 1\) để tạo các cửa sổ dữ liệu từ chuỗi đã được điền. Hãy viết tất cả các cửa sổ thu được.

---

## Câu 4 (4 điểm) – Bài tập

**Cho mô hình AR(1):**  
\[
Y_t = 8 + 0.6\,Y_{t-1} + \varepsilon_t,
\quad \varepsilon_t \sim \mathcal{N}(0,\,4)
\]

**a)** Mô hình có thỏa mãn điều kiện dừng hay không? Giải thích. Tính kỳ vọng \(E[Y_t]\) và phương sai \(Var(Y_t)\) của chuỗi khi ở trạng thái dừng.

**b)** Giả sử \(Y_t = 50\). Hãy dự báo giá trị tại thời điểm \(t+1\) và \(t+2\).

**c)** Cho thêm mô hình **MA(1):**  
\[
Y_t = 30 + \varepsilon_t + 0.5\,\varepsilon_{t-1},
\quad \varepsilon_t \sim \mathcal{N}(0,\,16)
\]  
Tính \(E[Y_t]\), \(Var(Y_t)\) và các hệ số tự tương quan \(\rho_1\), \(\rho_k\) (với \(k \ge 2\)) của mô hình MA(1) này.

---

## Đáp án

---

### Câu 1 (1 điểm)

| Đặc điểm | Giải thích | Ví dụ |
|----------|-----------|-------|
| **Thứ tự thời gian quan trọng** | Dữ liệu không thể xáo trộn thứ tự mà không làm mất ý nghĩa | Nhiệt độ ngày 1/1 là 30°C, ngày 2/1 là 32°C; nếu đổi chỗ thì mất thông tin xu hướng tăng |
| **Phụ thuộc lẫn nhau (Autocorrelation)** | Giá trị hiện tại thường liên quan đến giá trị trước đó | Doanh thu tháng này thường liên quan đến doanh thu tháng trước (nếu quy mô kinh doanh ổn định) |
| **Không i.i.d.** | Các quan sát không độc lập và không đồng phân phối | Chuỗi GDP các năm không thể coi là các mẫu độc lập từ cùng một phân phối vì nền kinh tế luôn biến động |

---

### Câu 2 (2 điểm)

**a) Mô hình AR(p) và điều kiện dừng (1 điểm)**

Mô hình AR(p): \(Y_t = c + \phi_1 Y_{t-1} + \phi_2 Y_{t-2} + \dots + \phi_p Y_{t-p} + \varepsilon_t\).

Điều kiện dừng: nghiệm của phương trình đặc trưng
\[
\phi(B) = 1 - \phi_1 B - \phi_2 B^2 - \dots - \phi_p B^p = 0
\]
phải nằm **ngoài vòng tròn đơn vị** (\(|B| > 1\)).

- **AR(1):** \(|\phi_1| < 1\).
- **AR(2):** hệ thỏa mãn đồng thời:
  \[
  \begin{cases}
  \phi_1 + \phi_2 < 1,\\
  \phi_2 - \phi_1 < 1,\\
  |\phi_2| < 1.
  \end{cases}
  \]

**b) So sánh CNN và RNN (1 điểm)**

| Tiêu chí | CNN | RNN |
|----------|-----|-----|
| **Xử lý thứ tự** | Kernel trượt độc lập trên toàn chuỗi, có thể song song hóa | Xử lý từng bước tuần tự, đầu ra bước trước làm đầu vào bước sau |
| **Bộ nhớ trạng thái** | Không có trạng thái ẩn giữa các bước | Duy trì trạng thái ẩn qua các bước thời gian |
| **Số tham số** | Ít hơn (chia sẻ trọng số kernel) | Nhiều hơn (ma trận trọng số cho mỗi cổng) |
| **Tốc độ huấn luyện** | Nhanh (song song hóa) | Chậm (tuần tự) |
| **Phụ thuộc xa** | Cần dilated convolution để mở rộng receptive field | LSTM/GRU có cổng giúp học phụ thuộc dài hạn |

---

### Câu 3 (3 điểm)

**a) Điền giá trị thiếu bằng SMA(k=2) (1 điểm)**

Áp dụng công thức \(\widehat{Y}_t = \frac{Y_{t-1} + Y_{t-2}}{2}\):

\[
\begin{aligned}
\widehat{Y}_3 &= \frac{Y_2 + Y_1}{2} = \frac{48 + 45}{2} = 46.5,\\[4pt]
\widehat{Y}_6 &= \frac{Y_5 + Y_4}{2} = \frac{48 + 52}{2} = 50,\\[4pt]
\widehat{Y}_9 &= \frac{Y_8 + Y_7}{2} = \frac{58 + 55}{2} = 56.5.
\end{aligned}
\]

Chuỗi sau khi điền: \([45,\; 48,\; 46.5,\; 52,\; 48,\; 50,\; 55,\; 58,\; 56.5,\; 60]\).

**b) Các đặc trưng thống kê (1 điểm)**

\[
\begin{aligned}
\bar{Y} &= \frac{45 + 48 + 46.5 + 52 + 48 + 50 + 55 + 58 + 56.5 + 60}{10}
         = \frac{519}{10} = 51.9. \\[4pt]
S^2 &= \frac{\sum_{i=1}^{10} (Y_i - \bar{Y})^2}{n-1} \\
    &= \frac{47.61 + 15.21 + 29.16 + 0.01 + 15.21 + 3.61 + 9.61 + 37.21 + 21.16 + 65.61}{9} \\
    &= \frac{244.40}{9} \approx 27.16. \\[4pt]
\min &= 45, \qquad \max = 60.
\end{aligned}
\]

**c) Cửa sổ trượt (W=3, S=1) (1 điểm)**

\[
\begin{aligned}
&\text{WS}_1: [45,\; 48,\; 46.5],\\
&\text{WS}_2: [48,\; 46.5,\; 52],\\
&\text{WS}_3: [46.5,\; 52,\; 48],\\
&\text{WS}_4: [52,\; 48,\; 50],\\
&\text{WS}_5: [48,\; 50,\; 55],\\
&\text{WS}_6: [50,\; 55,\; 58],\\
&\text{WS}_7: [55,\; 58,\; 56.5],\\
&\text{WS}_8: [58,\; 56.5,\; 60].
\end{aligned}
\]

---

### Câu 4 (4 điểm)

**a) Điều kiện dừng, kỳ vọng và phương sai AR(1) (1 điểm)**

\(|\phi_1| = 0.6 < 1\) → mô hình **dừng**.

\[
\begin{aligned}
E[Y_t] &= \mu = \frac{8}{1 - 0.6} = \frac{8}{0.4} = 20. \\[4pt]
Var(Y_t) &= \frac{\sigma_\varepsilon^2}{1 - \phi_1^2}
          = \frac{4}{1 - 0.36}
          = \frac{4}{0.64} = 6.25.
\end{aligned}
\]

**b) Dự báo (1 điểm)**

\[
\begin{aligned}
\widehat{Y}_{t+1} &= 8 + 0.6 \times 50 = 8 + 30 = 38, \\[4pt]
\widehat{Y}_{t+2} &= 8 + 0.6 \times 38 = 8 + 22.8 = 30.8.
\end{aligned}
\]

**c) Mô hình MA(1) (2 điểm)**

\[
Y_t = 30 + \varepsilon_t + 0.5\,\varepsilon_{t-1},\quad \varepsilon_t \sim \mathcal{N}(0, 16).
\]

\[
\begin{aligned}
E[Y_t] &= 30. \\[4pt]
Var(Y_t) &= \gamma_0 = \sigma_\varepsilon^2 (1 + \theta_1^2)
          = 16 \times (1 + 0.25) = 16 \times 1.25 = 20. \\[4pt]
\gamma_1 &= Cov(Y_t, Y_{t-1}) = \theta_1 \sigma_\varepsilon^2
          = 0.5 \times 16 = 8, \\
\gamma_k &= 0,\quad \forall k \ge 2.
\end{aligned}
\]

\[
\boxed{\rho_1 = \frac{\gamma_1}{\gamma_0} = \frac{8}{20} = 0.4},
\qquad
\boxed{\rho_k = 0,\; \forall k \ge 2}.
\]

---

## Hết

