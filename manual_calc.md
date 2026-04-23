**Feature Vectors:** {'pm25', 'pm10', 'no2', 'so2', 'co', 'o3'}

**Class Variable:** {'new_case', 'new_death'}

**Formula:**

$$P(y \mid x_1, \dots, x_n) = \frac{P(y) \prod_{i=1}^{n} P(x_i \mid y)}{P(x_1) P(x_2) \dots P(x_n)}$$

---

### PM2.5 (New Case)

| Category | Total Count | Case = True | Case = False | P(x∣True) | P(x∣False) |
|----------|-------------|-------------|--------------|-----------|------------|
| IT3 | 29,351 | 4,800 | 24,551 | 4,800/75,585 | 24,551 |
| IT4 | 22,572 | 2,421 | 20,151 | 2,421/75,585 | 20,151/75,585 |
| IT2 | 15,911 | 4,387 | 11,524 | 4,387/75,585 | 11,524/75,585 |
| IT1 | 5,267 | 2,813 | 2,454 | 2,813/75,585 | 2,454/75,585 |
| AQG | 2,484 | 442 | 2042 | 442/75,585 | 2042/75,585 |
| Total | 75,585 | 14,863 | 60,722 | 1.00 | 1.00 |

---

### PM10 (New Case)

| Category | Total Count | Case = True | Case = False | P(x∣True) | P(x∣False) |
|----------|-------------|-------------|--------------|-----------|------------|
| AQG | 24,084 | | | | |
| IT4 | 21,463 | | | | |
| IT3 | 20,934 | | | | |
| IT2 | 9,026 | | | | |
| IT1 | 78 | | | | |
| Total | 75,585 | 14,863 | 60,722 | 1.00 | 1.00 |

---

### NO2 (New Case)

| Category | Total Count | Case = True | Case = False | P(x∣True) | P(x∣False) |
|----------|-------------|-------------|--------------|-----------|------------|
| IT3 | 29,351 | | | | |
| IT4 | 22,572 | | | | |
| IT2 | 15,911 | | | | |
| IT1 | 5,267 | | | | |
| AQG | 2,484 | | | | |
| Total | 75,585 | 14,863 | 60,722 | 1.00 | 1.00 |

---

### SO2 (New Case)

| Category | Total Count | Case = True | Case = False | P(x∣True) | P(x∣False) |
|----------|-------------|-------------|--------------|-----------|------------|
| Moderate | 27,357 | | | | |
| Heavy | 24,115 | | | | |
| Trace | 24,113 | | | | |
| Total | 75,585 | 14,863 | 60,722 | 1.00 | 1.00 |

---

### CO (New Case)

| Category | Total Count | Case = True | Case = False | P(x∣True) | P(x∣False) |
|----------|-------------|-------------|--------------|-----------|------------|
| Moderate | 33,274 | | | | |
| Heavy | 25,021 | | | | |
| Trace | 17,290 | | | | |
| Total | 75,585 | 14,863 | 60,722 | 1.00 | 1.00 |

---

### O3 (New Case)

| Category | Total Count | Case = True | Case = False | P(x∣True) | P(x∣False) |
|----------|-------------|-------------|--------------|-----------|------------|
| Heavy | 34,185 | | | | |
| Moderate | 30,576 | | | | |
| Trace | 10,824 | | | | |
| Total | 75,585 | 14,863 | 60,722 | 1.00 | 1.00 |

---

### New Case

| Class | Count | P(y) |
|-------|-------|------|
| True (Case occurred) | 14,863 | 14,863/75,585 ≈ 0.1966 |
| False (No case) | 60,722 | 60,722/75,585 ≈ 0.8034 |
| Total | 75,585 | 1.00 |

---
Will add mathematical computation of new case tomorrow :))




Add tables for independent variables (new death) here

### New Death

| Class | Count | P(y) |
|-------|-------|------|
| True (Death occurred) | 562 | 562/75,585 ≈ 0.0074 |
| False (No death) | 75,023 | 75,023/75,585 ≈ 0.9926 |
| Total | 75,585 | 1.00 |
