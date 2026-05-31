---
title: Y4T2-Time Series Ôn tập chi tiết
keywords: [time-series, revise, exam]
date: 2026-05-31
theme: time-series
description: Ôn tập phân tích dữ liệu chuỗi thời gian - giải chi tiết lý thuyết
---

# Ôn tập Phân tích Dữ liệu Chuỗi Thời gian

**Môn học:** Phân tích Dữ liệu Chuỗi Thời gian - Năm 4 Học kỳ 2

---

# PHẦN 1: GIỚI THIỆU & ĐẶC ĐIỂM CHUỖI THỜI GIAN

## 1.1 Định nghĩa Chuỗi Thời gian

**Chuỗi thời gian (Time Series)** là tập hợp các quan sát về một hiện tượng nào đó được thu thập theo trình tự trong một khoảng thời gian nhất định.

**Đặc điểm quan trọng:**

- Dữ liệu được thu thập theo **thứ tự thời gian** (time-ordered).
- Các quan sát tại các thời điểm **cách đều nhau** (hàng ngày, hàng tháng, hàng năm,...).

**Ví dụ:** Nhiệt độ trung bình hàng tháng, doanh số bán hàng hàng tháng, giá cổ phiếu hàng ngày.

## 1.2 Thuật ngữ cơ bản

**Chuỗi liên tục (Continuous):** Các quan sát được thực hiện liên tục theo thời gian. VD: điện tâm đồ (ECG), tín hiệu rung động của máy.

**Chuỗi rời rạc (Discrete):** Các quan sát chỉ được thực hiện tại những thời điểm cụ thể, thường cách đều nhau. VD: doanh số theo ngày/tuần/tháng.

**Ký hiệu:**

- $Y_t$: giá trị quan sát được tại thời điểm $t$
- $T = 1, 2, \ldots, T$: chỉ số thời gian

**Các cách tạo chuỗi rời rạc:**

- Lấy mẫu từ chuỗi liên tục (sampling).
- Tổng hợp trong khoảng thời gian bằng nhau (aggregation).
- Vốn dĩ đã rời rạc (VD: cổ tức hàng năm).

## 1.3 Đặc điểm của chuỗi thời gian

### Thứ tự thời gian quan trọng

Dữ liệu **không thể xáo trộn** thứ tự mà không làm mất ý nghĩa. Khác với dữ liệu tabular thông thường, các quan sát chuỗi thời gian **không độc lập** (non-i.i.d).

### Các thành phần của chuỗi thời gian

| Thành phần | Ý nghĩa | Ví dụ |
|-----------|---------|-------|
| **Trend (Xu hướng)** | Sự thay đổi chung dài hạn (tăng/giảm) | Số lượng ca sinh, giá cả hàng hóa |
| **Seasonality (Mùa vụ)** | Biến động theo chu kỳ cố định (< 1 năm) | Tiêu thụ điện, du lịch |
| **Cyclic (Chu kỳ)** | Biến động theo chu kỳ không cố định (> 1 năm) | Chu kỳ kinh tế, biến đổi khí hậu |
| **Irregular (Ngẫu nhiên)** | Dao động không dự đoán trước được | Nhiễu đo lường, sự kiện đột ngột |

### Tính dừng (Stationarity)

Một chuỗi **dừng** có các đặc tính thống kê (trung bình, phương sai) **không đổi** theo thời gian.

- **Không dừng:** Dữ liệu có trend rõ rệt.
- **Dừng:** Dữ liệu dao động quanh mức trung bình cố định.

### Các đặc điểm khác

- **Độ trễ (Lag):** Ảnh hưởng của giá trị quá khứ đến hiện tại.
- **Biến động (Volatility):** Mức độ dao động có thể thay đổi theo thời gian.
- **Dữ liệu thiếu/outlier:** Dễ xảy ra trong đo đạc.

## 1.4 Mục tiêu phân tích chuỗi thời gian

| Mục tiêu | Mô tả |
|----------|-------|
| **Mô tả** | Hiểu rõ dữ liệu, xác định thành phần cấu thành |
| **Giải thích** | Giải thích thay đổi bằng chuỗi liên quan hoặc yếu tố môi trường |
| **Dự đoán** | Dự báo giá trị tương lai dựa trên mô hình |
| **Kiểm soát** | Phát hiện bất thường, kiểm soát chất lượng |

## 1.5 Các bài toán cơ bản

| Bài toán | Mô tả | Ví dụ | Phương pháp |
|----------|-------|-------|-------------|
| **Dự báo (Forecasting)** | Dự đoán giá trị tương lai | Dự báo lưu lượng web, giá cổ phiếu | ARIMA, LSTM, Transformer |
| **Phát hiện bất thường** | Tìm điểm bất thường trong chuỗi | Phát hiện xâm nhập mạng | Autoencoders, Isolation Forest |
| **Phân loại chuỗi** | Gán nhãn cho toàn bộ chuỗi | Phân loại bệnh lý từ ECG | k-NN + DTW, CNN, RNN |
| **Phân cụm chuỗi** | Nhóm chuỗi có đặc điểm tương tự | Nhóm khách hàng theo hành vi | k-means + DTW |
| **Tái tạo & mô phỏng** | Tạo dữ liệu mới từ mô hình | Sinh dữ liệu giả lập | GANs, Diffusion Models |

## 1.6 Lịch sử phát triển

| Năm | Đóng góp |
|-----|----------|
| 1927 | Mô hình AR - G.U. Yule |
| 1970 | Box-Jenkins: AR, MA, ARMA, ARIMA, SARIMA |
| 1982 | ARCH - Engle (Nobel 2003) |
| 1997 | LSTM - Hochreiter & Schmidhuber |
| 2017 | Transformer - Vaswani et al. |

---

# PHẦN 2: KỸ THUẬT XỬ LÝ DỮ LIỆU

## 2.1 Nhãn thời gian (Timestamp)

**Định nghĩa:** Một giá trị biểu diễn thời điểm xảy ra của một quan sát.

**Các dạng:**

- **Real-time:** `2025-07-22 09:15:23`
- **Interval:** Tháng 1/2025, Tuần 23
- **Index-based:** Quan sát thứ 1, 2, 3

**Tầm quan trọng:**

- Xác định thứ tự và khoảng cách giữa các quan sát.
- Phân tích xu hướng và mùa vụ.
- Tính toán độ trễ, hồi quy, dự báo.

**Lưu ý:** Cần kiểm tra định dạng (YYYY-MM-DD HH:MM:SS), tính đồng nhất, xử lý dữ liệu thiếu, chọn độ phân giải phù hợp.

## 2.2 Làm sạch dữ liệu

### Xử lý dữ liệu thiếu (Missing Data)

**Hướng tiếp cận:**

| Phương pháp | Ý nghĩa | Khi nào dùng |
|-------------|---------|---------------|
| **Forward fill** | Điền giá trị gần nhất trước đó | Giá trị giữ ổn định (trạng thái on/off) |
| **Simple Moving Average (SMA)** | Trung bình k điểm gần nhất | Chuỗi mượt, thiếu ít |
| **Centered Moving Average (CMA)** | Trung bình hai phía | Điểm thiếu nằm giữa chuỗi |
| **Weighted Moving Average (WMA)** | Trung bình có trọng số | Cần ưu tiên gần |
| **Linear Interpolation** | Nội suy tuyến tính | Xu hướng thay đổi đều |
| **Spline Interpolation** | Nội suy bậc cao (bậc 3) | Cần giữ hình dạng tín hiệu |

**Forward fill:**

$$x_t = x_{t-1}$$

Nhiều điểm liên tiếp: $x_t, x_{t+1}, \ldots, x_{t+k} = x_{t-1}$

**Simple Moving Average:**

$$\hat{x}_t = \frac{x_{t-1} + x_{t-2} + \ldots + x_{t-k}}{k}$$

**Linear Interpolation:**

$$\hat{x}_t = x_1 + \frac{t - t_1}{t_2 - t_1}(x_2 - x_1)$$

**Spline Interpolation (bậc 3):**

$$S_i(t) = a_i + b_i(t - t_i) + c_i(t - t_i)^2 + d_i(t - t_i)^3$$

Đảm bảo liên tục: hàm số, đạo hàm bậc 1, đạo hàm bậc 2 tại điểm nối.

### Thay đổi tần suất

**Downsampling (giảm tần suất):** Chuyển từ tần suất cao → thấp. VD: 1 phút → 15 phút.

Các giá trị thường dùng: mean (làm mượt), sum (tích lũy), min/max (cực trị), median (chống outlier).

**Upsampling (tăng tần suất):** Chuyển từ tần suất thấp → cao. Tạo nhiều điểm NaN → cần điền (forward/backward filling, interpolation).

### Khử nhiễu & làm mịn (Denoising & Smoothing)

**Moving Average:**

$$\hat{x}_t = \frac{x_t + x_{t-1} + \ldots + x_{t-k+1}}{k}$$

Ưu điểm: Dễ dùng, hiệu quả với nhiễu nhỏ. Nhược điểm: Làm mất chi tiết, trễ tín hiệu.

**Exponential Moving Average (EMA):**

$$\hat{x}_t = \alpha x_t + (1 - \alpha)\hat{x}_{t-1}$$

$0 < \alpha \leq 1$: $\alpha$ lớn → bám dữ liệu gốc; $\alpha$ nhỏ → làm mượt mạnh hơn.

**Weighted Moving Average (WMA):**

$$\hat{x}_t = \frac{w_1 x_t + w_2 x_{t-1} + \ldots + w_k x_{t-k+1}}{\sum w_i}$$

### Xử lý tính thời vụ

$$\text{Deseasonalized} = \frac{X_t}{\text{Seasonal\_index}} \quad \text{hoặc} \quad = X_t - \text{Seasonal}(t)$$

### Chuẩn hóa định dạng thời gian

- Chuyển về ISO 8601: YYYY-MM-DD HH:MM:SS.
- Chuẩn hóa múi giờ (timezone).
- Chuẩn hóa tần suất.

### Ngăn ngừa Look-ahead bias

- Chỉ dùng dữ liệu quá khứ và hiện tại để dự đoán tương lai.
- Phân tách train/test theo thời gian, không xáo trộn.
- Tính đặc trưng dạng rolling, moving average dựa trên quá khứ.

## 2.3 Mô phỏng dữ liệu

**Vì sao cần mô phỏng:**

- Kiểm tra tính đúng đắn mô hình trước khi có dữ liệu thực.
- Bổ sung dữ liệu khi bị hạn chế.
- Đào tạo mô hình với dữ liệu đa dạng.
- Nghiên cứu tác động của noise, outlier, missing data.

**Các phương pháp:**

| Nhóm | Phương pháp |
|------|------------|
| **Thống kê** | White noise, Random walk, AR, MA, ARIMA, ARCH, GARCH |
| **Học sâu** | GANs, VAEs |
| **Dựa trên quy tắc** | Heuristic, mô phỏng sự kiện rời rạc, mô phỏng vật lý |

## 2.4 Lưu trữ dữ liệu

**Các chiến lược:**

| Chiến lược | Ví dụ | Đặc điểm |
|------------|-------|----------|
| Flat files | CSV, Parquet | Đơn giản, dữ liệu nhỏ |
| RDBMS | MySQL, PostgreSQL | Dữ liệu quan hệ |
| **TSDB** | InfluxDB, TimescaleDB | Tối ưu cho time series |
| Kho phân tán | Hadoop, BigQuery | Dữ liệu lớn |

**TSDB** hỗ trợ: nén dữ liệu, ghi nhanh, truy vấn theo thời gian, downsampling, retention policies.

## 2.5 Trực quan hóa

| Loại biểu đồ | Ý nghĩa |
|-------------|---------|
| **Line plot** | Phổ biến nhất, hiển thị xu hướng, mùa vụ, biến động, outlier |
| **Histogram** | Kiểm tra phân phối, stationarity |
| **Scatter plot** | Phân tán giá trị theo thời gian |
| **Lag scatter plot** | Kiểm tra autocorrelation |

**Biến đổi phổ biến:**

- **Log:** Ổn định phương sai, chuyển cấp số nhân → tuyến tính.
- **Sqrt:** Nén giá trị nhẹ hơn log.
- **Box-Cox:** Gia đình biến đổi parametric.

---

# PHẦN 3: TRÍCH CHỌN ĐẶC TRƯNG & TÍNH DỪNG

## 3.1 Phân đoạn và cửa sổ trượt

**Phân đoạn (Segmentation):** Chia chuỗi thành nhiều đoạn nhỏ có tính chất ổn định.

- Phân đoạn dựa trên mô hình.
- Phân đoạn dựa trên thay đổi thống kê (change points).
- Phân đoạn dựa trên tín hiệu (Fourier/Wavelet).

**Cửa sổ trượt (Sliding Window):** Lấy các đoạn con có độ dài cố định từ chuỗi.

- Window size (W): chiều dài cửa sổ.
- Step size (S): khoảng dịch chuyển mỗi lần.

## 3.2 Đặc trưng thống kê

| Nhóm | Đặc trưng | Công thức |
|------|----------|----------|
| **Mức độ trung tâm** | Mean, Median | $\bar{x} = \frac{1}{n}\sum x_i$ |
| **Độ phân tán** | Variance, Std, Range | $s^2 = \frac{1}{n-1}\sum(x_i - \bar{x})^2$ |
| **Hình dạng** | Skewness | $\text{Skew} = \frac{E[(X-\mu)^3]}{\sigma^3}$ |
| **Phụ thuộc thời gian** | ACF, PACF | Xem phần 3.3 |
| **Khác** | Entropy, Energy | Đo hỗn loạn, tổng sức mạnh tín hiệu |

**Skewness:**

- = 0: phân phối đối xứng.
- > 0: lệch phải (đuôi phải dài).
- < 0: lệch trái (đuôi trái dài).

## 3.3 Tính dừng (Stationarity)

### Tại sao tính dừng quan trọng?

Phần lớn các mô hình thống kê (AR, MA, ARMA, ARIMA) đều **giả định chuỗi là dừng**. Nếu chuỗi không dừng, các ước lượng tham số sẽ không ổn định và dự báo sẽ sai.

### Tính dừng nghiêm ngặt (Strict Stationarity)

$$F(X_{t_1}, X_{t_2}, \ldots, X_{t_n}) = F(X_{t_1+k}, X_{t_2+k}, \ldots, X_{t_n+k})$$

với mọi $t$ và mọi độ dịch chuyển $k$.

→ Phân phối xác suất **không thay đổi** khi dịch chuyển thời gian. Trung bình, phương sai, và tất cả các mômen đều là hằng số.

### Tính dừng yếu (Weak Stationarity)

$$E[X_t] = \mu \quad (\text{không phụ thuộc } t)$$

$$\text{Var}(X_t) = \sigma^2 \quad (\text{không phụ thuộc } t)$$

$$\text{Cov}(X_t, X_{t-k}) = \gamma(k) \quad (\text{chỉ phụ thuộc } k)$$

→ Chỉ cần 2 mômen đầu tiên (trung bình, phương sai) và hiệp phương sai là hằng số.

**Lưu ý:** Tính dừng nghiêm ngặt luôn dẫn đến tính dừng yếu. Ngược lại chỉ đúng với phân phối chuẩn đa biến.

### Ví dụ kiểm tra tính dừng

| Chuỗi | Mô hình | Dừng? | Giải thích |
|-------|---------|-------|-----------|
| $X_t = \beta + \varepsilon_t$ | Constant + noise | **Có** | $\mu = \beta$ (hằng số), $\text{Var} = \sigma^2$ (hằng số) |
| $X_t = \beta_0 + \beta_1 t + \varepsilon_t$ | Trend tuyến tính | **Không** | $\mu_t = \beta_0 + \beta_1 t$ (phụ thuộc $t$) |
| $X_t = X_{t-1} + \varepsilon_t$ | Random walk | **Không** | $\text{Var}(X_t) = t\sigma^2$ (tăng vô hạn) |

### Cách đưa chuỗi về dạng dừng

| Phương pháp | Khi nào dùng | Ví dụ |
|------------|---------------|-------|
| **Sai phân (Differencing)** | Có trend | $\nabla X_t = X_t - X_{t-1}$ |
| **Sai phân bậc cao** | Trend bậc $d$ | $\nabla^d X_t = (1-B)^d X_t$ |
| **Log transform** | Phương sai thay đổi | $\log(X_t)$ |
| **Box-Cox** | Phân phối lệch | $\frac{X_t^\lambda - 1}{\lambda}$ |

### Ví dụ: Sai phân loại bỏ trend

Cho $Y_t = \beta_0 + \beta_1 t + \varepsilon_t$ (không dừng vì có trend).

Sai phân bậc 1:

$$\nabla Y_t = Y_t - Y_{t-1} = \beta_1 + \varepsilon_t - \varepsilon_{t-1}$$

→ $\nabla Y_t$ là MA(1) → **dừng** (trung bình = $\beta_1$, phương sai = $2\sigma^2$).

## 3.4 Hàm tự tương quan (ACF) và Tự tương quan từng phần (PACF)

### ACF (Autocorrelation Function) - Hàm tự tương quan

**ACF** đo mức độ tương quan tuyến tính giữa chuỗi thời gian với chính nó ở các độ trễ (lag) khác nhau. Nói đơn giản: giá trị hiện tại liên quan thế nào đến giá trị quá khứ.

**Công thức:**

$$\rho(k) = \frac{\gamma(t, t-k)}{\gamma(t, t)} = \frac{\text{Cov}(X_t, X_{t-k})}{\text{Var}(X_t)}$$

Trong đó:

- $\gamma(k) = \text{Cov}(X_t, X_{t-k})$ là **autocovariance** tại lag $k$.
- $\gamma(0) = \text{Var}(X_t)$ là phương sai.

**Ước lượng mẫu:**

$$r_k = \frac{\sum_{t=k+1}^{n}(x_t - \bar{x})(x_{t-k} - \bar{x})}{\sum_{t=1}^{n}(x_t - \bar{x})^2}$$

**Đặc điểm quan trọng:**

- $r_0 = 1$ (tương quan với chính mình luôn bằng 1).
- $r_k = r_{-k}$ (đối xứng).
- $r_k \in [-1, 1]$.
- **Khoảng tin cậy:** $r_k$ nằm trong khoảng $\pm \frac{1.96}{\sqrt{n}}$ thì coi như bằng 0 (không có ý nghĩa thống kê).

### Cách đọc đồ thị Correlogram (ACF plot)

Đồ thị ACF có trục X = lag (0, 1, 2, ...) và trục Y = hệ số tự tương quan $r_k$. Đường nét đứt trên/dưới = khoảng tin cậy 95%.

**Các dạng ACF phổ biến:**

| Dạng ACF | Ý nghĩa | Chuỗi |
|----------|---------|-------|
| $r_0 = 1$, tất cả $r_k \approx 0$ (nằm trong khoảng tin cậy) | Không có tự tương quan → **Nhiễu trắng (White noise)** | Chuỗi ngẫu nhiên |
| $r_k$ giảm từ từ theo hàm mũ hoặc sóng sin | Có **trend** hoặc **chu kỳ** mạnh → chuỗi **không dừng** | Dữ liệu có xu hướng |
| $r_k$ giảm nhanh về 0 (chậm hơn noise trắng) | Có tự tương quan → phù hợp **AR** | AR(p) |
| $r_1$ lớn, $r_k \approx 0$ với $k > 1$ | Chỉ có lag 1 tương quan → phù hợp **MA(1)** | MA(q) |
| $r_k$ dao động theo chu kỳ lặp lại | Có **tính mùa vụ** (seasonality) | Dữ liệu có mùa vụ |

**Ví dụ minh họa:**

- **Nhiễu trắng:** $r_1 = 0.02, r_2 = -0.01, r_3 = 0.03, \ldots$ (tất cả nằm trong khoảng $\pm \frac{1.96}{\sqrt{n}}$).
- **AR(1) với $\phi_1 = 0.8$:** $r_1 \approx 0.8, r_2 \approx 0.64, r_3 \approx 0.512, \ldots$ (giảm theo hàm mũ).
- **MA(1) với $\theta_1 = 0.5$:** $r_1 \approx -0.4, r_2 \approx 0, r_3 \approx 0, \ldots$ (cắt ngang sau lag 1).
- **Dữ liệu có trend:** $r_1 = 0.95, r_2 = 0.90, r_3 = 0.85, \ldots$ (giảm rất chậm).

### PACF (Partial Autocorrelation Function) - Hàm tự tương quan từng phần

**PACF** đo tương quan tuyến tính giữa $Y_t$ và $Y_{t-k}$ sau khi **loại bỏ tác động** của các biến nằm giữa ($Y_{t-1}, \ldots, Y_{t-k+1}$).

**Ý tưởng:** ACF tại lag $k$ bao gồm cả ảnh hưởng gián tiếp qua các lag trung gian. PACF loại bỏ ảnh hưởng gián tiếp này để chỉ giữ **mối quan hệ trực tiếp**.

**Ví dụ:** ACF lag 3 của AR(1) có thể lớn是因为它经过了lag 1 và lag 2, nhưng PACF lag 3 ≈ 0 vì không có quan hệ trực tiếp giữa $Y_t$ và $Y_{t-3}$.

**Đặc điểm:**

- $\phi_{00} = 1$.
- $\phi_{kk} \in [-1, 1]$.
- Khoảng tin cậy: $\pm \frac{1.96}{\sqrt{n}}$.

### ACF vs PACF - Bảng so sánh để chọn mô hình

| Mô hình | ACF | PACF |
|---------|-----|------|
| **AR(p)** | Giảm từ từ (hàm mũ hoặc sóng sin), không cắt ngang | **Cắt ngang sau lag $p$** (PACF ≈ 0 với $k > p$) |
| **MA(q)** | **Cắt ngang sau lag $q$** (ACF ≈ 0 với $k > q$) | Giảm từ từ |
| **ARMA(p,q)** | Giảm từ từ | Giảm từ từ |

**Cách chọn mô hình:**

1. Vẽ ACF và PACF của chuỗi.
2. Nếu ACF giảm từ từ, PACF cắt ngang sau lag $p$ → chọn **AR(p)**.
3. Nếu ACF cắt ngang sau lag $q$, PACF giảm từ từ → chọn **MA(q)**.
4. Nếu cả hai đều giảm từ từ → có thể là **ARMA(p,q)**, dùng AIC/BIC để chọn bậc.

### Ví dụ thực tế: Kiểm tra nhiễu trắng

Cho chuỗi $\{\varepsilon_t\}$ là nhiễu trắng với $\varepsilon_t \sim N(0, \sigma^2)$.

$$\rho(k) = \begin{cases} 1 & k = 0 \\ 0 & k \neq 0 \end{cases}$$

→ Trên đồ thị correlogram: chỉ có cột lag 0 bằng 1, tất cả lag khác nằm trong khoảng $\pm \frac{1.96}{\sqrt{n}}$.

Nếu có lag nằm ngoài khoảng tin cậy → chuỗi **không phải** nhiễu trắng → có thể có cấu trúc cần mô hình hóa.

### Ví dụ thực tế: ACF của AR(1)

$$Y_t = 0.7 Y_{t-1} + \varepsilon_t$$

$$\rho(k) = 0.7^k$$

| Lag $k$ | $\rho(k)$ |
|---------|-----------|
| 0 | 1.000 |
| 1 | 0.700 |
| 2 | 0.490 |
| 3 | 0.343 |
| 4 | 0.240 |
| 5 | 0.168 |

→ ACF giảm từ từ theo hàm mũ. PACF: $\phi_{11} = 0.7$, $\phi_{kk} = 0$ với $k > 1$.

### Ví dụ thực tế: ACF của MA(1)

$$Y_t = \varepsilon_t + 0.5 \varepsilon_{t-1}$$

$$\rho(k) = \begin{cases} \frac{0.5}{1 + 0.5^2} \approx 0.4 & k = 1 \\ 0 & k > 1 \end{cases}$$

→ ACF: $r_1 \approx 0.4$, $r_k \approx 0$ với $k > 1$. PACF giảm từ từ.

### Hệ phương trình Yule-Walker

Cho AR(p) với trung bình 0, phương trình Yule-Walker liên hệ ACF với các hệ số AR:

$$\rho_k = \phi_1 \rho_{k-1} + \phi_2 \rho_{k-2} + \ldots + \phi_p \rho_{k-p}$$

**AR(1):** $\rho_1 = \phi_1$ → $\phi_1 = r_1$ (dùng hệ số tự tương quan mẫu).

**AR(2):** Hệ phương trình:

$$\begin{cases} \rho_1 = \phi_1 + \phi_2 \rho_1 \\ \rho_2 = \phi_1 \rho_1 + \phi_2 \end{cases}$$

Giải:

$$\phi_1 = \frac{\rho_1(1 - \rho_2)}{1 - \rho_1^2}, \quad \phi_2 = \frac{\rho_2 - \rho_1^2}{1 - \rho_1^2}$$

## 3.5 Toán tử chuỗi thời gian

### Toán tử dịch ngược (Backshift operator)

$$B^k Y_t = Y_{t-k}$$

Ví dụ: $B Y_t = Y_{t-1}$, $B^2 Y_t = Y_{t-2}$.

### Toán tử sai phân (Difference operator)

$$\nabla Y_t = Y_t - Y_{t-1} = (1 - B)Y_t$$

Sai phân bậc $d$:

$$\nabla^d Y_t = (1 - B)^d Y_t$$

**Mối quan hệ:** $(1 - B)Y_t = \nabla Y_t$.

### Biến đổi cho chuỗi không dừng

- **Sai phân (Differencing):** Loại bỏ trend.
- **Log, Sqrt:** Ổn định phương sai.
- **Box-Cox:** Gia đình biến đổi parametric.

---

# PHẦN 4: MÔ HÌNH THỐNG KÊ

## 4.1 Quá trình Ngẫu nhiên Tuyến tính

**Định nghĩa Wold (1938):** Mọi quá trình dừng đều có thể biểu diễn dưới dạng tổ hợp tuyến tính của nhiễu trắng.

$$Y_t = \mu + \sum_{j=0}^{\infty} \psi_j \varepsilon_{t-j}$$

Trong đó $\{\varepsilon_t\}$ là nhiễu trắng, $\mu$ là hằng số, $\{\psi_j\}$ là dãy cố định.

**Điều kiện dừng:** $\sum \psi_j^2 < \infty$.

**Ba nhóm mô hình động:**

- **Tự hồi quy (AR):** $Y_t$ phụ thuộc vào $Y_{t-1}, Y_{t-2}, \ldots$
- **Trung bình động (MA):** $Y_t$ phụ thuộc vào $\varepsilon_{t-1}, \varepsilon_{t-2}, \ldots$
- **Kết hợp (ARMA):** Cả AR và MA.

## 4.2 Mô hình AR(p) - Autoregressive

### Định nghĩa

**AR(p)** là mô hình trong đó giá trị hiện tại $Y_t$ được mô tả như **hàm tuyến tính** của các giá trị quá khứ $Y_{t-1}, Y_{t-2}, \ldots, Y_{t-p}$ cộng với nhiễu trắng.

$$Y_t = c + \phi_1 Y_{t-1} + \phi_2 Y_{t-2} + \ldots + \phi_p Y_{t-p} + \varepsilon_t$$

Hoặc dùng toán tử dịch ngược:

$$\Phi(B) Y_t = c + \varepsilon_t$$

Trong đó $\Phi(B) = 1 - \phi_1 B - \phi_2 B^2 - \ldots - \phi_p B^p$.

**Ý nghĩa:** "Hôm nay = một phần của hôm qua + nhiễu ngẫu nhiên."

### AR(1) - Mô hình tự hồi quy bậc nhất

$$Y_t = c + \phi_1 Y_{t-1} + \varepsilon_t$$

**Các trường hợp:**

- $|\phi_1| < 1$: Chuỗi **dừng**, dần ổn định.
- $\phi_1 > 0$: Xu hướng **nối tiếp cùng chiều** (giá trị cao → giá trị tiếp theo cũng cao).
- $\phi_1 < 0$: **Dao động lên xuống** (zig-zag, xen kẽ).
- $|\phi_1| = 1$: **Random walk** (không dừng).

**Ví dụ:** Dự báo dân số:

$$Y_t = \phi_1 Y_{t-1} + \varepsilon_t$$

Trong đó $\phi_1$ = tỷ lệ những người vẫn còn sống, $\varepsilon_t$ = công dân mới.

**Điều kiện dừng:** Nghiệm của phương trình đặc trưng $\Phi(B) = 0$ phải nằm **ngoài** đường tròn đơn vị ($|B| > 1$). Với AR(1): điều kiện là $|\phi_1| < 1$.

**Các tham số:**

- **Giá trị trung bình:** $\mu = \frac{c}{1 - \phi_1}$
- **Phương sai:** $\gamma_0 = \frac{\sigma^2}{1 - \phi_1^2}$
- **ACF:** $\rho_k = \phi_1^k$ (giảm theo hàm mũ)
- **PACF:** $\phi_{11} = \phi_1$, $\phi_{kk} = 0$ với $k > 1$

### AR(2) - Mô hình tự hồi quy bậc hai

$$Y_t = c + \phi_1 Y_{t-1} + \phi_2 Y_{t-2} + \varepsilon_t$$

**Điều kiện dừng (điều kiện đủ):**

1. $\phi_1 + \phi_2 < 1$
2. $\phi_2 - \phi_1 < 1$
3. $|\phi_2| < 1$

**ACF:** Phụ thuộc vào nghiệm phương trình đặc trưng:

- Nghiệm thực: ACF giảm theo **hàm mũ**.
- Nghiệm phức: ACF giảm theo dạng **sóng sin** (dao động).

**Ví dụ:** $Y_t = 0.5 Y_{t-1} + 0.3 Y_{t-2} + \varepsilon_t$

- $\phi_1 + \phi_2 = 0.8 < 1$ ✓
- $\phi_2 - \phi_1 = -0.2 < 1$ ✓
- $|\phi_2| = 0.3 < 1$ ✓

→ Mô hình là **dừng**.

### AR(p) tổng quát

**Ước lượng tham số:**

- **OLS (Ordinary Least Squares):** $\hat{\phi} = (X^T X)^{-1} X^T Y$
- **MLE (Maximum Likelihood Estimation)**
- **Yule-Walker:** Dùng hệ phương trình liên hệ ACF với tham số AR.

**ACF:** Mở rộng vô hạn, hỗn hợp hàm mũ hoặc sóng sin suy giảm → Dùng để **nhận biết** có mô hình AR.

**PACF:** Cắt ngang sau bậc $p$ → Dùng để **chọn bậc** AR(p).

**Ứng dụng:**

- Dự báo tài chính: giá cổ phiếu, lãi suất.
- Kinh tế vĩ mô: GDP, CPI.
- Khí tượng: nhiệt độ, lượng mưa.

## 4.3 Mô hình MA(q) - Moving Average

### Định nghĩa

**MA(q)** là mô hình trong đó giá trị hiện tại $Y_t$ được mô tả dựa trên **nhiễu trắng hiện tại** và các **nhiễu trắng trong quá khứ**.

$$Y_t = c + \varepsilon_t + \theta_1 \varepsilon_{t-1} + \theta_2 \varepsilon_{t-2} + \ldots + \theta_q \varepsilon_{t-q}$$

Hoặc: $Y_t = c + \Theta(B)\varepsilon_t$

Trong đó $\Theta(B) = 1 + \theta_1 B + \theta_2 B^2 + \ldots + \theta_q B^q$.

**Ý tưởng:** "Hôm nay = nhiễu hôm nay + ảnh hưởng của các cú shock quá khứ."

**Lưu ý:** MA **luôn dừng** bất kể giá trị tham số, vì số lượng giá trị $\psi$ khác không là hữu hạn.

### MA(1) - Trung bình động bậc nhất

$$Y_t = c + \varepsilon_t - \theta_1 \varepsilon_{t-1}$$

**ACF:** Cắt ngang sau lag 1:

$$\rho(k) = \begin{cases} \frac{-\theta_1}{1 + \theta_1^2} & k = 1 \\ 0 & k > 1 \end{cases}$$

**PACF:** Mở rộng vô hạn, giảm theo hàm mũ.

**Ví dụ:** $Y_t = \varepsilon_t + 0.5 \varepsilon_{t-1}$

- $\rho_1 = \frac{0.5}{1 + 0.25} = 0.4$
- $\rho_2 = \rho_3 = \ldots = 0$

→ ACF: chỉ lag 1 có ý nghĩa, lag > 1 ≈ 0.

**Điều kiện khả nghịch (Invertibility):** $|\theta_1| < 1$ → MA có thể viết dưới dạng AR vô hạn. Điều này giúp:

- Đảm bảo mô hình **duy nhất** (unique).
- **Ước lượng MLE** hội tụ tốt.
- Dễ dàng **dự báo** nhiều bước.

### MA(2) - Trung bình động bậc hai

$$Y_t = c + \varepsilon_t + \theta_1 \varepsilon_{t-1} + \theta_2 \varepsilon_{t-2}$$

**ACF:**

$$\rho_1 = \frac{-\theta_1 + \theta_1 \theta_2}{1 + \theta_1^2 + \theta_2^2}$$
$$\rho_2 = \frac{-\theta_2}{1 + \theta_1^2 + \theta_2^2}$$
$$\rho_k = 0 \quad \forall k > 2$$

→ ACF: cắt ngang sau lag 2.

### MA(q) tổng quát

**ACF:** Cắt ngang sau lag $q$ ($\rho_k = 0$ với $k > q$).

**PACF:** Mở rộng vô hạn.

**Ước lượng tham số:**

- **Nonlinear Least Squares:** Vì MA không tuyến tính về tham số.
- **MLE:** Dùng numerical optimization.

### So sánh AR vs MA

| Tiêu chí | AR(p) | MA(q) |
|----------|-------|-------|
| Phụ thuộc vào | Giá trị quá khứ $Y_{t-1}, \ldots$ | Nhiễu quá khứ $\varepsilon_{t-1}, \ldots$ |
| **ACF** | Giảm từ từ | **Cắt ngang sau lag $q$** |
| **PACF** | **Cắt ngang sau lag $p$** | Giảm từ từ |
| Điều kiện dừng | Nghiệm $\Phi(B) = 0$ ngoài đơn vị | Luôn dừng |
| Điều kiện khả nghịch | Luôn khả nghịch | Nghiệm $\Theta(B) = 0$ ngoài đơn vị |

## 4.4 Mô hình ARMA(p, q)

$$Y_t = c + \sum_{i=1}^{p} \phi_i Y_{t-i} + \varepsilon_t + \sum_{j=1}^{q} \theta_j \varepsilon_{t-j}$$

Hoặc: $\Phi(B)Y_t = c + \Theta(B)\varepsilon_t$

### Tính dừng và khả nghịch

| Tính chất | Mô hình | Điều kiện |
|-----------|---------|-----------|
| **Stationarity** | AR(p) | Nghiệm $\Phi(B) = 0$ ngoài đường tròn đơn vị |
| **Invertibility** | MA(q) | Nghiệm $\Theta(B) = 0$ ngoài đường tròn đơn vị |

- Stationarity → AR có thể viết dưới dạng MA vô hạn.
- Invertibility → MA có thể viết dưới dạng AR vô hạn.

### ARMA(1,1)

$$Y_t = \phi_1 Y_{t-1} + \varepsilon_t + \theta_1 \varepsilon_{t-1}$$

- Dừng nếu $|\phi_1| < 1$.
- Khả nghịch nếu $|\theta_1| < 1$.

## 4.5 Mô hình ARIMA(p, d, q)

Hầu hết chuỗi thời gian thực tế **không dừng**. ARIMA xử lý bằng cách lấy sai phân $d$ lần để đưa về dạng dừng, sau đó áp dụng ARMA.

$$\Phi(B)(1 - B)^d Y_t = c + \Theta(B)\varepsilon_t$$

Trong đó:

- $p$: bậc AR.
- $d$: số lần sai phân (để đưa về dạng dừng).
- $q$: bust MA.

**Ý nghĩa:** ARIMA = AR (tự hồi quy) + I (Integrated - sai phân) + MA (trung bình động).

### Quy trình Box-Jenkins (4 bước)

**Bước 1: Nhận dạng mô hình (Identification)**

- Vẽ biểu đồ chuỗi để kiểm tra trend, seasonality.
- Kiểm tra tính dừng (ADF test, KPSS test).
- Nếu không dừng → lấy sai phân ($d = 1$ hoặc $d = 2$).
- Vẽ ACF và PACF của chuỗi đã sai phân.
- Chọn $p$ từ PACF (cắt ngang sau lag $p$) và $q$ từ ACF (cắt ngang sau lag $q$).

**Bước 2: Ước lượng tham số (Estimation)**

- Dùng MLE hoặc Least Squares.
- Kiểm tra significance của từng tham số (p-value).

**Bước 3: Kiểm định chẩn đoán (Diagnostic Checking)**

- Kiểm tra phần dư $\hat{\varepsilon}_t$ có phải nhiễu trắng không (ACF của residuals).
- Nếu phần dư có cấu trúc → mô hình chưa tốt, cần chọn lại $(p, d, q)$.
- Dùng AIC, BIC để so sánh mô hình.

**Bước 4: Dự báo (Forecasting)**

- Sử dụng mô hình đã chọn để dự báo tương lai.
- Tính khoảng tin cậy cho dự báo.

### Ví dụ ARIMA(1,1,1)

$$(1 - \phi_1 B)(1 - B)Y_t = c + (1 + \theta_1 B)\varepsilon_t$$

Rozwijając: $(1 - \phi_1 B - B + \phi_1 B^2)Y_t = c + (1 + \theta_1 B)\varepsilon_t$

Đặt $W_t = (1 - B)Y_t = Y_t - Y_{t-1}$ (sai phân bậc 1):

$$W_t = \phi_1 W_{t-1} + \varepsilon_t + \theta_1 \varepsilon_{t-1}$$

→ ARMA(1,1) trên chuỗi sai phân $W_t$.

## 4.6 Ước tính tham số

### Phương pháp Mô men (Method of Moments)

Cân bằng mô men mẫu với mô men lý thuyết.

**AR(1):** $\hat{\phi}_1 = r_1$ (hệ số tự tương quan mẫu).

**AR(2):** Dùng hệ phương trình Yule-Walker:

$$r_1 = \phi_1 + \phi_2 r_1$$
$$r_2 = \phi_1 r_1 + \phi_2$$

**MA(1):** $r_1 = \frac{-\theta_1}{1 + \theta_1^2}$ → giải phương trình bậc hai.

**Ước tính phương sai nhiễu trắng:**

$$\hat{\sigma}^2 = \hat{\gamma}_0 \prod_{i=1}^{p}(1 - \hat{G}_i^2)$$

### Phương pháp Bình phương nhỏ nhất (Least Squares)

**AR(1):** Tối ưu hóa:

$$S(\phi_1) = \sum_{t=2}^{n} (Y_t - c - \phi_1 Y_{t-1})^2$$

## 4.7 Mô hình VAR (Vector Autoregression)

Mở rộng AR từ một chuỗi sang **nhiều chuỗi thời gian**.

$$\mathbf{Y}_t = \mathbf{c} + \mathbf{A}_1 \mathbf{Y}_{t-1} + \mathbf{A}_2 \mathbf{Y}_{t-2} + \ldots + \mathbf{A}_p \mathbf{Y}_{t-p} + \boldsymbol{\varepsilon}_t$$

Trong đó $\mathbf{Y}_t = (y_{1,t}, y_{2,t}, \ldots, y_{k,t})^T$.

**Các bước xây dựng:**

1. Kiểm tra tính dừng (dùng differencing nếu cần).
2. Chọn độ trễ $p$.
3. Ước lượng các ma trận $\mathbf{A}_i$.
4. Kiểm tra tính ổn định: eigenvalues của companion matrix phải nằm trong vòng tròn đơn vị.
5. Dự báo.

**Kiểm tra ổn định:** Ma trận đồng hành $\mathbf{A}$:

$$\mathbf{A} = \begin{pmatrix} \mathbf{A}_1 & \mathbf{A}_2 & \cdots & \mathbf{A}_p \\ \mathbf{I}_k & \mathbf{0} & \cdots & \mathbf{0} \\ \vdots & \ddots & \ddots & \vdots \\ \mathbf{0} & \cdots & \mathbf{I}_k & \mathbf{0} \end{pmatrix}$$

VAR(p) ổn định khi $|\lambda_i| < 1$ với mọi eigenvalue $\lambda_i$.

## 4.8 Bộ lọc Kalman

**Bộ lọc Kalman** là thuật toán ước lượng trạng thái động của hệ thống tuyến tính, nhiễu Gaussian.

### Mô hình không gian trạng thái

**Phương trình trạng thái:**

$$x_t = F x_{t-1} B u_t + w_t, \quad w_t \sim \mathcal{N}(0, Q)$$

**Phương trình quan sát:**

$$y_t = H x_t + v_t, \quad v_t \sim \mathcal{N}(0, R)$$

### Thuật toán

**Bước 1 — Dự đoán (Predict):**

$$\hat{x}_{t|t-1} = F \hat{x}_{t-1|t-1} + B u_t$$
$$P_{t|t-1} = F P_{t-1|t-1} F^T + Q$$

**Bước 2 — Cập nhật (Update):**

$$K_t = P_{t|t-1} H^T (H P_{t|t-1} H^T + R)^{-1}$$
$$\hat{x}_{t|t} = \hat{x}_{t|t-1} + K_t (y_t - H \hat{x}_{t|t-1})$$
$$P_{t|t} = (I - K_t H) P_{t|t-1}$$

**Kalman Gain $K_t$:** Quyết định tin vào mô hình nhiều hơn (K nhỏ) hay tin vào đo lường nhiều hơn (K lớn).

### Ví dụ

**Local Level Model:**

$$x_t = x_{t-1} + w_t$$
$$y_t = x_t + v_t$$

→ Tương đương ARIMA(0,1,1).

## 4.9 Mô hình Markov ẩn (HMM)

### Khái niệm

- Chuỗi trạng thái ẩn $z_t$ không quan sát trực tiếp.
- Mỗi trạng thái ẩn sinh ra quan sát $x_t$.
- Quá trình Markov: trạng thái tương lai chỉ phụ thuộc vào trạng thái hiện tại.

### Ba thành phần chính

| Thành phần | Ký hiệu | Ý nghĩa |
|-----------|---------|---------|
| **Ma trận chuyển trạng thái** | $A = [A_{ij}]$ | $A_{ij} = P(z_{t+1}=j \mid z_t=i)$ |
| **Ma trận phát ra** | $B = [B_{ik}]$ | $B_{ik} = P(x_t=o_k \mid z_t=i)$ |
| **Phân phối khởi tạo** | $\pi = (\pi_1, \ldots, \pi_K)$ | $\pi_i = P(z_1=i)$ |

### Ba bài toán kinh điển

| Bài toán | Mục tiêu | Thuật toán |
|---------|----------|-----------|
| **Đánh giá** | Tính $P(x_1, \ldots, x_T)$ | Forward-Backward |
| **Giải mã** | Tìm chuỗi trạng thái ẩn tối ưu $z_1, \ldots, z_T$ | Viterbi |
| **Ước lượng** | Tìm $A, B, \pi$ từ dữ liệu | Baum-Welch (EM) |

### Forward-Backward

**Forward (alpha):**

$$\alpha_t(i) = P(o_1, o_2, \ldots, o_t, z_t=i)$$

- Khởi tạo: $\alpha_1(i) = \pi_i b_{i1}$
- Đệ quy: $\alpha_t(i) = b_{it} \sum_{j=1}^{N} \alpha_{t-1}(j) A_{ji}$
- Kết thúc: $P(O|\theta) = \sum_{i=1}^{N} \alpha_T(i)$

**Backward (beta):**

$$\beta_t(i) = P(o_{t+1}, o_{t+2}, \ldots, o_T | z_t=i)$$

### Viterbi

Thuật toán quy hoạch động tìm chuỗi trạng thái ẩn có xác suất cao nhất.

- Bước 1 — Khởi tạo: $\delta_1(i) = \pi_i B_{i1}$, $\psi_1(i) = 0$
- Bước 2 — Đệ quy: $\delta_t(i) = \max_j [\delta_{t-1}(j) A_{ji}] B_i(o_t)$
- Bước 3 — Kết thúc: $P^* = \max_i \delta_T(i)$
- Bước 4 — Truy vết ngược

### Baum-Welch

Phiên bản EM algorithm cho HMM:

- **E-step:** Tính $\gamma_t(i)$ và $\xi_t(i,j)$ bằng forward-backward.
- **M-step:** Cập nhật $\pi$, $A$, $B$ từ kỳ vọng.

## 4.10 Chuỗi thời gian cấu trúc Bayes (BSTS)

**Bayesian Structural Time Series:** Xây dựng mô hình từ các thành phần có sẵn, sử dụng kỹ thuật Bayes.

**Ba bước chính:**

1. Xác định mô hình cấu trúc và tiên nghiệm.
2. Áp dụng Kalman Filter để cập nhật ước tính.
3. Spike-and-slab để lựa chọn biến.

**Công thức Bayes:**

$$p(\phi, \theta | y_{1:T}) = \frac{p(y_{1:T} | \phi, \theta) \cdot p(\phi, \theta)}{p(y_{1:T})}$$

---

# PHẦN 5: HỌC MÁY & HỌC SÂU

## 5.1 Đặc điểm dữ liệu chuỗi thời gian cho ML

- **Phụ thuộc theo thời gian (temporal dependence):** Giá trị tại $t$ liên quan đến $t-k$.
- **Không i.i.d:** Nhiều thuật toán ML giả định độc lập sẽ không áp dụng trực tiếp.
- **Thứ tự cực kỳ quan trọng:** Shuffle = sai hoàn toàn.

**Giải quyết:** Dùng "window" hoặc mô hình sequence.

## 5.2 Phân loại chuỗi thời gian

### Decision Tree

- Phản ánh cách đưa ra quyết định phức tạp, tuần tự, phi tuyến tính.
- Phù hợp khi dữ liệu đã được trích xuất đặc trưng.

### Random Forest

- Nhiều cây quyết định, kết quả dựa trên trung bình.
- Hữu ích khi làm việc với đặc trưng tóm tắt (không phải dữ liệu thô).
- Giảm thiểu rủi ro quá khớp (overfitting).

### XGBoost (Gradient Boosting)

- Xây dựng các cây theo trình tự, mỗi cây dự đoán phần dư của tổ hợp trước.
- Hàm mất mát bao gồm số hạng phạt cho độ phức tạp mô hình.
- Vượt trội hơn mô hình thống kê truyền thống khi dữ liệu đủ lớn.

## 5.3 Phân cụm chuỗi thời gian

### Độ xoắn thời gian động (DTW)

So sánh hai chuỗi **không đồng tốc**, không thẳng hàng.

**Quy tắc:**

- Mỗi điểm phải khớp với ít nhất một điểm của chuỗi kia.
- Chỉ số đầu và cuối phải khớp với phần tương ứng.
- Thời gian chỉ di chuyển về phía trước.

**Ví dụ:**

- Chuỗi A (nhanh): 1 2 3 4 5
- Chuỗi B (chậm): 1 1.5 2 3 4 5
- Euclid: sai vì không khớp thời gian.
- DTW: bẻ cong trục thời gian để căn thẳng.

### Các thước đo khác

- **Khoảng cách Fréchet:** Bẻ cong thời gian của đường cong.
- **Pearson correlation:** Tương quan giữa hai chuỗi (cùng số điểm).
- **Longest Common Subsequence (LCSS):** Độ dài dãy con chung dài nhất.

## 5.4 Mạng nơ-ron cho chuỗi thời gian

### Feed Forward Network

- Truyền thẳng, song song hóa cao.
- Dùng **window** (cửa sổ) làm đầu vào.
- **Attention Mechanism:** Giúp mạng nhận thức thời gian tốt hơn bằng trọng số chú ý.

### CNN (Convolutional Neural Network)

**Cấu trúc:** Convolution → ReLU → Pooling → Flatten → Output.

- Ít tham số (bộ lọc lặp lại), tính toán nhanh.
- **Tích chập nhân quả (Causal CNN):** Chỉ dùng điểm trước đó (không nhìn tương lai).
- **Dilated CNN:** Giãn nở bộ lọc để nhìn xa hơn về quá khứ.

**Chuyển chuỗi thành hình ảnh:** Dùng biểu đồ hồi quy (recurrence plot) để tạo ảnh 2D từ chuỗi 1D.

### RNN (Recurrent Neural Network)

- Nhìn thấy từng bước thời gian một, theo thứ tự.
- Có trạng thái ẩn (hidden state) bảo toàn từ bước này sang bước khác.
- Tham số giống nhau được áp dụng lặp đi lặp lại.

### LSTM (Long Short-Term Memory)

- Khắc phục RNN nhanh quên quá khứ.
- Thêm **cell state** (bộ nhớ dài hạn) và **3 cổng:**
  - **Forget gate:** Quyết định bỏ thông tin cũ.
  - **Input gate:** Quyết định thêm thông tin mới.
  - **Output gate:** Quyết định đầu ra.

### GRU (Gated Recurrent Unit)

- Phiên bản nhẹ hơn LSTM: giảm từ 3 cổng còn 2.
- Nhanh hơn LSTM, hiệu suất tương đương.
- GRU vượt trội hơn LSTM ở các nhiệm vụ phi ngôn ngữ.

### Autoencoder (Seq2seq)

- Bộ mã hóa tự động gồm hai lớp tuần hoàn.
- Lớp 1 xử lý hoàn toàn chuỗi → trạng thái ẩn = bản tóm tắt.
- Lớp 2 mở rộng bản tóm tắt sang chuỗi đầu ra.

## 5.5 Đánh giá mô hình

### Sai số cho dự báo (Regression)

| Metric | Công thức | Ý nghĩa |
|--------|----------|---------|
| **MAE** | $\frac{1}{n}\sum\|y_t - \hat{y}_t\|$ | Sai số tuyệt đối trung bình |
| **MSE** | $\frac{1}{n}\sum(y_t - \hat{y}_t)^2$ | Nhạy với outlier |
| **RMSE** | $\sqrt{\frac{1}{n}\sum(y_t - \hat{y}_t)^2}$ | Cùng đơn vị với $y$ |
| **MAPE** | $\frac{100\%}{n}\sum\|\frac{y_t - \hat{y}_t}{y_t}\|$ | Phần trăm sai số |
| **MASE** | $\frac{MAE}{MAE_{naive}}$ | So sánh với mô hình ngây thơ |

### Sai số cho phân loại

| Metric | Công thức |
|--------|----------|
| **Accuracy** | $\frac{TP + TN}{TP + TN + FP + FN}$ |
| **Precision** | $\frac{TP}{TP + FP}$ |
| **Recall** | $\frac{TP}{TP + FN}$ |
| **F1** | $2 \cdot \frac{Precision \cdot Recall}{Precision + Recall}$ |

### Lưu ý quan trọng

- **Không được xáo trộn** train/test (no shuffling).
- **Không lookahead:** Dữ liệu tương lai không được dùng trong quá khứ.
- Phân tách train/test theo thời gian.

---

# PHẦN 6: ỨNG DỤNG

## 6.1 Chăm sóc sức khỏe

### Dự báo cúm (Flu Forecasting)

- Dữ liệu có **tính mùa vụ mạnh** (chu kỳ 52 tuần).
- Mô hình: **SARIMA** $(p,d,q)(P,D,Q)_s$.

**SARIMA:**

$$\Phi_P(B^s)\phi_p(B)(1-B)^d(1-B^s)^D y_t = \Theta_Q(B^s)\theta_q(B)\varepsilon_t$$

Trong đó:

- $\phi, \theta$: AR/MA không mùa vụ.
- $\Phi, \Theta$: AR/MA mùa vụ.
- $s$: chu kỳ mùa vụ.

**Hạn chế SARIMA:**

- Dự báo giá trị âm (không thực tế).
- Nhạy với outlier, đánh giá quá cao đỉnh.

**Giải pháp:** Hồi quy Điều hòa Ngoại sinh (Dynamic Harmonic Regression) + Logarit.

### Dự báo đường huyết (Blood Glucose)

- Dữ liệu CGM (Continuous Glucose Monitoring).
- **XGBoost** được chọn → dự báo hợp lý xu hướng BG 30 phút tới.
- Hạn chế: hoạt động kém ở mức đường huyết thấp.

## 6.2 Phát hiện bất thường

**Gói AnomalyDetection của Twitter:**

- Thuật toán: **Seasonal Hybrid ESD** (Extreme Studentized Deviant).
- Mở rộng Generalized ESD để tính đến tính thời vụ.
- Ứng dụng: tìm spikes (bất thường dương) trên lưu lượng web.

## 6.3 Phân tích tài chính

**Đặc điểm dữ liệu tài chính:**

- Khối lượng lớn (terabyte).
- Tính phi ổn định (Non-Stationary).
- Random Walk: giá ngày mai ≈ giá hôm nay.

**Tiền xử lý:**

1. Tạo đại lượng quan tâm: Daily Return, Daily Volatility.
2. Chuẩn hóa bằng EWMA (không lookahead).
3. Định dạng TNC (time × samples × channels) cho RNN.

**Mô hình:** LSTM cho dự đoán lợi nhuận.

## 6.4 Dự báo tự động

### Google Forecasting

Ba bước:

1. **Làm sạch:** Xử lý missing data, outlier, level changes, seasonality.
2. **Tổng hợp:** Dự báo theo tuần, phân rã theo địa lý/loại thiết bị.
3. **Ensemble:** Kết quả từ nhiều mô hình + ước tính độ bất định bằng mô phỏng.

### Facebook Prophet

Mô hình hồi quy cộng tính:

$$y(t) = g(t) + s(t) + h(t) + \varepsilon_t$$

Trong đó:

- $g(t)$: xu hướng tuyến tính từng đoạn hoặc logistic.
- $s(t)$: hiệu ứng thời vụ hàng năm/tuần.
- $h(t)$: danh sách ngày/lễ tùy chỉnh.

**Ưu điểm:** API đơn giản, mã nguồn mở, xử lý tốt dữ liệu hàng ngày.

---

# PHỤ LỤC: CÔNG THỨC QUAN TRỌNG

## Toán tử dịch ngược

$$B^k Y_t = Y_{t-k}$$

## Toán tử sai phân

$$\nabla Y_t = (1 - B) Y_t = Y_t - Y_{t-1}$$

## AR(p)

$$Y_t = c + \sum_{i=1}^{p} \phi_i Y_{t-i} + \varepsilon_t$$

## MA(q)

$$Y_t = c + \varepsilon_t + \sum_{j=1}^{q} \theta_j \varepsilon_{t-j}$$

## ARMA(p,q)

$$\Phi(B) Y_t = c + \Theta(B) \varepsilon_t$$

## ARIMA(p,d,q)

$$\Phi(B)(1 - B)^d Y_t = c + \Theta(B) \varepsilon_t$$

## SARIMA

$$\Phi_P(B^s)\phi_p(B)(1-B)^d(1-B^s)^D y_t = \Theta_Q(B^s)\theta_q(B)\varepsilon_t$$

## VAR(p)

$$\mathbf{Y}_t = \mathbf{c} + \sum_{i=1}^{p} \mathbf{A}_i \mathbf{Y}_{t-i} + \boldsymbol{\varepsilon}_t$$

## Kalman Filter

$$\hat{x}_{t|t-1} = F \hat{x}_{t-1|t-1} + B u_t$$
$$K_t = P_{t|t-1} H^T (H P_{t|t-1} H^T + R)^{-1}$$
$$\hat{x}_{t|t} = \hat{x}_{t|t-1} + K_t (y_t - H \hat{x}_{t|t-1})$$

## ACF

$$\rho(k) = \frac{\gamma(t, t-k)}{\gamma(t, t)}$$

## Box-Cox

$$g(x) = \begin{cases} \frac{x^\lambda - 1}{\lambda} & \lambda \neq 0 \\ \ln(x) & \lambda = 0 \end{cases}$$

## DFT

$$X(\omega_k) = \sum_{t=0}^{T-1} x_t e^{-i\omega_k t}, \quad \omega_k = \frac{2\pi k}{T}$$

## PSD

$$S(\omega_k) = \frac{1}{T} |X(\omega_k)|^2$$

## DTW

Cho hai chuỗi $A = (a_1, \ldots, a_m)$ và $B = (b_1, \ldots, b_n)$:

$$DTW(A, B) = \min \sum_{(i,j) \in \text{path}} d(a_i, b_j)$$

với path thỏa mãn: monotonicity, continuity, boundary conditions.
