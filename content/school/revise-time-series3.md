---
title: Y4T2-Time Series revise - Chương 5: Học máy và Học sâu
keywords: [school, time-series, revise, chuong-5, machine-learning, deep-learning]
date: 2026-05-16
theme: time-series
description: Year 4 Term 2 - Time Series Chapter 5: Machine Learning and Deep Learning
---

# PHẦN 5: HỌC MÁY VÀ HỌC SÂU CHO CHUỖI THỜI GIAN

---

## MỤC LỤC

1. [Giới thiệu](#51-giới-thiệu)
2. [Phân loại với dữ liệu chuỗi thời gian](#52-phân-loại-với-dữ-liệu-chuỗi-thời-gian)
3. [Phân cụm với dữ liệu chuỗi thời gian](#53-phân-cụm-với-dữ-liệu-chuỗi-thời-gian)
4. [Mạng nơ-ron](#54-mạng-nơ-ron)
5. [Mạng nơ-ron tích chập (CNN)](#55-mạng-nơ-ron-tích-chập-cnn)
6. [Mạng nơ-ron hồi quy (RNN)](#56-mạng-nơ-ron-hồi-quy-rnn)
7. [Các chỉ số đánh giá](#57-các-chỉ-số-đánh-giá)

---

# PHẦN 5: HỌC MÁY VÀ HỌC SÂU CHO CHUỖI THỜI GIAN

---

## 5.1 Giới thiệu

### 5.1.1 Từ mô hình thống kê sang học máy

Trong các chương trước, chúng ta đã xây dựng lý thuyết cơ bản về động lực chuỗi thời gian và sử dụng các giả định về quá trình để đưa ra dự đoán. Bây giờ, chúng ta chuyển sang các phương pháp không đặt ra quy trình cơ bản cố định, mà tập trung vào việc xác định mô hình mô tả hành vi của quá trình.

### 5.1.2 Điểm khác biệt của chuỗi thời gian

| Đặc điểm | Mô tả |
|----------|-------|
| **Phụ thuộc theo thời gian** | Giá trị tại t liên quan trực tiếp tới t-k |
| **Không i.i.d** | Nhiều thuật toán ML giả định độc lập sẽ không áp dụng trực tiếp |
| **Trật tự quan trọng** | Shuffle dữ liệu = sai hoàn toàn |

### 5.1.3 Thách thức khi áp dụng ML cho time series

- **Sự phụ thuộc mô hình**: Dùng các "window" hoặc mô hình sequence
- **Dự đoán**: Một bước hoặc nhiều bước
- **Đặc trưng mang đặc thù thời gian**

---

## 5.2 Phân loại với dữ liệu chuỗi thời gian

### 5.2.1 Cây Quyết định (Decision Tree)

**Nguyên lý**: Phản ánh cách con người đưa ra quyết định phức tạp - từng bước một, theo cách phi tuyến tính cao.

**Ví dụ ứng dụng**:
- Nhà giao dịch chứng khoán sử dụng các chỉ báo kỹ thuật theo kiểu phân cấp: đầu tiên xem động lượng, sau đó kiểm tra mức biến động
- Bác sĩ đọc EEG hoặc ECG: tìm đặc điểm trước, sau đó xem xét các đặc điểm khác

### 5.2.2 Rừng ngẫu nhiên (Random Forest)

**Định nghĩa**: Sử dụng nhiều cây quyết định, kết quả cuối cùng dựa trên trung bình các kết quả.

**Đặc điểm**:
- Số lượng cây và độ sâu tối đa là các tham số quan trọng
- Mỗi cây sử dụng mẫu ngẫu nhiên của dữ liệu và đặc trưng
- Các cây thường được tham số hóa đơn giản để tránh overfitting

**Hạn chế với time series**:
- Không phải công cụ tốt cho dữ liệu thô
- Hữu ích khi nén dữ liệu thành đặc trưng tóm tắt
- Hiệu quả hơn cho phân loại so với dự báo

### 5.2.3 Cây tăng cường gradient (Gradient Boosting)

**Nguyên lý**: Tạo các mô hình tuần tự, mô hình sau sửa lỗi của mô hình trước.

**XGBoost hoạt động như thế nào**:

1. **Cây đầu tiên**: Khớp trực tiếp dữ liệu (phân loại hoặc giá trị số)
2. **Cây thứ hai**: Dự đoán phần dư của tổ hợp cây trước đó
3. **Cây thứ ba**: Dự đoán phần dư còn lại

**Đặc điểm quan trọng**:
- XGBoost giảm thiểu hàm mất mát kết hợp số hạng phạt độ phức tạp
- Số hạng phạt giới hạn số lượng cây được tạo
- Có thể trực tiếp giới hạn số cây

**Ưu điểm**:
- Thường vượt trội hơn mô hình thống kê với dữ liệu đủ lớn
- Tự động loại bỏ đặc điểm không liên quan
- Tập trung vào đặc điểm quan trọng nhất

---

## 5.3 Phân cụm với dữ liệu chuỗi thời gian

### 5.3.1 Ứng dụng của phân cụm

- **Phân loại**: Xác định số lượng cụm, thiết lập các loại chuỗi thời gian
- **Dự báo**: Phân cụm thuần túy hoặc dựa trên khoảng cách

### 5.3.2 Các phương pháp phân cụm

**Cách 1: Sử dụng lớp thành viên**
- Xác định cụm dựa trên N bước đầu tiên
- Suy ra hành vi tương lai dựa trên thành viên cụm
- Tránh lookahead bằng cách chỉ phân cụm dựa trên quá khứ

**Cách 2: Dự đoán dựa trên láng giềng gần nhất**
- Tìm láng giềng gần nhất dựa trên N bước đầu tiên
- Tính trung bình hành vi tại bước N+h của các láng giềng
- Sử dụng khoảng cách phù hợp

### 5.3.3 Các chỉ số khoảng cách

#### a) Độ xoắn thời gian động (Dynamic Time Warping - DTW)

**Quy tắc DTW**:
1. Mỗi điểm phải được khớp với ít nhất một điểm của chuỗi khác
2. Chỉ số đầu và cuối phải được khớp với các phần tương ứng
3. Ánh xạ phải sao cho thời gian di chuyển về phía trước

**Ví dụ**:
```
Chuỗi A (đi nhanh): 1 2 3 4 5
Chuỗi B (đi chậm):  1 1.5 2 3 4 5

- Khoảng cách Euclid: Các điểm không khớp thời gian → lớn và sai
- DTW: Bẻ cong trục thời gian để căn thẳng hai chuỗi
```

**Khi nào dùng DTW**:
- Hai chuỗi không đồng tốc
- Không thẳng hàng
- Có tốc độ thay đổi khác nhau

#### b) Khoảng cách Fréchet

Bẻ cong thời gian của các đường cong để giảm thiểu khoảng cách giữa hai đường cong.

#### c) Hệ số tương quan Pearson

- Đo tương quan giữa hai chuỗi
- Yêu cầu cùng số điểm dữ liệu
- Tương đối dễ tính toán

#### d) Dãy con chung dài nhất (LCS)

- Xác định độ dài dãy các giá trị liên tiếp giống hệt nhau
- Vị trí chính xác không bắt buộc phải khớp

---

## 5.4 Mạng nơ-ron

### 5.4.1 Học sâu cho chuỗi thời gian

**Ưu điểm**:
- Rất linh hoạt, mô hình hóa hành vi phi tuyến tính phức tạp
- Không yêu cầu tính dừng
- Xử lý dữ liệu không đồng nhất tốt

**Lưu ý**: Học sâu không thực hiện tốt với trend trừ khi được điều chỉnh phù hợp.

### 5.4.2 Mạng nơ-ron nhân tạo - Cấu trúc cơ bản

```
Đầu vào → Tổng có trọng số → Hàm kích hoạt → Đầu ra
   x          Σ(w·x) + b           f(Σ)            ŷ
```

**Các thành phần chính**:
- **Nơ-ron**: Thiết bị tính toán đơn giản
- **Liên kết**: Truyền tín hiệu với trọng số
- **Hàm kích hoạt**: ReLU, Sigmoid, Tanh, Softmax

### 5.4.3 Mạng chuyển tiếp (Feed Forward Networks)

**Đặc điểm**:
- Khả năng song song hóa cao, tính toán nhanh
- Là phép thử tốt để xác định động lực thời gian phức tạp
- Thường được tích hợp vào kiến trúc học sâu phức tạp hơn

### 5.4.4 Cơ chế Attention

**Ý tưởng**: Cung cấp cơ chế để mô hình học thông tin nào quan trọng vào thời điểm nào.

**Cách hoạt động**:
- Trọng số attention phù hợp với từng bước thời gian
- Mô hình học cách kết hợp thông tin từ các bước khác nhau
- Giúp mạng truyền thẳng nhận thức thời gian tốt hơn

---

## 5.5 Mạng nơ-ron tích chập (CNN)

### 5.5.1 Tại sao CNN không phù hợp trực tiếp với time series

- Đặc điểm chính của tích chập: Tất cả các không gian được xử lý như nhau
- Đúng với hình ảnh, nhưng không đúng với chuỗi thời gian
- Một số điểm thời gian nhất định phải gần nhau hơn những điểm khác

### 5.5.2 Cấu trúc CNN

| Lớp | Chức năng |
|-----|-----------|
| **Convolution** | Áp dụng hạt nhân (kernel) trượt qua dữ liệu |
| **ReLU** | Hàm kích hoạt phi tuyến |
| **Pooling** | Giảm kích thước, lấy max/mean |
| **Flatten** | Làm phẳng dữ liệu cho lớp fully connected |
| **Output** | Bộ phân loại (thường dùng softmax) |

### 5.5.3 Tích chập nhân quả (Causal Convolution)

**Phần nhân quả**: Chỉ những điểm trước đó mới đi vào bộ lọc tích chập.

**Phần giãn nở (Dilation)**: Bỏ qua một số điểm trong quá trình sắp xếp bộ lọc, cho phép mô hình nhìn xa hơn trong quá khứ.

**Lợi ích**:
- Tính thưa thớt, giảm tích chập dư thừa
- Nhìn xa hơn về quá khứ
- Tính toán vẫn hợp lý

### 5.5.4 Chuyển đổi chuỗi thời gian thành hình ảnh

**Biểu đồ hồi quy (Recurrence Plot)**:
- Mô tả trong không gian pha-trạng thái
- R(i,j) = 1 nếu f(i) – f(j) đủ nhỏ, ngược lại = 0
- Tạo ảnh nhị phân đen trắng
- i và j tham chiếu đến các giá trị thời gian

---

## 5.6 Mạng nơ-ron hồi quy (RNN)

### 5.6.1 Đặc điểm của RNN

| Đặc điểm | Mô tả |
|----------|-------|
| **Xử lý tuần tự** | Nhìn thấy từng bước thời gian một, theo thứ tự |
| **Trạng thái ẩn** | Duy trì trạng thái từ bước này sang bước khác |
| **Tham số chung** | Cùng tham số được áp dụng lặp đi lặp lại |

### 5.6.2 Long Short-Term Memory (LSTM)

**Mục đích**: Khắc phục RNN nhanh quên quá khứ.

**Cấu trúc**:
- **Cell state (bộ nhớ dài hạn)**: Lưu trữ thông tin quan trọng
- **3 cổng**:
  - Forget gate: Quyết định bỏ thông tin nào
  - Input gate: Quyết định thông tin mới nào được thêm
  - Output gate: Quyết định đầu ra tại bước hiện tại

### 5.6.3 Gated Recurrent Unit (GRU)

**So sánh LSTM vs GRU**:

| Đặc điểm | LSTM | GRU |
|----------|------|-----|
| Số cổng | 3 | 2 |
| Số tham số | Nhiều hơn | Ít hơn |
| Tốc độ huấn luyện | Chậm hơn | Nhanh hơn |
| Hiệu suất | Thường tốt hơn | Có thể vượt LSTM |

**GRU đặc biệt vượt trội với các nhiệm vụ phi ngôn ngữ.**

### 5.6.4 Autoencoder (Seq2Seq)

**Cấu trúc**:
- Lớp encoder: Xử lý hoàn toàn chuỗi, tạo trạng thái ẩn tóm tắt
- Lớp decoder: Sử dụng trạng thái ẩn và đầu ra của chính nó để tạo chuỗi mới

**Ứng dụng**: Dự đoán chuỗi thời gian đơn biến hoặc đa biến.

---

## 5.7 Các chỉ số đánh giá

### 5.7.1 Vấn đề đánh giá trong time series

**4 vấn đề lớn cần tránh**:

| Vấn đề | Giải thích |
|--------|------------|
| **No shuffling** | Không xáo trộn train/test - tránh nhìn thấy tương lai |
| **Phụ thuộc** | Lỗi không độc lập do autocorrelation |
| **Trend/Seasonality** | Đánh giá theo nhiều horizon |
| **Data drift** | Đánh giá theo windows, không phải một lần |

### 5.7.2 Sai số cho dự báo (Forecasting)

#### a) Mean Absolute Error (MAE)

$$\text{MAE} = \frac{1}{n}\sum_{t=1}^{n}|y_t - \hat{y}_t|$$

#### b) Mean Squared Error (MSE)

$$\text{MSE} = \frac{1}{n}\sum_{t=1}^{n}(y_t - \hat{y}_t)^2$$

#### c) Root Mean Squared Error (RMSE)

$$\text{RMSE} = \sqrt{\text{MSE}}$$

#### d) Mean Absolute Percentage Error (MAPE)

$$\text{MAPE} = \frac{1}{n}\sum_{t=1}^{n}\left|\frac{y_t - \hat{y}_t}{y_t}\right| \times 100$$

### 5.7.3 Sai số cho phân loại

#### Confusion Matrix

|  | Thực tế Positive | Thực tế Negative |
|--|-----------------|-----------------|
| **Dự đoán Positive** | TP | FP |
| **Dự đoán Negative** | FN | TN |

**Ký hiệu**:
- **TP (True Positive)**: Dự đoán Positive, thực tế đúng
- **TN (True Negative)**: Dự đoán Negative, thực tế đúng
- **FP (False Positive)**: Dự đoán nhầm dương tính (lỗi loại I)
- **FN (False Negative)**: Dự đoán nhầm âm tính (lỗi loại II)

#### Các chỉ số phái sinh

**Accuracy** (Độ chính xác):
$$\text{Accuracy} = \frac{TP + TN}{TP + TN + FP + FN}$$

**Precision** (Độ chính xác dương):
$$\text{Precision} = \frac{TP}{TP + FP}$$

**Recall** (Độ phủ):
$$\text{Recall} = \frac{TP}{TP + FN}$$

**F1-Score**:
$$\text{F1} = 2 \times \frac{\text{Precision} \times \text{Recall}}{\text{Precision} + \text{Recall}}$$

---

## BÀI TẬP

### 5.1 Bài tập phân loại chuỗi thời gian

**Bài 1**: Tại sao Random Forest không phải công cụ tốt cho dữ liệu chuỗi thời gian thô? Khi nào thì nó vẫn hữu ích?

**Bài 2**: Giải thích cách XGBoost xây dựng các cây tuần tự để sửa lỗi của các cây trước đó.

**Bài 3**: So sánh Decision Tree và Random Forest. Tại sao Random Forest giảm overfitting?

### 5.2 Bài tập phân cụm

**Bài 4**: Cho hai chuỗi:
- A: [1, 2, 3, 4, 5]
- B: [1, 1.5, 2, 3, 4, 5]

a) Tính khoảng cách Euclid giữa A và B (so sánh từng phần tử cùng vị trí)
b) Giải thích tại sao DTW sẽ cho kết quả tốt hơn trong trường hợp này

**Bài 5**: Liệt kê và mô tả ngắn gọn 4 chỉ số khoảng cách dùng trong phân cụm chuỗi thời gian.

**Bài 6**: Giải thích tại sao phân cụm chuỗi thời gian cần tránh lookahead. Cho ví dụ.

### 5.3 Bài tập mạng nơ-ron

**Bài 7**: Vẽ sơ đồ cấu trúc cơ bản của một nơ-ron nhân tạo với các thành phần: đầu vào, trọng số, hàm tổng, hàm kích hoạt, đầu ra.

**Bài 8**: Giải thích sự khác biệt giữa:
a) Feed Forward Network và RNN
b) LSTM và GRU
c) CNN và RNN

**Bài 9**: Tại sao RNN truyền thống bị "quên" quá khứ? LSTM giải quyết vấn đề này bằng cách nào?

**Bài 10**: Giải thích cơ chế Attention trong mạng nơ-ron. Nó giúp gì cho việc xử lý chuỗi thời gian?

### 5.4 Bài tập CNN

**Bài 11**: Tại sao tích chập truyền thống không phù hợp trực tiếp với chuỗi thời gian?

**Bài 12**: Giải thích các thành phần trong kiến trúc CNN: Convolution, ReLU, Pooling, Flatten, Output.

**Bài 13**: Tích chập nhân quả (causal convolution) khác với tích chập thông thường ở điểm nào?

### 5.5 Bài tập đánh giá

**Bài 14**: Cho kết quả dự đoán và thực tế:
```
Thực tế:   1 1 0 1 0 1 0 0 1 0
Dự đoán:   1 0 0 1 1 1 0 0 0 0
```

Tính: TP, TN, FP, FN, Accuracy, Precision, Recall, F1-Score

**Bài 15**: Giải thích 4 vấn đề lớn khi đánh giá mô hình time series.

**Bài 16**: Tại sao không được xáo trộn dữ liệu khi chia train/test cho time series?

**Bài 17**: So sánh MAE, MSE, RMSE và MAPE. Khi nào dùng cái nào?

**Bài 18**: Cho dữ liệu dự báo: [102, 98, 105, 110, 95] và thực tế: [100, 100, 100, 100, 100]
Tính MAE và RMSE.

---

## LỜI GIẢI

### Bài 1:

**Tại sao RF không tốt cho time series thô**:
- RF giả định các quan sát độc lập (i.i.d)
- Time series có autocorrelation - quan sát phụ thuộc theo thời gian
- Shuffle dữ liệu phá vỡ cấu trúc thời gian

**Khi nào RF vẫn hữu ích**:
- Khi dữ liệu đã được nén thành đặc trưng tóm tắt
- Cho phân loại (classification) tốt hơn dự báo
- Giảm overfitting nhờ trung bình nhiều cây

### Bài 2:

**Cách XGBoost xây dựng cây tuần tự**:

1. **Cây đầu tiên**: Khớp trực tiếp với dữ liệu gốc
2. **Cây thứ hai**: Dự đoán phần dư (sai số) của cây 1
   - target_2 = y_true - y_pred_1
3. **Cây thứ ba**: Dự đoán phần dư của tổng cây 1 và 2
   - target_3 = y_true - (y_pred_1 + y_pred_2)
4. Tiếp tục cho đến khi đạt số cây giới hạn hoặc không cải thiện

**Công thức tổng quát**:
$$F_m(x) = F_{m-1}(x) + \eta \cdot h_m(x)$$

Trong đó $h_m(x)$ là cây thứ m và $\eta$ là learning rate.

### Bài 3:

| Đặc điểm | Decision Tree | Random Forest |
|----------|--------------|---------------|
| Số cây | 1 | Nhiều |
| Overfitting | Dễ overfit | Giảm overfitting |
| Phương pháp | Toàn bộ dữ liệu | Bootstrap + feature randomness |
| Kết quả | Một cây duy nhất | Trung bình/bầu phiếu |

**Tại sao RF giảm overfitting**:
- Mỗi cây chỉ thấy một phần dữ liệu (bootstrap)
- Mỗi cây chỉ thấy một phần đặc trưng (feature randomness)
- Trung bình nhiều cây giảm variance
- Không có cây nào đặc biệt tốt nhưng tất cả đều đủ tổng quát

### Bài 4:

**a) Khoảng cách Euclid**:
Vấn đề: A có 5 điểm, B có 6 điểm → không so sánh được trực tiếp

**b) DTW tốt hơn vì**:
- DTW cho phép "bẻ cong" trục thời gian
- A[2] = 2 có thể khớp với B[2] = 1.5 hoặc B[3] = 2
- A[3] = 3 có thể khớp với B[3] = 2 hoặc B[4] = 3
- Kết quả: Hai chuỗi "cùng dạng" nhưng tốc độ khác nhau

### Bài 5:

| Chỉ số | Mô tả |
|--------|-------|
| **DTW** | Đo khoảng cách với "xoắn" thời gian, so khớp điểm không cùng thời điểm |
| **Fréchet** | Bẻ cong đường cong để giảm thiểu khoảng cách |
| **Pearson** | Hệ số tương quan tuyến tính, yêu cầu cùng độ dài |
| **LCS** | Độ dài dãy con chung dài nhất, không cần vị trí khớp |

### Bài 6:

**Tại sao tránh lookahead**:
- Phân cụm dựa trên toàn bộ chuỗi sẽ sử dụng thông tin tương lai
- Trong thực tế, khi dự báo, ta chỉ có quá khứ
- Điều này gây data leakage → đánh giá quá lạc quan

**Ví dụ**:
- Sai: Phân cụm cả 100 bước rồi dự báo bước 50
- Đúng: Phân cụm chỉ 50 bước đầu, rồi dự báo bước 51-100

### Bài 7:

```
     x₁ ──┐
     x₂ ──┼──→ Σ ──→ f(Σ) ──→ ŷ
     x₃ ──┘   ↑
             w₁·x₁ + w₂·x₂ + w₃·x₃ + b
```

### Bài 8:

**a) FFN vs RNN**:
- FFN: Xử lý đầu vào độc lập, không có trạng thái
- RNN: Xử lý tuần tự, có trạng thái ẩn được truyền

**b) LSTM vs GRU**:
- LSTM: 3 cổng (forget, input, output), nhiều tham số
- GRU: 2 cổng (update, reset), ít tham số hơn, huấn luyện nhanh hơn

**c) CNN vs RNN**:
- CNN: Xử lý song song, dùng bộ lọc trượt
- RNN: Xử lý tuần tự, có trạng thái

### Bài 9:

**RNN quên quá khứ**:
- Gradient có thể triệt tiêu (vanishing gradient) khi truyền ngược
- Thông tin từ bước xa bị mất

**LSTM giải quyết bằng**:
- Cell state: Đường truyền thẳng cho thông tin dài hạn
- Các cổng kiểm soát: Thông tin nào giữ, thêm, xuất

### Bài 10:

**Cơ chế Attention**:
- Gán trọng số cho từng bước thời gian
- Mô hình tự học điểm nào quan trọng
- Kết hợp thông tin từ các bước có trọng số cao
- Giúp mạng FFN "nhìn" được thời gian

### Bài 11:

**Vấn đề với tích chập truyền thống**:
- Convolution xử lý tất cả các điểm như nhau
- Không có khái niệm "thứ tự thời gian"
- Điểm thời gian xa và gần được đối xử bình đẳng

### Bài 12:

| Lớp | Chức năng |
|-----|-----------|
| **Convolution** | Áp kernel trượt qua, tạo feature map |
| **ReLU** | max(0, x) - loại bỏ giá trị âm |
| **Pooling** | Giảm kích thước (max/mean) |
| **Flatten** | Làm phẳng thành vector |
| **Output** | Softmax cho phân loại |

### Bài 13:

**Tích chập nhân quả**:
- Chỉ sử dụng các điểm từ quá khứ
- Đảm bảo tính nhân quả: output tại t chỉ phụ thuộc vào input tại t, t-1, t-2,...

**Giãn nở (Dilation)**:
- Bỏ qua một số điểm khi trượt kernel
- Nhìn xa hơn trong quá khứ với ít tham số hơn

### Bài 14:

```
Thực tế:   1 1 0 1 0 1 0 0 1 0
Dự đoán:   1 0 0 1 1 1 0 0 0 0
```

**Đếm**:
- TP = 3 (vị trí 1, 4, 6)
- TN = 4 (vị trí 3, 7, 8, 10)
- FP = 1 (vị trí 5)
- FN = 2 (vị trí 2, 9)

**Tính**:
- Accuracy = (3 + 4) / 10 = 0.7
- Precision = 3 / (3 + 1) = 0.75
- Recall = 3 / (3 + 2) = 0.6
- F1 = 2 × (0.75 × 0.6) / (0.75 + 0.6) = 0.667

### Bài 15:

| Vấn đề | Giải thích |
|--------|------------|
| **No shuffling** | Time series có trật tự, shuffle = nhìn tương lai |
| **Phụ thuộc** | Autocorrelation khiến lỗi không độc lập |
| **Trend/Seasonality** | Dự báo 1 bước vs 10 bước rất khác nhau |
| **Data drift** | Phân phối thay đổi theo thời gian |

### Bài 16:

**Tại sao không shuffle**:
- Time series: $y_t$ phụ thuộc vào $y_{t-1}, y_{t-2}, ...$
- Shuffle: Mô hình thấy $y_{t+1}$ trước $y_t$
- Khi đó: Mô hình học "gian lận" bằng cách nhìn tương lai
- Kết quả: Đánh giá hoàn toàn sai

### Bài 17:

| Metric | Ưu điểm | Nhược điểm | Khi dùng |
|--------|---------|------------|----------|
| **MAE** | Đơn giản, unit gốc | Không phạt lỗi lớn | Khi không muốn phạt mạnh |
| **MSE** | Phạt lỗi lớn nhiều | Nhạy cảm outlier | Khi lỗi lớn quan trọng |
| **RMSE** | Cùng unit với gốc | Nhạy cảm outlier | Dễ diễn giải |
| **MAPE** | Tỷ lệ %, không phụ thuộc scale | Chia cho 0 nếu có 0 | So sánh chuỗi khác scale |

### Bài 18:

**Dữ liệu**:
- Dự đoán: [102, 98, 105, 110, 95]
- Thực tế: [100, 100, 100, 100, 100]

**Lỗi**: [2, -2, 5, 10, -5]

**MAE**:
$$\text{MAE} = (|2| + |-2| + |5| + |10| + |-5|) / 5 = 24 / 5 = 4.8$$

**RMSE**:
$$\text{RMSE} = \sqrt{(4 + 4 + 25 + 100 + 25) / 5} = \sqrt{158 / 5} = \sqrt{31.6} \approx 5.62$$

---

## BẢNG TỔNG HỢP SO SÁNH

### So sánh các kiến trúc mạng

| Kiến trúc | Xử lý | Trạng thái | Ứng dụng |
|-----------|-------|------------|----------|
| **FFN** | Song song | Không có | Baseline, feature extraction |
| **CNN** | Song song | Có thể có (dilated) | Pattern cục bộ |
| **RNN** | Tuần tự | Có | Sequential dependency |
| **LSTM** | Tuần tự | Dài hạn | Long-term dependency |
| **GRU** | Tuần tự | Dài hạn (đơn giản hơn) | Khi cần nhanh |

### So sánh các phương pháp ML

| Phương pháp | Ưu điểm | Hạn chế |
|-------------|---------|---------|
| **Decision Tree** | Dễ hiểu, nhanh | Overfitting |
| **Random Forest** | Giảm overfitting | Chậm với nhiều cây |
| **XGBoost** | Hiệu suất cao | Cần tuning |
| **DTW** | So khớp không đồng tốc | Tính toán lớn |

---

*Tài liệu được tổng hợp từ Slide Chương 5: Học máy và Học sâu*
*Giảng viên: Đỗ Tiến Dũng*