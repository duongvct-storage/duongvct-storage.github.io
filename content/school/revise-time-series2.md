---
title: Y4T2-Time Series revise 2
keywords: [school, time-series, revise]
date: 2026-04-26
theme: time-series
description: Year 4 Term 2 - Time Series revise document
---

# TAI LIEU ON THI CUOI KY
# MON: PHAN TICH DU LIEU CHUOI THOI GIAN
# GIANG VIEN: DO TIEN DUNG

---

# PHAN 1: GIOI THIEU VA CAC KHAI NIEM CO BAN

## Chuong 1.1: Dinh nghia Chuoi Thoi Gian

### 1.1.1. Khai niem chuoi thoi gian la gi?

Chuỗi thời gian (Time Series) là tập hợp các quan sát (observations) của một hiện tượng được thu thập theo **trình tự thời gian**. Điều quan trọng nhất là **thứ tự thời gian** có ý nghĩa - nếu ta xáo trộn dữ liệu, ý nghĩa của nó sẽ mất đi.

**Ví dụ:**
- Nhiệt độ mỗi ngày trong 1 tháng: T1(1/1), T2(2/1), ..., T30(30/1)
- Giá cổ phiếu Apple từng ngày: AAPL(1/1), AAPL(2/1), ...
- Lượng điện tiêu thụ hàng giờ trong 1 ngày

### 1.1.2. Phan loai chuoi thoi gian

| Loại | Định nghĩa | Ví dụ | Đặc điểm |
|------|------------|-------|----------|
| **Liên tục (Continuous)** | Quan sát được ghi liên tục theo thời gian | Điện tâm đồ (ECG), cảm biến gia tốc, microphone | Có vô số điểm, đo với tần suất cao |
| **Rời rạc (Discrete)** | Quan sát tại các thời điểm cố định, cách đều nhau | Doanh số hàng tháng, nhiệt độ hàng ngày, chỉ số giá hàng quý | Có khoảng cách cố định (daily, monthly, quarterly) |

**Lưu ý quan trọng:** Trong môn học này, ta chủ yếu xét chuỗi **rời rạc** vì nó phổ biến trong phân tích dữ liệu kinh tế, tài chính.

### 1.1.3. Dac diem quan trong cua du lieu chuoi thoi gian

Khác với dữ liệu thông thường (i.i.d - independent and identically distributed), dữ liệu chuỗi thời gian có 3 đặc điểm cơ bản:

#### 1. Thứ tự thời gian quan trọng

- Dữ liệu không thể xáo trộn thứ tự
- Mỗi quan sát phụ thuộc vào các quan sát trước đó

#### 2. Autocorrelation (Tự tương quan)

- Giá trị hiện tại thường liên quan đến giá trị quá khứ
- Ví dụ: Giá cổ phiếu hôm nay phụ thuộc vào giá hôm qua

#### 3. Non-iid

- Không độc lập và đồng phân phối
- Phân phối có thể thay đổi theo thời gian

---

## Chuong 1.2: Bon Thanh Phan Cua Chuoi Thoi Gian

Mọi chuỗi thời gian đều có thể được phân tích thành 4 thành phần cơ bản:

```
Chuỗi thời gian = Trend + Seasonality + Cyclic + Irregular
```

### 1.2.1. Trend (Xu huong dai han)

**Định nghĩa:** Thay đổi chung dài hạn của chuỗi - có thể tăng hoặc giảm theo thời gian.

**Đặc điểm:**
- Thay đổi chậm, ít biến động
- Thường kéo dài nhiều năm
- Có thể tuyến tính hoặc phi tuyến

**Ví dụ:**
- Dân số thế giới tăng qua các năm
- Doanh thu Apple tăng đều đặn qua các năm
- Giá hàng hóa tăng theo lạm phát

### 1.2.2. Seasonality (Tinh mua vu)

**Định nghĩa:** Biến động theo chu kỳ cố định, thường trong vòng 1 năm.

**Đặc điểm:**
- Chu kỳ cố định và ngắn (trong năm)
- Các chu kỳ phổ biến: ngày, tuần, tháng, quý
- Lặp lại theo pattern có thể dự đoán

**Ví dụ:**
- Lượng điện tiêu thụ cao vào mùa hè (điều hòa)
- Doanh số bán lẻ tăng cao vào dịp Tết, Giáng sinh
- Nhiệt độ cao nhất vào tháng 6-7, thấp nhất vào tháng 12-1

### 1.2.3. Cyclic (Chu ky kinh te)

**Định nghĩa:** Biến động theo chu kỳ dài, không cố định, thường trên 1 năm.

**Đặc điểm:**
- Chu kỳ không cố định (có thể 5-10 năm)
- Thường liên quan đến chu k��� kinh tế
- Khó dự đoán hơn seasonality

**Ví dụ:**
- Chu kỳ kinh tế: khủng hoảng 2008, đại dịch 2020
- Chu kỳ bất động sản
- Chu kỳ ngành công nghiệp

### 1.2.4. Irregular (Thanh phan ngau nhien)

**Định nghĩa:** Dao động không dự đoán trước được, nhiễu ngẫu nhiên.

**Đặc điểm:**
- Không có pattern
- Thường là "noise" cần lọc
- Có thể chứa outliers

**Ví dụ:**
- Thiên tai bất ngờ
- Đại dịch COVID-19
- Sự cố nhà máy

---

### 💡 Cach phan biet Seasonality va Cyclic

| Tiêu chí | Seasonality | Cyclic |
|----------|-----------|-------|
| **Độ dài chu kỳ** | Cố định, ngắn (<1 năm) | Không cố định, dài (>1 năm) |
| **Dễ dự đoán** | Rất dễ | Khó |
| **Pattern** | Lặp lại đều đặn | Không đều đặn |
| **Ví dụ** | Doanh số tháng Tết | Chu kỳ kinh tế |

---

## Chuong 1.3: Tinh Dung (Stationarity)

### 1.3.1. Dinh nghia tinh dung

Tính dừng là một trong những khái niệm **QUAN TRỌNG NHẤT** trong phân tích chuỗi thời gian.

**Định nghĩa đơn giản:** Chuỗi dừng khi các đặc tính thống kê (trung bình, phương sai) **không thay đổi** theo thời gian.

### 1.3.2. Hai loai tinh dung

**Loại 1: Dừng nghiêm ngặt (Strict Stationarity)**

$$F(X_{t1}, ..., X_{tn}) = F(X_{t1+k}, ..., X_{tn+k})$$

- Phân phối xác suất tích lũy không đổi khi dịch thời gian
- Điều kiện rất khắt khe
- Khó kiểm tra trong thực tế

**Loại 2: Dừng yếu (Weak Stationarity / Wide-sense)**

Điều kiện:
1. **Trung bình không đổi:** $E[X_t] = \mu$ (hằng số)
2. **Phương sai không đổi:** $Var(X_t) = \sigma^2$ (hằng số)
3. **Hiệp phương sai chỉ phụ thuộc độ trễ:** $Cov(X_t, X_s) = \gamma_{|t-s|}$

**Quy ước:** Trong môn học, "dừng" = "dừng yếu".

### 1.3.3. Tai sao can tinh dung?

- Nhiều mô hình (AR, MA, ARMA) **yêu cầu** chuỗi dừng
- Nếu chuỗi không dừng → cần biến đổi (sai phân, log,...)
- Dự báo trên chuỗi không dừng không đáng tin cậy

### 1.3.4. Vi du ve tinh dung

**Chuỗi DỪNG:**
$$X_t = 10 + \epsilon_t, \epsilon_t \sim N(0,1)$$

- Trung bình = 10 (không đổi)
- Phương sai = 1 (không đổi)
- → DỪNG

**Chuỗi KHÔNG DỪNG:**
$$X_t = 10 + 0.5t + \epsilon_t$$

- Trung bình = 10 + 0.5t (tăng theo t!)
- → KHÔNG DỪNG

**Chuỗi KHÔNG DỪNG (Random Walk):**
$$X_t = X_{t-1} + \epsilon_t$$

- Phương sai = t × σ² (tăng theo t!)
- → KHÔNG DỪNG

---

## Chuong 1.4: Cac Bai Toan Co Ban

### 1.4.1. Mo ta (Description)

**Mục tiêu:** Hiểu rõ dữ liệu, xác định các thành phần.

**Phương pháp:**
- Vẽ biểu đồ line plot
- Tính các đặc trưng thống kê
- Phân tích ACF/PACF

### 1.4.2. Giai thich (Explanation)

**Mục tiêu:** Giải thích thay đổi bằng các biến liên quan.

**Ví dụ:**
- Doanh số tăng do chi tiêu quảng cáo
- Nhiệt độ tăng do biến đổi khí hậu

### 1.4.3. Du bao (Forecasting)

**Mục tiêu:** Dự đoán giá trị tương lai dựa trên dữ liệu quá khứ.

**Phương pháp:**
- ARIMA
- Exponential Smoothing
- Machine Learning (XGBoost, LSTM)

### 1.4.4. Kiem soat (Control)

**Mục tiêu:** Phát hiện bất thường, giữ hệ thống ổn định.

**Ví dụ:**
- Phát hiện sản phẩm lỗi trên dây chuyền
- Cảnh báo fraud trong ngân hàng

---

# PHAN 2: KY THUAT XU LY DU LIEU

## Chuong 2.1: Nhan Thoi Gian (Timestamp)

### 2.1.1. Cac dang timestamp

Timestamp là giá trị biểu diễn thời điểm xảy ra quan sát.

| Dạng | Ví dụ | Ứng dụng |
|------|-------|----------|
| Thời gian thực | 2025-07-22 09:15:23 | Dữ liệu sensor |
| Khoảng thời gian | Tháng 1/2025, Tuần 23 | Báo cáo |
| Index-based | Quan sát 1, 2, 3 | Dữ liệu tổng hợp |

### 2.1.2. Chuan hoa timestamp

**Bước 1: Chọn định dạng chuẩn**

- Nên dùng: YYYY-MM-DD HH:MM:SS (ISO 8601)
- Tránh: MM/DD/YYYY (AMbiguous)

**Bước 2: Chuẩn hóa múi giờ (timezone)**

- Tất cả phải cùng múi giờ
- UTC hoặc local time

**Bước 3: Chuẩn hóa tần suất (frequency)**

- Đảm bảo khoảng cách đều nhau
- Daily, Monthly, Quarterly

---

## Chuong 2.2: Xu Ly Du Lieu Thieu (Missing Data)

Dữ liệu thiếu là vấn đề rất phổ biến trong chuỗi thời gian.

### 2.2.1. Phuong phap 1: Forward Fill (Dien tiep)

**Nguyên tắc:** Thay giá trị thiếu bằng giá trị gần nhất **phía trước**.

**Công thức:**
$$X_t = X_{t-1}$$

**Ví dụ:**
```
Chuỗi gốc:     [10, NaN, NaN, 15]
Forward Fill:    [10, 10,   10, 15]
```

**Đặc điểm:**
- Phù hợp: Dữ liệu step function (tài khoản, trạng thái)
- Không phù hợp: Chuỗi có trend mạnh, missing ở đầu, missing dài

### 2.2.2. Phuong phap 2: Moving Average (Trung binh dong)

**Nguyên tắc:** Lấy trung bình của k điểm gần nhất.

**Công thức (SMA - Simple Moving Average):**
$$\hat{X}_t = \frac{1}{k}(X_{t-1} + X_{t-2} + ... + X_{t-k})$$

**Ví dụ:** k = 2
```
Chuỗi gốc:     [10, 12, NaN, 13, 14]
SMA(k=2):      [10, 12,   11, 13, 14]
```
(Kết quả: x̂₃ = (12+10)/2 = 11)

**Trung bình động hai phía (CMA):**
$$\hat{X}_t = \frac{1}{2k+1} \sum_{j=-k}^{k} X_{t+j}$$

### 2.2.3. Phuong phap 3: Interpolation (Noi suy)

**Nguyên tắc:** Ước lượng bằng đoạn thẳng nối 2 điểm biên.

**Công thức (Nội suy tuyến tính):**
$$\hat{X}_t = X_1 + \frac{t - t_1}{t_2 - t_1} \times (X_2 - X_1)$$

**Ví dụ:**
- Cho: (t₁=1, x₁=10), (t₂=4, x₂=16)
- Tìm: t = 2, 3
- $\hat{X}_2 = 10 + \frac{2-1}{4-1} \times 6 = 10 + 2 = 12$
- $\hat{X}_3 = 10 + \frac{3-1}{4-1} \times 6 = 10 + 4 = 14$

**Nội suy bậc cao (Spline):**
- Dùng đa thức bậc 3
- Giữ độ cong mượt hơn

---

## Chuong 2.3: Thay Doi Tan Suat (Resampling)

### 2.3.1. Downsampling (Giam tan suat)

**Nguyên tắc:** Từ tần suất cao → tần suất thấp (ít dữ liệu hơn).

**Ví dụ:** Daily → Monthly
```
Daily:  [10, 12, 11, 13, 15, 14, 16, 18, 17, 20, 19, 21]
Monthly (mean):  [(10+12+11+...+21)/12] = 14.33
```

**Các hàm tổng hợp:**
| Hàm | Ý nghĩa | Ví dụ |
|-----|----------|-------|
| Mean | Trung bình | Doanh số trung bình |
| Sum | Tổng | Tổng doanh thu |
| Min/Max | Giá trị nhỏ/lớn nhất | Nhiệt độ cao/thấp |
| Median | Trung vị | Giá trị giữa |

### 2.3.2. Upsampling (Tang tan suat)

**Nguyên tắc:** Từ tần suất thấp → tần suất cao (nhiều dữ liệu hơn).

**Ví dụ:** Monthly → Daily
```
Monthly: [10, 15, 12]
Daily:  [10, NaN, NaN, ..., NaN, 15, NaN, ..., NaN, 12]
```

**Xử lý NaN sau upsamplng:**
- Forward fill
- Backward fill
- Interpolation

---

## Chuong 2.4: Khu Nhieu & Lam Min (Smoothing)

### 2.4.1. Simple Moving Average (SMA)

$$\hat{X}_t = \frac{1}{k} \sum_{i=0}^{k-1} X_{t-i}$$

**Ví dụ:** k = 3
```
Gốc:  [10, 12, 8, 14, 16]
SMA:  [10, 11, 10, 11.3, 12.67]
```

**Đặc điểm:**
- Đơn giản
- Làm mất chi tiết
- Có thể trễ pha (lag)

### 2.4.2. Weighted Moving Average (WMA)

$$\hat{X}_t = \sum_{i=0}^{k-1} w_i X_{t-i}$$
với $\sum w_i = 1$

**Ví dụ:** w = [0.5, 0.3, 0.2]
```
Gốc:  [10, 12, 8]
WMA:  [10, 11, 9.8]
```

**Nguyên tắc:** Ưu tiên điểm gần hơn (w lớn hơn cho i nhỏ)

### 2.4.3. Exponential Moving Average (EMA)

$$\hat{X}_t = \alpha X_t + (1-\alpha) \hat{X}_{t-1}$$

**Ví dụ:** α = 0.5, x̂₀ = 10
```
X:    [10, 12, 14]
x̂₁ = 0.5×10 + 0.5×10 = 10
x̂₂ = 0.5×12 + 0.5×10 = 11
x̂₃ = 0.5×14 + 0.5×11 = 12.5
```

**Ý nghĩa α:**
- α lớn (→1): Bám sát dữ liệu gốc
- α nhỏ (→0): Mượt hơn, ít biến động

---

## Chuong 2.5: Khu Tinh Mua Vu (Deseasonalize)

### 2.5.1. Mo hinh cong

$$X_t = Trend_t + Seasonal(t) + Irregular_t$$

**Khử mùa:**
$$X_{des} = X_t - Seasonal(t)$$

### 2.5.2. Mo hinh nhan

$$X_t = Trend_t \times Seasonal(t) \times Irregular_t$$

**Khử mùa:**
$$X_{des} = \frac{X_t}{Seasonal(t)}$$

---

## Chuong 2.6: Look-Ahead Bias

### 2.6.1. Dinh nghia

**Look-ahead bias** là thiên lệch khi sử dụng dữ liệu từ tương lai để dự đoán quá khứ/hiện tại.

**Đây là Data Leakage! Nguy hiểm!**

### 2.6.2. Cach tranh

- **Chỉ dùng dữ liệu quá khứ** để dự đoán tương lai
- **Train/Test split theo thời gian** (KHÔNG shuffle)
- **Tính rolling features** chỉ trên quá khứ

---

# PHAN 3: TRICH CHON DAC TRUNG

## Chuong 3.1: Phan Doan & Cua So Truot

### 3.1.1. Segmentation (Phan doan)

Chia chuỗi dài thành các đoạn đồng nhất về xu hướng, phương sai.

### 3.1.2. Sliding Window (Cua so truot)

**Ví dụ:** Window size W = 3, Step S = 1
```
Chuỗi: [1, 2, 3, 4, 5, 6]
Windows: [1,2,3], [2,3,4], [3,4,5], [4,5,6]
```

**Ứng dụng:**
- Tạo features cho ML
- Tính rolling statistics

---

## Chuong 3.2: Cac Dac Trung Thong Ke

### 3.2.1. Mean (Trung binh)

$$\mu = \frac{1}{n} \sum_{i=1}^{n} X_i$$

### 3.2.2. Variance (Phuong sai)

$$\sigma^2 = \frac{1}{n} \sum_{i=1}^{n} (X_i - \mu)^2$$

### 3.2.3. Standard Deviation

$$\sigma = \sqrt{\sigma^2}$$

### 3.2.4. Range

$$Range = max - min$$

### 3.2.5. Skewness (Do lech)

$$Skewness = \frac{E[(X - \mu)^3]}{\sigma^3}$$

**Ý nghĩa:**
- Skewness = 0: Phân phối đối xứng
- Skewness > 0: Lệch phải (đuôi dài bên phải)
- Skewness < 0: Lệch trái (đuôi dài bên trái)

---

## Chuong 3.3: Ham Tu Tuong Quan (ACF)

### 3.3.1. Autocovariance

$$\gamma(k) = Cov(X_t, X_{t-k}) = E[(X_t - \mu)(X_{t-k} - \mu)]$$

### 3.3.2. Autocorrelation (ACF)

$$\rho(k) = \frac{\gamma(k)}{\gamma(0)}$$

**Tính chất:**
- $\rho(0) = 1$
- $\rho(k) = \rho(-k)$ (đối xứng)
- $\rho(k) \in [-1, 1]$

### 3.3.3. Cach tinh ACF mau

$$r_k = \frac{\sum_{t=k+1}^{T}(X_t - \bar{X})(X_{t-k} - \bar{X})}{\sum_{t=1}^{T}(X_t - \bar{X})^2}$$

### 3.3.4. Ung dung nhan dang mo hinh

| ACF | Ý nghĩa |
|-----|----------|
| Giảm từ từ | Có **trend** hoặc **chu kỳ** dài |
| Giảm nhanh | Chuỗi **gần như dừng** |
| Cắt ngang sau q | **MA(q)** |
| Giảm chậm | Cần **sai phân** (không dừng) |

---

## Chuong 3.4: Ham Tu Tuong Quan Tung Phan (PACF)

### 3.4.1. Dinh nghia

PACF đo tương quan giữa $X_t$ và $X_{t-k}$ **sau khi loại bỏ** ảnh hưởng của các biến trung gian $X_{t-1}, ..., X_{t-k+1}$.

**Ý nghĩa:** Cho biết $X_t$ phụ thuộc **trực tiếp** vào $X_{t-k}$ bao nhiêu, không qua các giá trị ở giữa.

### 3.4.2. Cach nhan dang

| PACF | Ý nghĩa |
|------|---------|
| Cắt ngang sau p | **AR(p)** |
| Giảm dần | **MA(q)** hoặc ARMA |

### 💡 Quy tac nho ACF/PACF

| Mô hình | ACF | PACF |
|---------|-----|------|
| AR(p) | Giảm dần (mũ/sin) | Cắt sau p |
| MA(q) | Cắt sau q | Giảm dần |
| ARMA | Giảm dần | Giảm dần |

---

## Chuong 3.5: Toan Tu Chuoi Thoi Gian

### 3.5.1. Backshift Operator (B)

$$B X_t = X_{t-1}$$

**Ví dụ:**
$$B^2 X_t = X_{t-2}$$

### 3.5.2. Difference Operator (Δ)

$$\Delta X_t = X_t - X_{t-1} = (1-B)X_t$$

**Ví dụ:**
$$\Delta^2 X_t = X_t - 2X_{t-1} + X_{t-2}$$

---

## Chuong 3.6: Bien Doi Cho Chuoi Khong Dung

### 3.6.1. Sai phan (Differencing)

**Dùng khi:** Chuỗi có trend, không dừng ở trung bình

$$\Delta X_t = X_t - X_{t-1}$$
$$\Delta^2 X_t = \Delta(\Delta X_t)$$

**Ví dụ:**
```
X:     [10, 15, 20, 25]
ΔX:    [5, 5, 5]  → Dừng!
```

### 3.6.2. Logarithm

**Dùng khi:** Phương sai thay đổi theo mức

$$log(X_t)$$

### 3.6.3. Square Root

**Dùng khi:** Phương sai tăng theo căn

$$\sqrt{X_t}$$

### 3.6.4. Box-Cox Transformation

$$g(X_t) = \frac{X_t^\lambda - 1}{\lambda}, \lambda \neq 0$$
$$g(X_t) = log(X_t), \lambda = 0$$

---

## Chuong 3.7: Dac Trung Mien Tan So

### 3.7.1. Discrete Fourier Transform (DFT)

$$X(\omega_k) = \sum_{t=0}^{T-1} X_t e^{-i\omega_k t}$$
$$\omega_k = \frac{2\pi k}{T}$$

### 3.7.2. Power Spectral Density (PSD)

$$S(\omega_k) = \frac{1}{T} |X(\omega_k)|^2$$

### 3.7.3. Spectral Entropy

$$H = -\sum_{k} p_k log(p_k)$$

**Ý nghĩa:**
- Entropy thấp: Có tần số trội → có chu kỳ rõ
- Entropy cao: Nhiễu, không có pattern

### 3.7.4. Dominant Frequency

Tần số có năng lượng lớn nhất → chu kỳ mạnh nhất.

---

# PHAN 4: MO HINH THONG KE

## Chuong 4.1: Qua Trinh Ngau Nhien Tuyen Tinh

### 4.1.1. Dinh ly Wold (1938)

Mọi quá trình dừng đều có thể biểu diễn:
$$X_t = \mu + \sum_{j=0}^{\infty} \psi_j \epsilon_{t-j}$$

trong đó ${\epsilon_t}$ là nhiễu trắng.

### 4.1.2. White Noise (Nhieu trang)

**Định nghĩa:** Chuỗi ${\epsilon_t}$ thỏa mãn:

1. $E[\epsilon_t] = 0$
2. $Var(\epsilon_t) = \sigma^2$ (hằng số)
3. $Cov(\epsilon_t, \epsilon_s) = 0$ với $t \neq s$

**Ký hiệu:** $\epsilon_t \sim WN(0, \sigma^2)$

**ACF của white noise:**
$$\rho(k) = 1 \text{ nếu } k=0$$
$$\rho(k) = 0 \text{ nếu } k \neq 0$$

---

## Chuong 4.2: Mo Hinh Tu Hoi Quy AR(p)

### 4.2.1. AR(1) - Bac 1

**Công thức:**
$$X_t = c + \phi_1 X_{t-1} + \epsilon_t$$

**Điều kiện dừng:** $|\phi_1| < 1$

**Các tham số:**

| Tham số | Công thức |
|---------|----------|
| Trung bình | $\mu = \frac{c}{1 - \phi_1}$ |
| Phương sai | $\gamma_0 = \frac{\sigma^2}{1 - \phi_1^2}$ |
| ACF lag 1 | $\rho_1 = \phi_1$ |
| ACF lag k | $\rho_k = \phi_1^k$ |

### 4.2.2. AR(2) - Bac 2

**Công thức:**
$$X_t = c + \phi_1 X_{t-1} + \phi_2 X_{t-2} + \epsilon_t$$

**Điều kiện dừng (3 điều kiện ARROW):**
1. $\phi_1 + \phi_2 < 1$
2. $\phi_2 - \phi_1 < 1$
3. $|\phi_2| < 1$

**Hệ phương trình Yule-Walker:**

$$\rho_1 = \phi_1 + \phi_2 \rho_1$$
$$\rho_2 = \phi_1 \rho_1 + \phi_2$$

### 4.2.3. AR(p) tong quat

$$X_t = c + \phi_1 X_{t-1} + ... + \phi_p X_{t-p} + \epsilon_t$$

**Điều kiện dừng:** Tất cả nghiệm của $\phi(z) = 1 - \phi_1 z - ... - \phi_p z^p = 0$ phải nằm **ngoài** vòng tròn đơn vị.

### 4.2.4. Nhan dang AR(p)

- **ACF:** Giảm dần (theo hàm mũ hoặc sóng dao động)
- **PACF:** Cắt ngang **sau** lag p

---

## Chuong 4.3: Mo Hinh Trung Binh Dong MA(q)

### 4.3.1. MA(1) - Bac 1

**Công thức:**
$$X_t = \mu + \epsilon_t - \theta_1 \epsilon_{t-1}$$

**Tính chất:**
- Luôn **dừng** (stationary) với mọi θ₁
- ACF cắt ngang sau lag 1

**Các tham số:**

| Tham số | Công thức |
|---------|----------|
| Phương sai | $\gamma_0 = \sigma^2(1 + \theta_1^2)$ |
| ACF lag 1 | $\rho_1 = \frac{-\theta_1}{1 + \theta_1^2}$ |
| ACF lag k>1 | $\rho_k = 0$ |

**Điều kiện khả nghịch:** $|\theta_1| < 1$

### 4.3.2. MA(q) tong quat

$$X_t = \mu + \epsilon_t - theta_1 \epsilon_{t-1} - ... - theta_q \epsilon_{t-q}$$

**Điều kiện khả nghịch:** Tất cả nghiệm của $\theta(z) = 1 - \theta_1 z - ... - \theta_q z^q = 0$ phải nằm **ngoài** vòng tròn đơn vị.

### 4.3.3. Nhan dang MA(q)

- **ACF:** Cắt ngang **sau** lag q
- **PACF:** Giảm dần

---

## Chuong 4.4: Mo Hinh ARMA(p,q)

### 4.4.1. Cong thuc

$$X_t = c + \phi_1 X_{t-1} + ... + \phi_p X_{t-p} + \epsilon_t - \theta_1 \epsilon_{t-1} - ... - \theta_q \epsilon_{t-q}$$

Viết gọn:
$$\phi(B) X_t = c + \theta(B) \epsilon_t$$

### 4.4.2. Tinh chat

| Tính chất | AR(p) | MA(q) | ARMA(p,q) |
|-----------|-------|-------|----------|
| Stationarity | Cần điều kiện | Luôn có | Cần (từ AR) |
| Invertibility | Luôn có | Cần điều kiện | Cần (từ MA) |

### 4.4.3. Nhan dang ARMA

- **ACF:** Giảm dần
- **PACF:** Giảm dần

---

## Chuong 4.5: Mo Hinh ARIMA(p,d,q)

### 4.5.1. Y tuong

Chuỗi không dừng → Lấy sai phân d lần → Chuỗi dừng → Áp dụng ARMA

### 4.5.2. Cong thuc

$$\phi(B) (1-B)^d X_t = c + \theta(B) \epsilon_t$$

- **p:** Bậc AR
- **d:** Số lần sai phân
- **q:** Bậc MA

### 4.5.3. Vi du

**ARIMA(1,1,0):**

$$\Delta X_t = X_t - X_{t-1} = c + \phi_1 \Delta X_{t-1} + \epsilon_t$$

### 4.5.4. Cach xac dinh d

1. Vẽ ACF của chuỗi
2. Nếu ACF giảm **chậm** → d = 1
3. Nếu ACF vẫn gi��m ch���m → d = 2

---

## Chuong 4.6: Uoc Tinh Tham So

### 4.6.1. Method of Moments

**AR(1):** $\hat{\phi}_1 = r_1$

**AR(2):**
$$\hat{\phi}_1 = \frac{r_1(1-r_2)}{1-r_1^2}$$
$$\hat{\phi}_2 = \frac{r_2-r_1^2}{1-r_1^2}$$

**MA(1):** Giải phương trình $\rho_1 = \frac{-\theta_1}{1+\theta_1^2}$

### 4.6.2. Uoc tinh phuong sai nhieu

$$AR(1): \hat{\sigma}_\epsilon^2 = \hat{\gamma}_0(1 - \hat{\phi}_1^2)$$
$$MA(1): \hat{\sigma}_\epsilon^2 = \frac{\hat{\gamma}_0}{1 + \hat{\theta}_1^2}$$

---

## Chuong 4.7: Mo Hinh VAR

### 4.7.1. Y tuong

Mở rộng AR từ 1 chuỗi sang nhiều chuỗi tương tác.

### 4.7.2. VAR(1) voi 2 bien

$$\begin{pmatrix} X_t \\ Y_t \end{pmatrix} = \begin{pmatrix} c_1 \\ c_2 \end{pmatrix} + \begin{pmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{pmatrix} \begin{pmatrix} X_{t-1} \\ Y_{t-1} \end{pmatrix} + \begin{pmatrix} \epsilon_{1t} \\ \epsilon_{2t} \end{pmatrix}$$

### 4.7.3. Kiem tra tinh on dinh

Tất cả eigenvalues của ma trận A phải nằm **trong** vòng tròn đơn vị ($|\lambda| < 1$).

---

## Chuong 4.8: Mo Hinh State-Space

### 4.8.1. Khai niem

- **Trạng thái thực sự không đo được trực tiếp** - chỉ có thể suy ra từ quan sát.
- **Cho phép thay đổi hệ số theo thời gian**.

### 4.8.2. Hai phuong trinh

**Phương trình trạng thái:**
$$X_t = F X_{t-1} + B u_t + w_t$$
$$w_t \sim N(0, Q)$$

**Phương trình quan sát:**
$$Y_t = H X_t + v_t$$
$$v_t \sim N(0, R)$$

### 4.8.3. Cac tham so

| Tham số | Ý nghĩa |
|---------|----------|
| F | Ma trận chuyển trạng thái |
| Q | Phương sai nhiễu hệ thống |
| H | Ma trận quan sát |
| R | Phương sai nhiễu đo lường |

---

## Chuong 4.9: Bo Loc Kalman

### 4.9.1. Gioi thieu

**Kalman Filter = Bộ ước tính Bayesian đệ quy** cho mô hình tuyến tính Gaussian.

### 4.9.2. Thuat toan

**Bước 1 - Predict (Dự đoán):**
$$\hat{X}_{t|t-1} = F \hat{X}_{t-1|t-1} + B u_t$$
$$P_{t|t-1} = F P_{t-1|t-1} F^T + Q$$

**Bước 2 - Update (Cập nhật):**
$$K_t = P_{t|t-1} H^T (H P_{t|t-1} H^T + R)^{-1}$$
$$\hat{X}_{t|t} = \hat{X}_{t|t-1} + K_t (Y_t - H \hat{X}_{t|t-1})$$
$$P_{t|t} = (I - K_t H) P_{t|t-1}$$

### 4.9.3. Y nghia Kalman Gain (K)

| K | Ý nghĩa |
|---|----------|
| K lớn | Tin vào đo lường nhiều |
| K nhỏ | Tin vào mô hình nhiều |

### 4.9.4. Uu diem

- Dễ tính toán, không cần lưu toàn bộ quá khứ
- Xử lý missing data rất tốt
- Có thể dùng online (Filter) hoặc offline (Smoother)

### 4.9.5. Kalman Filter khai quat mo hinh khac

| Mô hình | State-space |
|---------|-------------|
| AR(1) | $X_t = \phi X_{t-1} + w_t, Y_t = X_t$ |
| Local Level | $X_t = X_{t-1} + w_t, Y_t = X_t + v_t$ |

---

## Chuong 4.10: Mo Hinh Markov An (HMM)

### 4.10.1. Gioi thieu

- **Trạng thái ẩn:** Không quan sát trực tiếp
- **Quá trình Markov:** Tương lai chỉ phụ thuộc hiện tại
- **Học không giám sát:** Không cần nhãn

### 4.10.2. Ba thanh phan

**a) Ma trận chuyển trạng thái (A):**
$$A_{ij} = P(z_{t+1} = j | z_t = i)$$

**b) Ma trận phát ra (B):**
$$B_{ik} = P(x_t = o_k | z_t = i)$$

**c) Phân phối khởi tạo (π):**
$$\pi_i = P(z_1 = i)$$

### 4.10.3. Ba bai toan kinh dien

| Bài toán | Câu hỏi | Thuật toán |
|----------|---------|------------|
| **Evaluation** | P(quan sát)? | Forward-Backward |
| **Decoding** | Chuỗi trạng thái? | Viterbi |
| **Learning** | Tìm A, B, π? | Baum-Welch |

### 4.10.4. Forward Algorithm

$$\alpha_t(i) = P(o_1, ..., o_t, z_t = i)$$

- Khởi tạo: $\alpha_1(i) = \pi_i B_i(o_1)$
- Đệ quy: $\alpha_t(i) = B_i(o_t) \sum_j \alpha_{t-1}(j) A_{ji}$

### 4.10.5. Viterbi Algorithm

Tìm chuỗi trạng thái tối ưu bằng quy hoạch động.

### 4.10.6. Baum-Welch (EM)

- **E-step:** Tính xác suất trạng thái
- **M-step:** Cập nhật A, B, π

---

## Chuong 4.11: Chuoi Thoi Gian Cau Truc Bayes (BSTS)

### 4.11.1. Y tuong

Kết hợp: Cấu trúc mô hình + Bayes + Kalman Filter

### 4.11.2. Bon buoc

1. **Xác định cấu trúc và priors**
2. **Áp dụng Kalman Filter**
3. **Spike-and-Slab** (chọn biến)
4. **Bayesian Model Averaging** (trung bình mô hình)

### 4.11.3. Spike-and-Slab

- **Spike:** Xác suất cao cho β = 0
- **Slab:** Phân phối mịn cho β ≠ 0

---

## Chuong 4.12: Gradient Boosting & XGBoost

### 4.12.1. Gradient Boosting

$$F_m(x) = F_{m-1}(x) + \eta h_m(x)$$

Xây dựng mô hình theo từng bước, mỗi bước sửa lỗi bước trước.

### 4.12.2. XGBoost

Tối ưu Gradient Boosting với:
- Regularization (tránh overfitting)
- Xử lý missing values tự động
- Parallel processing

---

# PHAN 5: BAI TAP VA DAP AN CHI TIET

## Bai tap 1: Xac dinh thanh phan chuoi

**Đề bài:** Cho chuỗi doanh số bán hàng hàng tháng trong 3 năm:
- Tổng doanh số tăng dần qua các năm
- Tháng 11-12 luôn cao nhất, tháng 2 thấp nhất
- Có đợt giảm đột ngột tháng 3/2020 (COVID)

**Yêu cầu:** Phân tích các thành phần:

**Đáp án:**

| Thành phần | Phân tích |
|-----------|----------|
| **Trend** | Doanh số tăng dần qua các năm → Xu hướng tăng dài hạn |
| **Seasonality** | Tháng 11-12 cao, tháng 2 thấp → Chu kỳ cố định 12 tháng (mùa vụ) |
| **Cyclic** | Không rõ (chỉ có 3 năm dữ liệu, chưa đủ dài để phát hiện chu kỳ dài) |
| **Irregular** | Giảm đột ngột tháng 3/2020 do COVID-19 → Outlier / Biến động ngẫu nhiên |

---

## Bai tap 2: Forward Fill

**Đề bài:** Cho chuỗi: [5, NaN, NaN, 8, 10]

- Thực hiện Forward Fill
- Kết quả?

**Đáp án:**

```
Chuỗi gốc:     [5, NaN, NaN, 8, 10]
Forward Fill:    [5, 5,   5,  8, 10]

Giải thích:
- Vị trí 2 (NaN): Lấy giá trị trước đó = 5
- Vị trí 3 (NaN): Lấy giá trị trước đó = 5 (đã điền)
```

---

## Bai tap 3: Moving Average

**Đề bài:** Cho chuỗi: [10, 12, NaN, 8, 14]

- Thực hiện SMA với k=2

**Đáp án:**

```
Chuỗi gốc:     [10, 12, NaN, 8, 14]
SMA(k=2):      [10, 12, 11, 8, 11]

Giải thích:
- x̂₁ = 10 (không đủ 2 điểm quá khứ)
- x̂₂ = 12 (không đủ 2 điểm quá khứ)
- x̂₃ = (12 + 10) / 2 = 11
- x̂₄ = 8 (dùng giá trị đã điền)
- x̂₅ = (8 + 14) / 2 = 11
```

---

## Bai tap 4: Noi suy tuyen tinh

**Đề bài:** Cho (t₁=1, x₁=10), (t₂=4, x₂=22). Tính x̂ tại t=2 và t=3.

**Đáp án:**

**Công thức:**
$$\hat{x}_t = x_1 + \frac{t - t_1}{t_2 - t_1} \times (x_2 - x_1)$$

**Tại t=2:**
$$\hat{x}_2 = 10 + \frac{2-1}{4-1} \times (22-10) = 10 + \frac{1}{3} \times 12 = 14$$

**Tại t=3:**
$$\hat{x}_3 = 10 + \frac{3-1}{4-1} \times (22-10) = 10 + \frac{2}{3} \times 12 = 18$$

---

## Bai tap 5: Kiem tra tinh dung

**Đề bài:** Xét các chuỗi:
a) $x_t = 5 + \epsilon_t$
b) $x_t = 5 + 0.5t + \epsilon_t$
c) $x_t = x_{t-1} + \epsilon_t$

**Yêu cầu:** Xác định chuỗi nào dừng, chuỗi nào không dừng.

**Đáp án:**

| Chuỗi | E[xₜ] | Var(xₜ) | Kết luận |
|------|-------|--------|---------|
| a) $x_t = 5 + \epsilon_t$ | 5 (hằng số) | σ² (hằng số) | **D���NG** ✓ |
| b) $x_t = 5 + 0.5t + \epsilon_t$ | 5 + 0.5t (phụ thuộc t!) | σ² (hằng số) | **KHÔNG DỪNG** ✗ |
| c) $x_t = x_{t-1} + \epsilon_t$ | 0 + t×σ² (phụ thuộc t!) | t×σ² (phụ thuộc t!) | **KHÔNG DỪNG** ✗ |

**Giải thích:**
- a) Trung bình và phương sai không đổi → Dừng
- b) Trung bình tăng theo t → Không dừng
- c) Random Walk: Phương sai tăng theo t → Không dừng

---

## Bai tap 6: ACF cua nhieu trang

**Đề bài:** Cho {εₜ} ~ WN(0, σ²). Tính ACF ρₖ.

**Đáp án:**

| Lag k | ACF |
|------|-----|
| k = 0 | ρ₀ = γ(0)/γ(0) = 1 |
| k ≠ 0 | ρₖ = γ(k)/γ(0) = 0 |

**Lý do:**
- γ(0) = Var(εₜ) = σ²
- γ(k) = Cov(εₜ, εₜ₋ₖ) = 0 với k ≠ 0 (không tương quan)

---

## Bai tap 7: Toan tu Backshift va Difference

**Đề bài:** Cho chuỗi y = [3, 5, 8, 12, 17]

- Tính B y₃
- Tính Δ y₃

**Đáp án:**

**Backshift:**
$$B y_3 = y_2 = 5$$

**Difference:**
$$\Delta y_3 = y_3 - y_2 = 8 - 5 = 3$$

---

## Bai tap 8: AR(1) - Tinh tham so

**Đề bài:** Cho $x_t = 5 + 0.8 x_{t-1} + \epsilon_t$, $\epsilon_t \sim N(0, 4)$

- Tính μ, γ₀, ρ₁, ρ₂, ρ₃

**Đáp án:**

**a) Trung bình:**
$$\mu = \frac{c}{1 - \phi_1} = \frac{5}{1-0.8} = 25$$

**b) Phương sai:**
$$\gamma_0 = \frac{\sigma^2}{1 - \phi_1^2} = \frac{4}{1-0.64} = \frac{4}{0.36} = 11.11$$

**c) ACF:**
$$\rho_1 = \phi_1 = 0.8$$
$$\rho_2 = \phi_1^2 = 0.64$$
$$\rho_3 = \phi_1^3 = 0.512$$

---

## Bai tap 9: Dieu kien dung cua AR(2)

**Đề bài:** $x_t = 0.5x_{t-1} + 0.3x_{t-2} + \epsilon_t$

Kiểm tra điều kiện dừng.

**Đáp án:**

**3 điều kiện ARROW:**
1. φ₁ + φ₂ < 1: 0.5 + 0.3 = 0.8 < 1 ✓
2. φ₂ - φ₁ < 1: 0.3 - 0.5 = -0.2 < 1 ✓
3. |φ₂| < 1: |0.3| < 1 ✓

**Kết luận:** Mô hình **DỪNG** ✓

---

## Bai tap 10: MA(1) - Tinh ACF

**Đề bài:** $x_t = 10 + \epsilon_t - 0.5 \epsilon_{t-1}$, σ² = 2

- Tính γ₀, ρ₁, ρ₂

**Đáp án:**

**Phương sai:**
$$\gamma_0 = \sigma^2(1 + \theta_1^2) = 2(1 + 0.25) = 2.5$$

**ACF lag 1:**
$$\rho_1 = \frac{-\theta_1}{1 + \theta_1^2} = \frac{-(-0.5)}{1.25} = \frac{0.5}{1.25} = 0.4$$

**ACF lag 2:**
$$\rho_2 = 0$$ (MA(1) cắt ngang sau lag 1)

---

## Bai tap 11: Nhan dang mo hinh tu ACF/PACF

**Đề bài:** Quan sát:
- ACF: giảm dần theo hàm mũ
- PACF: cắt ngang sau lag 2

Xác định mô hình?

**Đáp án:**

| Mô hình | ACF | PACF |
|---------|-----|------|
| AR(p) | Giảm dần | Cắt sau p |
| MA(q) | Cắt sau q | Giảm dần |
| ARMA | Giảm dần | Giảm dần |

**Quan sát:**
- ACF giảm dần → Loại trừ MA (sẽ cắt ngang)
- PACF cắt ngang sau lag 2 → AR(2)

**Kết luận: AR(2)**

---

## Bai tap 12: Sai phan lam dung

**Đề bài:** $x_t = 2 + 3t + \epsilon_t$

- Chứng minh không dừng
- Tính zₜ = Δxₜ và kiểm tra

**Đáp án:**

**a) Chứng minh không dừng:**
$$E[x_t] = 2 + 3t$$ (phụ thuộc t!)
→ Không dừng

**b) Tính sai phân:**
$$z_t = x_t - x_{t-1} = (2+3t+\epsilon_t) - [2+3(t-1)+\epsilon_{t-1}]$$
$$= 3 + \epsilon_t - \epsilon_{t-1}$$

**Kiểm tra:**
$$E[z_t] = 3$$ (hằng số)
$$Var(z_t) = Var(\epsilon_t - \epsilon_{t-1}) = 2\sigma^2$$ (hằng số)

→ **DỪNG!** (đây là MA(1))

---

## Bai tap 13: Xac dinh ARIMA

**Đề bài:** GDP theo quý có trend tăng, không seasonality. ACF giảm chậm, PACF cắt sau lag 1.

**Yêu cầu:** Xác định ARIMA(p,d,q).

**Đáp án:**

| Thông tin | Xác định |
|-----------|----------|
| Trend tăng | cần sai phân → d = 1 |
| PACF cắt lag 1 | p = 1 |
| Không có MA rõ | q = 0 |

**Kết luận: ARIMA(1,1,0)**

---

## Bai tap 14: Method of Moments cho AR(2)

**Đề bài:** Cho r₁ = 0.6, r₂ = 0.3. Ước tính φ₁, φ₂.

**Đáp án:**

**Công thức:**
$$\hat{\phi}_1 = \frac{r_1(1-r_2)}{1-r_1^2} = \frac{0.6(1-0.3)}{1-0.36} = \frac{0.42}{0.64} = 0.6563$$
$$\hat{\phi}_2 = \frac{r_2-r_1^2}{1-r_1^2} = \frac{0.3-0.36}{0.64} = \frac{-0.06}{0.64} = -0.0938$$

---

## Bai tap 15: Dieu kien kha nghich

**Đề bài:** $x_t = \epsilon_t - 1.5 \epsilon_{t-1}$

- Kiểm tra điều kiện khả nghịch

**Đáp án:**

Điều kiện: |θ₁| < 1

|θ₁| = 1.5 > 1 → **Không khả nghịch**

**Ý nghĩa:** Không viết được dạng AR(∞), mô hình không duy nhất.

---

## Bai tap 16: Kalman Gain

**Đề bài:** P_{t|t-1} = 4, H = 1, R = 2

- Tính Kₜ

**Đáp án:**

$$K_t = \frac{P_{t|t-1} H^T}{H P_{t|t-1} H^T + R} = \frac{4 \times 1}{1 \times 4 \times 1 + 2} = \frac{4}{4+2} = \frac{4}{6} = 0.667$$

**Ý nghĩa:** K = 0.667 → Tin đo lường 66.7%, tin mô hình 33.3%

---

## Bai tap 17: Thanh phan HMM

**Đề bài:** HMM 2 trạng thái (Nắng, Mưa):
- A = [[0.7, 0.3], [0.4, 0.6]]
- π = [0.6, 0.4]

Tính P(z₂ = Nắng)

**Đáp án:**

$$P(z_2 = \text{Nắng}) = P(z_2 = N | z_1 = N)P(z_1 = N) + P(z_2 = N | z_1 = M)P(z_1 = M)$$
$$= 0.7 \times 0.6 + 0.4 \times 0.4$$
$$= 0.42 + 0.16 = 0.58$$

---

## Bai tap 18: VAR(1) - Tinh on dinh

**Đề bài:** VAR(1): A₁ = [[0.5, 0.2], [0.1, 0.3]]

- Kiểm tra tính ổn định

**Đáp án:**

Tính eigenvalues:
$$det(A - \lambda I) = 0$$
$$det([[0.5-\lambda, 0.2], [0.1, 0.3-\lambda]]) = 0$$
$$(0.5-\lambda)(0.3-\lambda) - 0.02 = 0$$
$$\lambda^2 - 0.8\lambda + 0.13 = 0$$

Giải:
$$\lambda_1 = 0.573, \lambda_2 = 0.227$$

|λ₁|, |λ₂| < 1 → **Hệ ỔN ĐỊNH** ✓

---

## Bai tap 19: Downsampling

**Đề bài:** [10, 12, 11, 13, 15, 14, 16, 18, 17, 20] (tần suất 5 phút)

- Downsampling với window = 5, dùng mean

**Đáp án:**

**Window 1:** [10, 12, 11, 13, 15] → mean = (10+12+11+13+15)/5 = 61/5 = 12.2
**Window 2:** [14, 16, 18, 17, 20] → mean = (14+16+18+17+20)/5 = 85/5 = 17.0

**Kết quả:** [12.2, 17.0]

---

## Bai tap 20: EMA

**Đề bài:** α = 0.5, chuỗi [10, 12, 14], x̂₀ = 10

- Tính EMA

**Đáp án:**

$x̂_t = \alpha \times x_t + (1-\alpha) \times x̂_{t-1}$

$$x̂_1 = 0.5 \times 10 + 0.5 \times 10 = 10$$
$$x̂_2 = 0.5 \times 12 + 0.5 \times 10 = 11$$
$$x̂_3 = 0.5 \times 14 + 0.5 \times 11 = 12.5$$

---

## Bai tap 21: Spectral Entropy

**Đề bài:** PSD chuẩn hóa p = [0.8, 0.1, 0.1]

- Tính spectral entropy

**Đáp án:**

$$H = -[0.8\log(0.8) + 0.1\log(0.1) + 0.1\log(0.1)]$$
$$= -[0.8 \times (-0.097) + 0.1 \times (-1) + 0.1 \times (-1)]$$
$$= -[-0.0776 - 0.1 - 0.1]$$
$$= 0.2776$$

**Ý nghĩa:** Entropy thấp → Có tần số trội → Có chu kỳ rõ ràng

---

## Bai tap 22: So sanh Kalman Filter va HMM

**Đề bài:** Khi nào dùng Kalman Filter, khi nào dùng HMM?

**Đáp án:**

| Tình huống | Mô hình nên dùng |
|-----------|------------------|
| Trạng thái liên tục, nhiễu Gaussian | Kalman Filter |
| Trạng thái rời rạc (K trạng thái cố định) | HMM |
| Cần xử lý missing data | Kalman Filter |
| Cần phân đoạn chuỗi thành các "regimes" | HMM |
| Cần dự báo có biến giải thích | BSTS |
| Không biết có bao nhiêu loại trạng thái | HMM |

---

## Bai tap 23: Local Level Model

**Đề bài:** Cho Local Level Model:
$$x_t = x_{t-1} + w_t$$
$$y_t = x_t + v_t$$

Cho Q = 1, R = 4, P₀ = 10, x̂₀ = 0

Tính x̂₁₁ và K₁ sau khi quan sát y₁ = 5

**Đáp án:**

**Predict:**
$$\hat{x}_{1|0} = \hat{x}_{0|0} = 0$$
$$P_{1|0} = P_{0|0} + Q = 10 + 1 = 11$$

**Update:**
$$K_1 = \frac{P_{1|0}}{P_{1|0} + R} = \frac{11}{11+4} = \frac{11}{15} = 0.733$$
$$\hat{x}_{1|1} = \hat{x}_{1|0} + K_1(y_1 - \hat{x}_{1|0}) = 0 + 0.733 \times 5 = 3.67$$

---

## Bai tap 24: Baek-welch - E step

**Đề bài:** Cho HMM 2 trạng thái, chuỗi quan sát O = [Wet]
$$\pi = [0.5, 0.5]$$
$$A = [[0.7, 0.3], [0.4, 0.6]]$$
$$B = [[0.1, 0.9], [0.8, 0.2]]$$

Tính α₁(1), α₁(2)

**Đáp án:**

$$\alpha_1(1) = \pi_1 \times B_1(O_1) = 0.5 \times 0.1 = 0.05$$
$$\alpha_1(2) = \pi_2 \times B_2(O_1) = 0.5 \times 0.8 = 0.4$$

---

## Bai tap 25: Spike-and-Slab

**Đề bài:** Giải thích ý nghĩa của Spike-and-Slab trong BSTS

**Đáp án:**

**Spike-and-Slab** là phương pháp chọn biến trong mô hình hồi quy:

| Thành phần | Mô tả |
|-----------|-------|
| **Spike** | Phân phối xác suất cao tập trung tại 0 → Biến không quan trọng |
| **Slab** | Phân phối rộng (phẳng) → Biến có thể có giá trị khác 0 |

**Ví dụ:**
- Có 100 biến giải thích cho doanh số
- Spike-and-Slab chọn: "Chỉ có 5 biến thực sự quan trọng"
- → Tránh overfitting

---

# PHAN 6: BANG SO SANH TONG HOP

## Bang 1: Stationarity vs Invertibility

| Mô hình | Stationarity | Invertibility |
|---------|--------------|---------------|
| AR(p) | Cần điều kiện | Luôn có |
| MA(q) | Luôn có | Cần điều kiện |
| ARMA(p,q) | Cần (từ AR) | Cần (từ MA) |

## Bang 2: ACF/PACF nhan dang

| Mô hình | ACF | PACF |
|---------|-----|------|
| AR(p) | Giảm dần | Cắt sau p |
| MA(q) | Cắt sau q | Giảm dần |
| ARMA | Giảm dần | Giảm dần |

## Bang 3: Cac mo hinh nang cao

| Mô hình | Trạng thái | Ứng dụng |
|---------|------------|----------|
| Kalman Filter | Liên tục, Gaussian | GPS, Tracking, Dự báo |
| HMM | Rời rạc | Nhận dạng giọng nói, Phân đoạn |
| BSTS | Liên tục + Bayesian | Dự báo có biến |
| XGBoost | Không gian đặc trưng | Classification |

---

# PHAN 7: MEO THI

## ✅ Truoc khi thi

1. **Đọc lại bảng so sánh** (Phần 6) nhiều lần
2. **Làm lại tất cả bài tập** trong tài liệu
3. **Nhớ quy tắc nhớ:**
   - AR: PACF cắt sau p
   - MA: ACF cắt sau q
   - |φ| < 1 để dừng (AR)
   - |θ| < 1 để khả nghịch (MA)

## ✅ Khi lam bai

1. **Đọc kỹ đề** - Xác định mô hình trước
2. **Vẽ correlogram** nếu cần - Nhìn ACF/PACF đoán mô hình
3. **Kiểm tra điều kiện** - Dừng (|φ|<1), Khả nghịch (|θ|<1)
4. **Viết công thức rõ ràng** - Giám khảo chấm theo công thức

## ❌ Tranh

1. Nhầm lẫn AR và MA (ACF/PACF **ngược nhau**)
2. Quên điều kiện dừng/khả nghịch
3. Tính sai số học đơn giản
4. Không đọc kỹ đề - Xác định sai mô hình

---

**Chúc các bạn thi đạt kết quả cao! 🎉**

---

*Tài liệu được tổng hợp từ 4 bộ slide + tài liệu bổ sung*
*Giảng viên: Đỗ Tiến Dũng*