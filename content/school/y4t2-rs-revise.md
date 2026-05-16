---
title: Y4T2-Recommender System Ôn tập chi tiết
keywords: [recommender-system, revise, exam]
date: 2026-05-16
theme: recommender-system
description:
  Ôn tập hệ gợi ý - giải chi tiết đề cương
---

# Ôn tập Hệ gợi ý (Recommender System)

**Hình thức:** Tự luận - **Thời gian:** 90ph

## Phần 1: Lý thuyết

### Chương 1: Giới thiệu về Hệ gợi ý

**Câu 1. Hệ gợi ý (Recommender System) là gì? Nêu mục đích và tiêu chí thành công của hệ gợi ý.**

**Hệ gợi ý** là các tác nhân phần mềm (software agents) khai thác sở thích và ưu tiên của từng người tiêu dùng cá nhân và đưa ra các gợi ý tương ứng. Hệ gợi ý có tiềm năng hỗ trợ và cải thiện chất lượng quyết định của người tiêu dùng khi tìm kiếm và lựa chọn sản phẩm trực tuyến.

**Mục đích:**

- **Giảm vấn đề quá tải dữ liệu (data overload):** Hỗ trợ người dùng ra quyết định nhanh hơn.
- **Trợ giúp bán hàng (guidance, advisory, persuasion):** Định hướng người dùng đến các sản phẩm phù hợp.

**Tiêu chí thành công (3 khía cạnh):**

| Khía cạnh | Mô tả |
|-----------|-------|
| **Dự đoán (Prediction)** | Dự đoán chính xác mức độ người dùng ưa thích sản phẩm. Đây là kịch bản đánh giá phổ biến trong nghiên cứu. |
| **Tương tác (Interaction)** | Tạo cảm giác tốt cho người dùng, định hướng/giáo dục người dùng về domain, thuyết phục và diễn giải. |
| **Chuyển đổi (Conversion)** | Tăng tỉ lệ "hit", "clickthrough", "lookers to bookers", tối ưu lợi nhuận kinh doanh. |

**Câu 2. Phân biệt gợi ý cá nhân hóa (personalized) và gợi ý không cá nhân hóa (non-personalized).**

| Tiêu chí | Personalized | Non-personalized |
|----------|-------------|------------------|
| **Cách hoạt động** | Dựa trên sở thích và hành vi riêng của từng user | Dựa trên đánh giá chung của tất cả users (VD: top-seller, most popular) |
| **Kết quả** | Mỗi user nhận danh sách gợi ý khác nhau | Mọi user nhận cùng danh sách gợi ý |
| **Ví dụ** | "Users like you also bought..." | "Top 10 sản phẩm bán chạy nhất" |
| **Hiệu quả** | Cao hơn, tăng engagement | Đơn giản, dễ triển khai |

**Câu 3. Trình bày các phương pháp gợi ý cơ bản. So sánh ưu nhược điểm.**

| Phương pháp | Nguyên lý | Ưu điểm | Nhược điểm |
|------------|-----------|---------|------------|
| **Lọc cộng tác (CF)** | "Tell me what's popular among my peers" — dựa trên hành vi của những người dùng tương tự | Không cần thông tin về item, có thể gợi ý bất ngờ | Cold-start, thưa dữ liệu |
| **Dựa trên nội dung (CB)** | "Show me more of the same what I've liked" — dựa trên đặc trưng nội dung của item | Không phụ thuộc vào cộng đồng, dễ giải thích | Overspecialization, cần đặc trưng item |
| **Dựa trên tri thức (KB)** | "Tell me what fits based on my needs" — dựa trên ràng buộc và yêu cầu của user | Không cần rating history, xử lý được sản phẩm ít đánh giá | Chi phí tích lũy tri thức cao |
| **Dựa trên phiên (Session)** | Dựa trên tương tác trong phiên hiện tại | Không cần định danh user, bắt được sở thích ngắn hạn | Không có thông tin dài hạn |
| **Lai ghép (Hybrid)** | Kết hợp nhiều kỹ thuật để tận dụng ưu điểm từng phương pháp | Khắc phục hạn chế của từng phương pháp riêng | Phức tạp hơn trong thiết kế và triển khai |

### Chương 2: Gợi ý dựa trên lọc cộng tác cơ bản

**Câu 4. Trình bày ý tưởng của lọc cộng tác (Collaborative Filtering).**

**Ý tưởng:** Dựa trên "wisdom of the crowd" — sử dụng đánh giá của cộng đồng để gợi ý.

- **Giả thiết:** Users có sở thích tương tự nhau trong quá khứ sẽ có sở thích tương tự trong tương lai.
- **Input:** Ma trận đánh giá user-item (ratings matrix).
- **Output:** Dự đoán số (mức độ user thích item) hoặc danh sách top-N items.

**Hai tiếp cận chính:**

1. **Dựa trên bộ nhớ (Memory-based):** Sử dụng trực tiếp ma trận ratings để tìm láng giềng.
   - User-User CF: Tìm users tương tự với user đang xét.
   - Item-Item CF: Tìm items tương tự với item đang xét.
2. **Dựa trên mô hình (Model-based):** Xây dựng và huấn luyện mô hình trước (VD: Matrix Factorization).

**Câu 5. Trình bày công thức tính độ tương đồng Pearson và Cosine. So sánh hai độ đo.**

**Pearson correlation:**
$$ \text{sim}(a, b) = \frac{\sum_{p \in P} (r_{a,p} - \bar{r}_a)(r_{b,p} - \bar{r}_b)}{\sqrt{\sum_{p \in P} (r_{a,p} - \bar{r}_a)^2} \sqrt{\sum_{p \in P} (r_{b,p} - \bar{r}_b)^2}} $$

Trong đó $P$ là tập các items mà cả a và b cùng đánh giá.

**Cosine similarity:**
$$ \text{cos}(\mathbf{x}, \mathbf{y}) = \frac{\mathbf{x} \cdot \mathbf{y}}{\|\mathbf{x}\| \|\mathbf{y}\|} = \frac{\sum_{i=1}^n x_i y_i}{\sqrt{\sum_{i=1}^n x_i^2} \sqrt{\sum_{i=1}^n y_i^2}} $$

**So sánh:**

| Tiêu chí | Pearson | Cosine |
|----------|---------|--------|
| Chuẩn hóa | Có (trừ mean — loại bỏ bias của user) | Không (dùng raw rating) |
| Ý nghĩa | Tương quan tuyến tính giữa 2 users | Góc giữa 2 vector rating |
| Ưu điểm | Khắc phục chênh lệch thang đánh giá | Đơn giản, nhanh |
| Nhược điểm | Phức tạp hơn | Nhạy với bias của user |

**Câu 6. Trình bày hàm dự đoán rating trong User-based CF.**

$$ \text{pred}(a, p) = \bar{r}_a + \frac{\sum_{b \in N} \text{sim}(a, b) \cdot (r_{b,p} - \bar{r}_b)}{\sum_{b \in N} \text{sim}(a, b)} $$

Trong đó:
- $\bar{r}_a$: rating trung bình của user a
- $N$: tập láng giềng của user a
- $\text{sim}(a, b)$: độ tương đồng giữa a và b
- $r_{b,p}$: rating của user b cho item p

**Ý nghĩa:** Tính độ lệch của mỗi láng giềng so với trung bình của họ, kết hợp với trọng số tương đồng, rồi cộng vào trung bình của user a.

**Câu 7. Trình bày các vấn đề của lọc cộng tác và giải pháp.**

| Vấn đề | Mô tả | Giải pháp |
|--------|-------|-----------|
| **Cold-start** | User mới/item mới không có rating → không thể tính tương đồng | Ép user đánh giá, dùng content-based hoặc non-personalized, gán giá trị mặc định |
| **Dữ liệu thưa (Sparsity)** | Ma trận ratings rất thưa → ít items chung → độ tương đồng kém chất lượng | Giả thiết bắc cầu (graph-based), default voting, thuật toán đặc thù |
| **Scalability** | Với hệ thống lớn, việc tính toán tương đồng giữa tất cả cặp là O(N²) | Tiền xử lý trước (pre-compute similarity), giới hạn láng giềng |

**Câu 8. Trình bày phương pháp phân tích ma trận (Matrix Factorization).**

**Ý tưởng:** Biểu diễn user và item trên cùng không gian ẩn (latent space).

- User $u$ được biểu diễn bởi vector $p_u \in \mathbb{R}^k$
- Item $i$ được biểu diễn bởi vector $q_i \in \mathbb{R}^k$
- Rating dự đoán: $\hat{r}_{ui} = p_u^T q_i$

**Hàm mục tiêu:**

$$ \min_{p_*, q_*} \sum_{(u,i) \in Z} (r_{ui} - p_u^T q_i)^2 + \lambda(\|p_u\|^2 + \|q_i\|^2) $$

Sử dụng **SGD (Stochastic Gradient Descent)** để học:

$$ e_{ui} = r_{ui} - p_u^T q_i $$
$$ p_u \leftarrow p_u + \alpha(e_{ui}q_i - \lambda p_u) $$
$$ q_i \leftarrow q_i + \alpha(e_{ui}p_u - \lambda q_i) $$

**Câu 9. Giải thích các phương pháp cải thiện hàm dự đoán trong User-based CF.**

1. **Variance weighting:** Items có nhiều ý kiến trái chiều (variance cao) mang nhiều thông tin hơn — đặt trọng số cao hơn.
2. **Significance weighting:** Số lượng items chung giữa 2 users càng ít thì trọng số càng giảm.
3. **Neighbor weighting (tăng trọng số láng giềng):** Đặt trọng số gần 1 khi cặp users rất tương đồng.
4. **Lựa chọn láng giềng:** Dựa trên ngưỡng tương đồng hoặc số cố định láng giềng (thường 20-50 theo Herlocker et al. 2002).

### Chương 3: Gợi ý dựa trên lọc cộng tác nâng cao

**Câu 10. Trình bày cách tiếp cận dùng học máy cho lọc cộng tác.**

**Ý tưởng:** Xem user như một data instance với các features là items. Mỗi item có thể là label.

- **Naïve Bayes CF:** Dùng khi feedback rời rạc. Tính $P(r_{u,i}=v | \text{ratings của u})$.
- **Decision Tree CF:** Xây cây quyết định cho mỗi item dựa trên ratings của các items khác.
- **Neural Network CF:** Dùng mạng nơ-ron để học phi tuyến.

Phải xây dựng số lượng mô hình bằng số lượng items.

**Câu 11. Trình bày Neural Matrix Factorization (NeuMF).**

NeuMF kết hợp 2 mô hình:

1. **GMF (Generalized Matrix Factorization):** Mô hình tuyến tính — tổng quát hóa của MF.
   - Đầu vào: one-hot của user và item
   - Tầng embedding → hàm kết hợp element-wise product → đầu ra
   
2. **MLP (Multi-layer Perceptron):** Mô hình phi tuyến.
   - Đầu vào: one-hot của user và item (embedding riêng)
   - Các tầng fully-connected với ReLU

3. **NeuMF:** Kết hợp GMF và MLP ở tầng cuối:
   - $\phi^{GMF} = p_u^G \odot q_i^G$
   - $\phi^{MLP} = a_L(W_L^T(a_{L-1}(...)))$
   - $\hat{y}_{ui} = \sigma(h^T[\phi^{GMF}; \phi^{MLP}])$

**Câu 12. Phân biệt implicit và explicit feedback trong hệ gợi ý.**

| Tiêu chí | Explicit Feedback | Implicit Feedback |
|----------|------------------|-------------------|
| **Ví dụ** | Rating 1-5 sao, like/dislike | Click, view, thời gian xem, mua hàng |
| **Đặc điểm** | Chủ động, rõ ràng | Thụ động, thu thập tự động |
| **Khối lượng** | Ít (users ngại đánh giá) | Nhiều (hành vi tự nhiên) |
| **Độ nhiễu** | Thấp (chủ ý) | Cao (có thể không phản ánh sở thích thực) |
| **Xử lý** | Mô hình hồi quy (regression) | Mô hình xếp hạng (ranking) như BPR |

### Chương 4: Gợi ý dựa trên nội dung

**Câu 13. Gợi ý dựa trên nội dung (Content-based) là gì?**

**Ý tưởng:** Gợi ý các items có nội dung tương tự với những items mà user đã thích trong quá khứ.

- Item được biểu diễn bằng **đặc trưng nội dung** (thể loại, tác giả, mô tả văn bản,...)
- User profile được học dựa trên đặc trưng của các items user đã tương tác.
- **Nhiệm vụ:**
  1. Học xu hướng sở thích của user
  2. Gợi ý items tương đồng với sở thích của user

**Câu 14. Trình bày phương pháp TF-IDF và cách dùng trong gợi ý dựa trên nội dung.**

**TF (Term Frequency):** Tần suất xuất hiện của từ trong văn bản.
$$ \text{TF}(t, d) = \frac{\text{count}(t, d)}{\text{tổng số từ trong d}} $$

**IDF (Inverse Document Frequency):** Độ hiếm của từ trong toàn bộ corpus.
$$ \text{IDF}(t) = \log\frac{N}{\text{df}(t)} $$
Với $N$ = tổng số văn bản, $\text{df}(t)$ = số văn bản chứa từ $t$.

**TF-IDF:** $\text{TF-IDF}(t, d) = \text{TF}(t, d) \times \text{IDF}(t)$

**Cách dùng trong gợi ý:**
1. Biểu diễn mỗi item (văn bản) thành vector TF-IDF.
2. User profile = trung bình vector TF-IDF của các items user thích (hoặc dùng Rocchio).
3. Gợi ý: Tính cosine similarity giữa user profile và item vectors, lấy top-N.

**Câu 15. Trình bày phương pháp Rocchio.**

**Ý tưởng:** Cập nhật truy vấn (user profile) dựa trên phản hồi của user.

$$ Q_{i+1} = \alpha Q_i + \beta \frac{1}{|D^+|} \sum_{d \in D^+} d - \gamma \frac{1}{|D^-|} \sum_{d \in D^-} d $$

- $Q_i$: truy vấn hiện tại (vector profile của user)
- $D^+$: tập văn bản được thích
- $D^-$: tập văn bản không được thích
- $\alpha, \beta, \gamma$: trọng số để fine-tune phản hồi

Thường chỉ dùng phản hồi tích cực vì có giá trị hơn phản hồi tiêu cực.

**Câu 16. Hạn chế của gợi ý dựa trên nội dung.**

1. **Chuyên môn hóa quá mức (Overspecialization):** Gợi ý các items quá giống nhau, thiếu đa dạng.
2. **Chỉ dùng từ khóa:** Không đánh giá được chất lượng, tính thẩm mỹ, phong cách.
3. **Cold-start:** Vẫn cần một lượng dữ liệu huấn luyện nhất định.
4. **Nội dung ngắn/đa phương tiện:** Khó trích xuất đặc trưng từ ảnh, video.

### Chương 5: Gợi ý dựa trên tri thức

**Câu 17. Khi nào cần dùng gợi ý dựa trên tri thức?**

1. Items có số lượng đánh giá ít (cold-start item).
2. Khoảng thời gian đóng vai trò quan trọng — rating cũ không còn giá trị.
3. Khách hàng muốn định nghĩa rõ nhu cầu: "Màu xe phải là màu đen".

**Câu 18. Phân biệt gợi ý dựa trên ràng buộc (constraint-based) và dựa trên trường hợp (case-based).**

| Tiêu chí | Constraint-based | Case-based |
|----------|------------------|------------|
| **Cơ chế** | Dựa trên tập luật gợi ý đã định nghĩa rõ ràng | Dựa trên độ đo tương đồng |
| **Biểu diễn** | CSP (biến, miền giá trị, ràng buộc) | Items + độ đo tương đồng |
| **Cách hoạt động** | Thực hiện chuỗi ràng buộc → tìm items thỏa mãn | Truy xuất items tương đồng với yêu cầu |
| **Xử lý không tìm thấy** | Nới lỏng ràng buộc (diagnosis + repair) | Critiquing — thay đổi yêu cầu |

Cả hai đều tương tự trong quá trình gợi ý hội thoại:
1. User xác định yêu cầu
2. Hệ thống tìm kiếm giải pháp
3. Nếu không có giải pháp phù hợp → user thay đổi yêu cầu

**Câu 19. Trình bày phương pháp xếp hạng item dựa trên utility.**

Mỗi item được đánh giá dựa trên tập đại lượng đã xác định trước.

**Công thức:**
$$ \text{utility}(c, p) = \sum_{i} w_i \times \text{value}_i(p) $$

Trong đó:
- $w_i$: trọng số của thuộc tính $i$ theo khách hàng $c$
- $\text{value}_i(p)$: điểm của sản phẩm $p$ trên thuộc tính $i$

**Ví dụ:** Với camera, mỗi thuộc tính (mpix, zoom, giá,...) được gán 2 điểm: quality và economy. Khách hàng có thể quan tâm quality 80% và economy 20%.

### Chương 6: Gợi ý dựa trên phiên

**Câu 20. Khi nào cần dùng gợi ý dựa trên phiên? Các cách tiếp cận.**

**Khi:** 
- Khó định danh user (anonymous browsing)
- Chỉ có thông tin tương tác trong một phiên làm việc
- Ưu tiên sở thích ngắn hạn

**3 cách tiếp cận:**
1. **Item-to-item similarity:** Tính top-K items tương đồng với mỗi item trong phiên, tổng hợp và xếp hạng.
2. **Association rules (Apriori):** Tìm luật kết hợp giữa các items dựa trên tập giao dịch.
3. **RNN/LSTM:** Dự đoán item tiếp theo trong chuỗi.

**Câu 21. Trình bày các định nghĩa cơ bản trong khai thác luật kết hợp.**

| Khái niệm | Định nghĩa | Ký hiệu/Công thức |
|-----------|-----------|------------------|
| **Itemset** | Tập hợp các mục | {Milk, Bread, Diaper} |
| **k-itemset** | Itemset có k mục | 3-itemset |
| **Support count** | Số giao dịch chứa itemset | $\sigma(X)$ |
| **Độ hỗ trợ (Support)** | Tỉ lệ giao dịch chứa itemset | $s(X) = \sigma(X)/N$ |
| **Luật kết hợp** | Biểu thức $X \rightarrow Y$ | {Milk} → {Bread} |
| **Độ tin cậy (Confidence)** | Tỉ lệ giao dịch chứa X cũng chứa Y | $c(X \rightarrow Y) = \sigma(X \cup Y)/\sigma(X)$ |

**Câu 22. Trình bày thuật toán Apriori.**

**2 bước:**
1. **Sinh tập mục thường xuyên:** Tìm tất cả itemsets có support ≥ minsup.
2. **Sinh luật kết hợp:** Từ mỗi frequent itemset, sinh luật có confidence ≥ minconf.

**Nguyên tắc Apriori (Anti-monotone):** Nếu một itemset không thường xuyên thì tất cả supersets của nó đều không thường xuyên.

$$ \forall X, Y: (X \subseteq Y) \Rightarrow s(X) \geq s(Y) $$

### Chương 7: Kết hợp các kỹ thuật gợi ý

**Câu 23. Trình bày các thiết kế lai ghép (hybrid design).**

| Loại | Mô tả | Ví dụ |
|------|-------|-------|
| **Feature augmentation (Làm giàu đặc trưng)** | Dùng kết quả của một phương pháp làm đặc trưng đầu vào cho phương pháp khác | CF tăng cường nội dung: dùng content để tạo ratings bổ sung, làm ma trận bớt thưa |
| **Parallel (Song song)** | Kết hợp output của nhiều hệ thống | **Weighted:** Tổng có trọng số. **Switching:** Chuyển đổi dựa trên tiêu chí. **Mixed:** Kết hợp ở giao diện |
| **Pipeline (Đường ống)** | Output của hệ trước là input của hệ sau | **Cascade (Thác nước):** Lọc dần. **Meta-level (Nhiều mức):** Hệ sau khai thác mô hình của hệ trước |

**Weighted - tối ưu trọng số bằng MAE:**
$$ \text{rec}_{\text{weighted}}(u, i) = \sum_{k=1}^n \beta_k \times \text{rec}_k(u, i) $$

**Câu 24. Trình bày các kiến trúc học sâu trong hệ gợi ý: GMF, MLP, NeuMF.**

- **GMF (Generalized Matrix Factorization):** Tổng quát hóa MF bằng neural network — element-wise product của user và item embedding, đầu ra là linear + sigmoid.
- **MLP (Multi-layer Perceptron):** Nối user và item embedding, qua nhiều tầng fully-connected với ReLU.
- **NeuMF (Neural Matrix Factorization):** Kết hợp GMF và MLP với embedding riêng cho mỗi nhánh, nối ở tầng cuối, đầu ra sigmoid.

**Câu 25. Trình bày kiến trúc LSTM (Long Short-Term Memory).**

LSTM gồm 3 cổng điều khiển luồng thông tin qua các timesteps:

1. **Forget gate ($f_t$):** Quyết định quên bao nhiêu thông tin từ memory cell trước ($C_{t-1}$).
2. **Input gate ($i_t$):** Quyết định lưu bao nhiêu thông tin mới từ timestep hiện tại vào memory cell ($\tilde{C}_t$).
3. **Output gate ($o_t$):** Quyết định trích xuất bao nhiêu thông tin từ memory cell để đưa ra $h_t$.

Memory cell $C_t$ là vật chứa thông tin nội bộ, tích lũy qua các timesteps.

---

## Phần 2: Bài tập

![Bài tập 1 & 2](/img/y4t2-rs/photo_3_2026-05-16_11-49-15.jpg)
![Bài tập 3](/img/y4t2-rs/photo_2_2026-05-16_11-49-15.jpg)

### Bài tập 1: User-based Collaborative Filtering

**Đề:** Cho dữ liệu Utility matrix như sau:

| User | s1 | s2 | s3 |
|------|----|----|----|
| A | 5 | 2 | ? |
| B | 3 | ? | 5 |
| C | 5 | 2 | 3 |
| D | 2 | 3 | 1 |

Hãy tìm 2 người dùng có sở thích tương tự nhất với người dùng A. Sử dụng **cosine similarity** và **Pearson correlation**.

Sau đó, dựa trên 2 người dùng tương tự nhất (dùng Pearson), hãy dự đoán rating của A cho item s3.

**a) Cosine similarity:**

Ma trận A (vector 3 chiều, dùng 0 cho giá trị khuyết):

- V_A = [5, 2, 0] (coi ? là 0)
- V_B = [3, 0, 5]
- V_C = [5, 2, 3]
- V_D = [2, 3, 1]

$$ \text{cos}(A, B) = \frac{5\times3 + 2\times0 + 0\times5}{\sqrt{25+4+0} \times \sqrt{9+0+25}} = \frac{15}{\sqrt{29} \times \sqrt{34}} = \frac{15}{5.385 \times 5.831} = \frac{15}{31.40} \approx 0.478 $$

$$ \text{cos}(A, C) = \frac{5\times5 + 2\times2 + 0\times3}{\sqrt{29} \times \sqrt{25+4+9}} = \frac{25+4}{\sqrt{29} \times \sqrt{38}} = \frac{29}{5.385 \times 6.164} = \frac{29}{33.19} \approx 0.874 $$

$$ \text{cos}(A, D) = \frac{5\times2 + 2\times3 + 0\times1}{\sqrt{29} \times \sqrt{4+9+1}} = \frac{10+6}{\sqrt{29} \times \sqrt{14}} = \frac{16}{5.385 \times 3.742} = \frac{16}{20.15} \approx 0.794 $$

**Kết quả cosine:** C (0.874) > D (0.794) > B (0.478)

**b) Pearson correlation:**

Chỉ tính trên các items mà cả 2 users cùng có rating.

**Pearson(A, B):** Cùng rated s1=3,5 (không rated chung s2 vì B thiếu, không rated chung s3 vì A thiếu).
- Chỉ có 1 item chung → không thể tính Pearson (division by zero). Mặc định = 0.

**Pearson(A, C):** Cùng rated s1 và s2.
- $\bar{r}_A = (5+2)/2 = 3.5$, $\bar{r}_C = (5+2)/2 = 3.5$
- Tử: $(5-3.5)(5-3.5) + (2-3.5)(2-3.5) = 1.5\times1.5 + (-1.5)(-1.5) = 2.25 + 2.25 = 4.5$
- Mẫu: $\sqrt{(5-3.5)^2 + (2-3.5)^2} \times \sqrt{(5-3.5)^2 + (2-3.5)^2} = \sqrt{2.25+2.25} \times \sqrt{2.25+2.25} = \sqrt{4.5} \times \sqrt{4.5} = 4.5$
- $\text{Pearson}(A, C) = 4.5 / 4.5 = 1.0$

**Pearson(A, D):** Cùng rated s1 và s2.
- $\bar{r}_A = 3.5$, $\bar{r}_D = (2+3)/2 = 2.5$
- Tử: $(5-3.5)(2-2.5) + (2-3.5)(3-2.5) = 1.5\times(-0.5) + (-1.5)(0.5) = -0.75 - 0.75 = -1.5$
- Mẫu: $\sqrt{(5-3.5)^2 + (2-3.5)^2} \times \sqrt{(2-2.5)^2 + (3-2.5)^2} = \sqrt{4.5} \times \sqrt{0.25+0.25} = \sqrt{4.5} \times \sqrt{0.5} \approx 2.121 \times 0.707 = 1.5$
- $\text{Pearson}(A, D) = -1.5 / 1.5 = -1.0$

**Kết quả Pearson:** C (1.0) > B (0) > D (-1.0)
Hai users tương tự nhất với A: **C (1.0) và B (0)** (hoặc chỉ C nếu chỉ lấy > 0).

**c) Dự đoán rating của A cho item s3 dùng 2 láng giềng (C và D) với Pearson:**

$$ \text{pred}(A, s3) = \bar{r}_A + \frac{\sum_{b \in N} \text{sim}(A, b) \cdot (r_{b,s3} - \bar{r}_b)}{\sum_{b \in N} |\text{sim}(A, b)|} $$

Với láng giềng là C (sim=1.0) và D (sim=-1.0):

- C: $r_{C,s3}=3$, $\bar{r}_C=3.5$, $r_{C,s3} - \bar{r}_C = 3 - 3.5 = -0.5$
- D: $r_{D,s3}=1$, $\bar{r}_D=2.5$, $r_{D,s3} - \bar{r}_D = 1 - 2.5 = -1.5$

$$ \text{pred}(A, s3) = 3.5 + \frac{1.0 \times (-0.5) + (-1.0) \times (-1.5)}{|1.0| + |-1.0|} = 3.5 + \frac{-0.5 + 1.5}{2} = 3.5 + \frac{1.0}{2} = 4.0 $$

**Kết luận:** Dự đoán A sẽ đánh giá item s3 là **4.0**.

### Bài tập 2: Apriori - Khai thác luật kết hợp

**Đề:** Cho tập giao dịch sau:

| TID | Items |
|-----|-------|
| 1 | Bánh mì, Sữa, Trứng |
| 2 | Sữa, Tạp chí, Bánh mì |
| 3 | Bánh mì, Sữa, Bơ |
| 4 | Bánh mì, Tạp chí, Bơ |
| 5 | Sữa, Tạp chí, Bơ |
| 6 | Bánh mì, Sữa, Tạp chí, Trứng |

Giả sử ngưỡng độ hỗ trợ tối thiểu $\text{minsup} = 0.5$.

**1. Liệt kê các tập mục thường xuyên mức 1 (1-itemsets).**

Đếm support count cho mỗi item:

| Item | Count | Support | Frequent? |
|------|-------|---------|-----------|
| Bánh mì | 4 | 4/6 = 0.667 | ✓ |
| Sữa | 5 | 5/6 = 0.833 | ✓ |
| Trứng | 2 | 2/6 = 0.333 | ✗ |
| Tạp chí | 4 | 4/6 = 0.667 | ✓ |
| Bơ | 3 | 3/6 = 0.500 | ✓ |

Với minsup = 0.5 (support count ≥ 3):

**Frequent 1-itemsets:** {Bánh mì}, {Sữa}, {Tạp chí}, {Bơ}

**2. Dựa trên nguyên tắc cắt tỉa của Apriori, itemset nào bị loại bỏ và không cần xét ở bước tiếp theo? Tại sao?**

Itemset {Trứng} bị loại vì support = 2/6 = 0.333 < minsup = 0.5.

Theo nguyên tắc Apriori (anti-monotone): Nếu một itemset không thường xuyên thì tất cả supersets của nó đều không thường xuyên. Vì vậy, không cần xét bất kỳ itemset nào chứa Trứng ở các mức tiếp theo.

**3. Tìm các tập mục thường xuyên mức 2 (2-itemsets).**

Sinh các 2-itemsets từ 4 items thường xuyên: C(4,2) = 6 itemsets.

| Itemset | Count | Support | Frequent? |
|---------|-------|---------|-----------|
| {Bánh mì, Sữa} | 4 | 4/6 = 0.667 | ✓ |
| {Bánh mì, Tạp chí} | 3 | 3/6 = 0.500 | ✓ |
| {Bánh mì, Bơ} | 3 | 3/6 = 0.500 | ✓ |
| {Sữa, Tạp chí} | 3 | 3/6 = 0.500 | ✓ |
| {Sữa, Bơ} | 3 | 3/6 = 0.500 | ✓ |
| {Tạp chí, Bơ} | 2 | 2/6 = 0.333 | ✗ |

**Frequent 2-itemsets:** {Bánh mì, Sữa}, {Bánh mì, Tạp chí}, {Bánh mì, Bơ}, {Sữa, Tạp chí}, {Sữa, Bơ}

**4. Xét luật kết hợp: {Sữa, Tạp chí} → {Bánh mì}. Tính độ tin cậy. Nếu minconf = 0.7, luật có được chấp nhận không?**

$$ c(\{Sữa, Tạp chí\} \rightarrow \{Bánh mì\}) = \frac{\sigma(\{Sữa, Tạp chí, Bánh mì\})}{\sigma(\{Sữa, Tạp chí\})} $$

Đếm số giao dịch chứa cả Sữa, Tạp chí, và Bánh mì:
- TID 2: Sữa, Tạp chí, Bánh mì ✓
- TID 6: Sữa, Tạp chí, Bánh mì ✓
- $\sigma(\{Sữa, Tạp chí, Bánh mì\}) = 2$

$\sigma(\{Sữa, Tạp chí\}) = 3$ (TID 2, 5, 6)

$$ c = \frac{2}{3} \approx 0.667 $$

Vì $c = 0.667 < \text{minconf} = 0.7$ → **Luật KHÔNG được chấp nhận.**

**Bài tập mở rộng:** Từ 3-itemset {Bánh mì, Sữa, Tạp chí}, sinh tất cả các luật kết hợp và tính độ tin cậy.

σ({Bánh mì, Sữa, Tạp chí}) = 2

| Luật | Confidence | Chấp nhận? |
|------|------------|------------|
| {Bánh mì, Sữa} → {Tạp chí} | 2/4 = 0.5 | ✗ |
| {Bánh mì, Tạp chí} → {Sữa} | 2/3 = 0.667 | ✗ |
| {Sữa, Tạp chí} → {Bánh mì} | 2/3 = 0.667 | ✗ |
| {Bánh mì} → {Sữa, Tạp chí} | 2/4 = 0.5 | ✗ |
| {Sữa} → {Bánh mì, Tạp chí} | 2/5 = 0.4 | ✗ |
| {Tạp chí} → {Bánh mì, Sữa} | 2/4 = 0.5 | ✗ |

Không có luật nào được chấp nhận với minconf = 0.7.

### Bài tập 3: Content-based Recommendation - Camera similarity

**Đề:** Cho danh mục sản phẩm máy ảnh kỹ thuật số:

| Sản phẩm | Mpix | Zoom quang |
|-----------|------|------------|
| P1 | 8 | 4x |
| P2 | 5 | 3x |
| P3 | 10 | 8x |
| P4 | 20 | 10x |

Yêu cầu kịch bản (REQ): Mpix = 10.0 (trọng số $w_1=3$) và Zoom = 12x (trọng số $w_2=2$).

Sử dụng công thức:
- Độ tương đồng cục bộ: $\text{sim}(p, r) = 1 - \frac{|p - r|}{\text{range}}$
- Độ tương đồng tổng quát: $\text{similarity}(p, \text{REQ}) = \frac{w_1 \times \text{sim}(p, \text{Mpix}) + w_2 \times \text{sim}(p, \text{Zoom})}{w_1 + w_2}$

**1. Xác định khoảng biến thiên (Max - Min) của hai thuộc tính.**

- **Mpix:** Min = 5, Max = 20 → $\text{range}_{\text{Mpix}} = 20 - 5 = 15$
- **Zoom:** Min = 3, Max = 10 → $\text{range}_{\text{Zoom}} = 10 - 3 = 7$

**2. Tính độ tương đồng cục bộ của P1 và P4.**

**P1 (Mpix=8, Zoom=4x):**
- $\text{sim}(P1, \text{Mpix}=10) = 1 - \frac{|8 - 10|}{15} = 1 - \frac{2}{15} = 1 - 0.133 = 0.867$
- $\text{sim}(P1, \text{Zoom}=12x) = 1 - \frac{|4 - 12|}{7} = 1 - \frac{8}{7} = 1 - 1.143 = -0.143$

**P4 (Mpix=20, Zoom=10x):**
- $\text{sim}(P4, \text{Mpix}=10) = 1 - \frac{|20 - 10|}{15} = 1 - \frac{10}{15} = 1 - 0.667 = 0.333$
- $\text{sim}(P4, \text{Zoom}=12x) = 1 - \frac{|10 - 12|}{7} = 1 - \frac{2}{7} = 1 - 0.286 = 0.714$

**3. Tính độ tương đồng tổng quát.**

**P1:**
$$ \text{sim}(P1, \text{REQ}) = \frac{3 \times 0.867 + 2 \times (-0.143)}{3 + 2} = \frac{2.601 - 0.286}{5} = \frac{2.315}{5} = 0.463 $$

**P4:**
$$ \text{sim}(P4, \text{REQ}) = \frac{3 \times 0.333 + 2 \times 0.714}{5} = \frac{0.999 + 1.428}{5} = \frac{2.427}{5} = 0.485 $$

**Kết luận:** P4 (0.485) được xếp hạng cao hơn P1 (0.463) cho yêu cầu này.

**P3 (Mpix=10, Zoom=8x):**
- $\text{sim}(P3, \text{Mpix}=10) = 1 - \frac{0}{15} = 1.0$
- $\text{sim}(P3, \text{Zoom}=12x) = 1 - \frac{|8-12|}{7} = 1 - \frac{4}{7} = 0.429$
- $\text{sim}(P3, \text{REQ}) = \frac{3\times1.0 + 2\times0.429}{5} = \frac{3 + 0.858}{5} = 0.772$

P3 có độ tương đồng cao nhất vì Mpix=10 khớp chính xác yêu cầu.

### Bài tập 4: Matrix Factorization

**Đề:** Cho ma trận ratings và 2 latent factors:

$$ R = \begin{bmatrix} 5 & 3 & 0 & 1 \\ 4 & 0 & 0 & 1 \\ 1 & 1 & 0 & 5 \\ 1 & 0 & 0 & 4 \\ 0 & 1 & 5 & 4 \end{bmatrix} \quad P = \begin{bmatrix} 1.2 & 0.8 \\ 1.0 & 1.0 \\ 0.5 & 1.5 \\ 0.8 & 1.2 \\ 1.5 & 0.3 \end{bmatrix} \quad Q = \begin{bmatrix} 1.0 & 1.5 \\ 0.5 & 1.0 \\ 1.2 & 0.6 \\ 0.8 & 1.0 \end{bmatrix} $$

- $P$: ma trận user latent factors (5 users × 2 factors)
- $Q$: ma trận item latent factors (4 items × 2 factors)

**a) Dự đoán rating của user 3 cho item 2.**

User 3: $p_3 = [0.5, 1.5]$
Item 2: $q_2 = [0.5, 1.0]$

$\hat{r}_{3,2} = p_3^T q_2 = 0.5 \times 0.5 + 1.5 \times 1.0 = 0.25 + 1.5 = 1.75$

**b) Tính RMSE trên tập known ratings.**

Dự đoán tất cả known ratings:

| (u,i) | r | $\hat{r}$ | error |
|-------|---|-----------|-------|
| (1,1) | 5 | $1.2\times1.0 + 0.8\times1.5 = 1.2 + 1.2 = 2.4$ | 5 - 2.4 = 2.6 |
| (1,2) | 3 | $1.2\times0.5 + 0.8\times1.0 = 0.6 + 0.8 = 1.4$ | 3 - 1.4 = 1.6 |
| (1,4) | 1 | $1.2\times0.8 + 0.8\times1.0 = 0.96 + 0.8 = 1.76$ | 1 - 1.76 = -0.76 |
| (2,1) | 4 | $1.0\times1.0 + 1.0\times1.5 = 1.0 + 1.5 = 2.5$ | 4 - 2.5 = 1.5 |
| (2,4) | 1 | $1.0\times0.8 + 1.0\times1.0 = 0.8 + 1.0 = 1.8$ | 1 - 1.8 = -0.8 |
| (3,1) | 1 | $0.5\times1.0 + 1.5\times1.5 = 0.5 + 2.25 = 2.75$ | 1 - 2.75 = -1.75 |
| (3,2) | 1 | $0.5\times0.5 + 1.5\times1.0 = 0.25 + 1.5 = 1.75$ | 1 - 1.75 = -0.75 |
| (3,4) | 5 | $0.5\times0.8 + 1.5\times1.0 = 0.4 + 1.5 = 1.9$ | 5 - 1.9 = 3.1 |
| (4,4) | 4 | $0.8\times0.8 + 1.2\times1.0 = 0.64 + 1.2 = 1.84$ | 4 - 1.84 = 2.16 |
| (5,2) | 1 | $1.5\times0.5 + 0.3\times1.0 = 0.75 + 0.3 = 1.05$ | 1 - 1.05 = -0.05 |
| (5,3) | 5 | $1.5\times1.2 + 0.3\times0.6 = 1.8 + 0.18 = 1.98$ | 5 - 1.98 = 3.02 |
| (5,4) | 4 | $1.5\times0.8 + 0.3\times1.0 = 1.2 + 0.3 = 1.5$ | 4 - 1.5 = 2.5 |

$$ \text{RMSE} = \sqrt{\frac{1}{12} \sum error^2} $$

$$ \sum error^2 = 2.6^2 + 1.6^2 + (-0.76)^2 + 1.5^2 + (-0.8)^2 + (-1.75)^2 + (-0.75)^2 + 3.1^2 + 2.16^2 + (-0.05)^2 + 3.02^2 + 2.5^2 $$

$$ = 6.76 + 2.56 + 0.578 + 2.25 + 0.64 + 3.063 + 0.563 + 9.61 + 4.666 + 0.003 + 9.120 + 6.25 = 46.063 $$

$$ \text{RMSE} = \sqrt{46.063/12} = \sqrt{3.839} \approx 1.959 $$

**c) Cập nhật $p_3$ bằng SGD ($\alpha=0.01, \lambda=0.02$) với rating (3, 1) = 1.**

$e_{3,1} = r_{3,1} - \hat{r}_{3,1} = 1 - 2.75 = -1.75$

$p_3 \leftarrow p_3 + \alpha(e_{3,1} \cdot q_1 - \lambda \cdot p_3)$

$p_{3,1} \leftarrow 0.5 + 0.01((-1.75)(1.0) - 0.02 \times 0.5) = 0.5 + 0.01(-1.75 - 0.01) = 0.5 + 0.01(-1.76) = 0.5 - 0.0176 = 0.482$

$p_{3,2} \leftarrow 1.5 + 0.01((-1.75)(1.5) - 0.02 \times 1.5) = 1.5 + 0.01(-2.625 - 0.03) = 1.5 + 0.01(-2.655) = 1.5 - 0.0266 = 1.473$

### Bài tập 5: Item-to-Item Similarity cho Session-based

**Đề:** Cho các giao dịch (session) sau:

| Session ID | Items |
|-------------|-------|
| S1 | A, B, C |
| S2 | A, D, E |
| S3 | B, C, D |
| S4 | A, B, D |
| S5 | C, D, E |

Tính độ tương đồng giữa các cặp items dùng **cosine similarity** và **xác suất có điều kiện**:

$$ P(u|v) = \frac{\text{freq}(uv)}{\text{freq}(v)} \quad\quad \text{Sim}(u,v) = \frac{\text{freq}(uv)}{\text{freq}(u)^\alpha \cdot \text{freq}(v)} $$

với $\alpha = 0.5$ (hệ số điều chỉnh mức độ phổ biến).

Xây dựng ma trận đồng xuất hiện (co-occurrence):

| | A | B | C | D | E |
|---|---|---|---|---|---|
| A | — | S1,S4 = 2 | S1 = 1 | S2,S4 = 2 | S2 = 1 |
| B | 2 | — | S1,S3 = 2 | S3,S4 = 2 | 0 |
| C | 1 | 2 | — | S3,S5 = 2 | S5 = 1 |
| D | 2 | 2 | 2 | — | S2,S5 = 2 |
| E | 1 | 0 | 1 | 2 | — |

Tần suất mỗi item: freq(A)=3, freq(B)=3, freq(C)=3, freq(D)=4, freq(E)=2

**Cosine similarity (A, B):**
Vector đồng xuất hiện: A=[0,2,1,2,1], B=[2,0,2,2,0]
$$ \cos(A,B) = \frac{2\times2 + 1\times2 + 2\times2 + 1\times0}{\sqrt{0+4+1+4+1} \times \sqrt{4+0+4+4+0}} = \frac{4+2+4+0}{\sqrt{10} \times \sqrt{12}} = \frac{10}{3.162 \times 3.464} = \frac{10}{10.954} \approx 0.913 $$

**Xác suất có điều kiện (A|B):** $P(A|B) = \frac{\text{freq}(AB)}{\text{freq}(B)} = \frac{2}{3} \approx 0.667$

**Sim(A, B) với $\alpha=0.5$:**
$$ \text{Sim}(A,B) = \frac{\text{freq}(AB)}{\text{freq}(A)^{0.5} \cdot \text{freq}(B)} = \frac{2}{3^{0.5} \times 3} = \frac{2}{1.732 \times 3} = \frac{2}{5.196} \approx 0.385 $$

### Bài tập 6: Hybrid Recommendation - Weighted

**Đề:** Hai hệ gợi ý CF và CB cho kết quả điểm như sau:

| Item | CF Score | CB Score |
|------|---------|---------|
| Item1 | 0.9 | 0.6 |
| Item2 | 0.4 | 0.8 |
| Item3 | 0.7 | 0.3 |
| Item4 | 0.2 | 0.5 |
| Item5 | 0.1 | 0.2 |

Cho biết user đã click vào Item1 và Item3. Xác định trọng số $\beta_1$ (cho CF) và $\beta_2$ (cho CB) tối thiểu hóa MAE, biết rằng "click" tương ứng với điểm > 0.5.

**Giải:**

Với user đã click Item1 và Item3 → expected score ≥ 0.5 cho 2 items này.

Thử các cặp trọng số $\beta_1 + \beta_2 = 1$:

| $\beta_1$ | $\beta_2$ | Item1 | Item3 | Error1 | Error3 | MAE |
|-----------|-----------|-------|-------|--------|--------|-----|
| 0.1 | 0.9 | 0.63 | 0.34 | 0.13 | 0.16 | 0.145 |
| 0.3 | 0.7 | 0.69 | 0.42 | 0.19 | 0.08 | 0.135 |
| 0.5 | 0.5 | 0.75 | 0.50 | 0.25 | 0.00 | 0.125 |
| 0.7 | 0.3 | 0.81 | 0.58 | 0.31 | 0.08 | 0.195 |
| 0.9 | 0.1 | 0.87 | 0.66 | 0.37 | 0.16 | 0.265 |

Giải thích cách tính với $\beta_1=0.5, \beta_2=0.5$:
- Item1: $0.5\times0.9 + 0.5\times0.6 = 0.75$ (error = |0.75 - 1| = 0.25)
- Item3: $0.5\times0.7 + 0.5\times0.3 = 0.50$ (error = |0.50 - 1| = 0.50? )

Chờ, cần làm rõ: "expected" là click (1) hay không click (0) với threshold 0.5.
- Item1 click → expected = 1, Item3 click → expected = 1
- Item2,4,5 không click → expected = 0

Với $\beta_1=0.5, \beta_2=0.5$:
- Item1: $0.5\times0.9 + 0.5\times0.6 = 0.75$ → error = |0.75 - 1| = 0.25
- Item2: $0.5\times0.4 + 0.5\times0.8 = 0.60$ → error = |0.60 - 0| = 0.60
- Item3: $0.5\times0.7 + 0.5\times0.3 = 0.50$ → error = |0.50 - 1| = 0.50
- Item4: $0.5\times0.2 + 0.5\times0.5 = 0.35$ → error = |0.35 - 0| = 0.35
- Item5: $0.5\times0.1 + 0.5\times0.2 = 0.15$ → error = |0.15 - 0| = 0.15

MAE = (0.25 + 0.60 + 0.50 + 0.35 + 0.15)/5 = 1.85/5 = 0.37

Tính lại tất cả:

| $\beta_1$ | $\beta_2$ | I1 err | I2 err | I3 err | I4 err | I5 err | MAE |
|-----------|-----------|--------|--------|--------|--------|--------|-----|
| 0.1 | 0.9 | 0.37 | 0.76 | 0.66 | 0.47 | 0.19 | 0.490 |
| 0.3 | 0.7 | 0.31 | 0.68 | 0.58 | 0.41 | 0.17 | 0.430 |
| 0.5 | 0.5 | 0.25 | 0.60 | 0.50 | 0.35 | 0.15 | 0.370 |
| 0.7 | 0.3 | 0.19 | 0.52 | 0.42 | 0.29 | 0.13 | 0.310 |
| 0.9 | 0.1 | 0.13 | 0.44 | 0.34 | 0.23 | 0.11 | **0.250** |

**Kết luận:** $\beta_1 = 0.9$ (CF), $\beta_2 = 0.1$ (CB) cho MAE thấp nhất (0.250) — CF đóng vai trò chính trong trường hợp này.

### Bài tập 7: Item-based CF với Cosine Similarity

**Đề:** Cho ma trận ratings sau:

| User | Item1 | Item2 | Item3 | Item4 | Item5 |
|------|-------|-------|-------|-------|-------|
| Alice | 5 | 3 | 4 | 4 | ? |
| User1 | 3 | 1 | 2 | 3 | 3 |
| User2 | 4 | 3 | 4 | 3 | 5 |
| User3 | 3 | 3 | 1 | 5 | 4 |
| User4 | 1 | 5 | 5 | 2 | 1 |

Sử dụng **item-based CF** (cosine similarity) để dự đoán rating của Alice cho Item5.

**a) Tính cosine similarity giữa Item5 và các items khác.**

Chỉ xét các users đã rated cả 2 items.

**Item5 vs Item1:** Users cùng rated: User1(3,3), User2(5,4), User3(4,3), User4(1,1)
V_Item5 = [3,5,4,1], V_Item1 = [3,4,3,1]

$$ \cos(I5, I1) = \frac{3\times3+5\times4+4\times3+1\times1}{\sqrt{9+25+16+1} \times \sqrt{9+16+9+1}} = \frac{9+20+12+1}{\sqrt{51} \times \sqrt{35}} = \frac{42}{7.141 \times 5.916} = \frac{42}{42.25} \approx 0.994 $$

**Item5 vs Item2:** Users cùng rated: User1(3,1), User2(5,3), User3(4,3), User4(1,5)
V_I5=[3,5,4,1], V_I2=[1,3,3,5]

$$ \cos(I5, I2) = \frac{3\times1+5\times3+4\times3+1\times5}{\sqrt{51} \times \sqrt{1+9+9+25}} = \frac{3+15+12+5}{\sqrt{51} \times \sqrt{44}} = \frac{35}{7.141 \times 6.633} = \frac{35}{47.37} \approx 0.739 $$

**Item5 vs Item3:** Users cùng rated: User1(3,2), User2(5,4), User4(1,5)
V_I5=[3,5,1], V_I3=[2,4,5]

$$ \cos(I5, I3) = \frac{3\times2+5\times4+1\times5}{\sqrt{9+25+1} \times \sqrt{4+16+25}} = \frac{6+20+5}{\sqrt{35} \times \sqrt{45}} = \frac{31}{5.916 \times 6.708} = \frac{31}{39.69} \approx 0.781 $$

**Item5 vs Item4:** Users cùng rated: User2(5,3), User3(4,5), User4(1,2)
V_I5=[5,4,1], V_I4=[3,5,2]

$$ \cos(I5, I4) = \frac{5\times3+4\times5+1\times2}{\sqrt{25+16+1} \times \sqrt{9+25+4}} = \frac{15+20+2}{\sqrt{42} \times \sqrt{38}} = \frac{37}{6.481 \times 6.164} = \frac{37}{39.95} \approx 0.926 $$

**b) Dự đoán rating của Alice cho Item5 (dùng top-3 items tương tự nhất).**

Top-3: Item1 (0.994), Item4 (0.926), Item3 (0.781)

$$ \text{pred}(\text{Alice}, I5) = \frac{0.994 \times 5 + 0.926 \times 4 + 0.781 \times 4}{0.994 + 0.926 + 0.781} = \frac{4.97 + 3.704 + 3.124}{2.701} = \frac{11.798}{2.701} \approx 4.37 $$

**Kết luận:** Alice sẽ đánh giá Item5 khoảng **4.37**.

### Bài tập 8: Tính độ đo tương đồng Cosine và Pearson

**Đề:** Tính độ tương đồng giữa 2 users từ ma trận ratings:

| User | Movie1 | Movie2 | Movie3 | Movie4 | Movie5 |
|------|--------|--------|--------|--------|--------|
| X | 4 | ? | 3 | 5 | 2 |
| Y | 3 | 4 | ? | 4 | 1 |

**a) Cosine similarity (dùng 0 cho missing):**
V_X = [4, 0, 3, 5, 2], V_Y = [3, 4, 0, 4, 1]

$$ \cos(X,Y) = \frac{4\times3 + 0\times4 + 3\times0 + 5\times4 + 2\times1}{\sqrt{16+0+9+25+4} \times \sqrt{9+16+0+16+1}} = \frac{12+0+0+20+2}{\sqrt{54} \times \sqrt{42}} = \frac{34}{7.348 \times 6.481} = \frac{34}{47.63} \approx 0.714 $$

**b) Cosine similarity (chỉ dùng common items):**
Common items: Movie1, Movie4, Movie5
V_X = [4, 5, 2], V_Y = [3, 4, 1]

$$ \cos(X,Y)_{\text{common}} = \frac{4\times3 + 5\times4 + 2\times1}{\sqrt{16+25+4} \times \sqrt{9+16+1}} = \frac{12+20+2}{\sqrt{45} \times \sqrt{26}} = \frac{34}{6.708 \times 5.099} = \frac{34}{34.21} \approx 0.994 $$

**c) Pearson correlation:**
Common: Movie1(4,3), Movie4(5,4), Movie5(2,1)
$\bar{r}_X = (4+5+2)/3 = 11/3 \approx 3.667$
$\bar{r}_Y = (3+4+1)/3 = 8/3 \approx 2.667$

Tử: $(4-3.667)(3-2.667) + (5-3.667)(4-2.667) + (2-3.667)(1-2.667)$
$= 0.333\times0.333 + 1.333\times1.333 + (-1.667)(-1.667)$
$= 0.111 + 1.777 + 2.779 = 4.667$

Mẫu: $\sqrt{(0.333)^2+(1.333)^2+(-1.667)^2} \times \sqrt{(0.333)^2+(1.333)^2+(-1.667)^2}$
$= \sqrt{0.111+1.777+2.779} \times \sqrt{0.111+1.777+2.779}$
$= \sqrt{4.667} \times \sqrt{4.667} = 4.667$

$\text{Pearson}(X,Y) = 4.667/4.667 = 1.0$
