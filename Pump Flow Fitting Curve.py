# -*- coding: utf-8 -*-
from sympy import symbols, Eq, solve

# 定义变量
Q, f, n = symbols('Q f n')

# 定义方程式
H1 = -0.00005 * (Q**2 / n**2) + 0.00074 * (Q * f / n) + 0.01564 * f**2
H2 = 16 + 0.00025 * (Q**2 / (3.6**2))

# 设置方程 H1 = H2
equation = Eq(H1, H2)

# 解方程求 Q
solution = solve(equation, Q)

# 输出 Q 的表达式
print('solution',solution)

# -*- coding: utf-8 -*-
import sympy as sp

# 定义变量
Q, f, n = sp.symbols('Q f n')

# 定义表达式
# Q1 = 7.2 * n * (333.0 * f - 25455.8441227157 * sp.sqrt(0.000377121913580247 * f**2 * n**2 + 0.001148625 * f**2 - 0.385802469135802 * n**2 - 1)) / (125.0 * n**2 + 324.0)
Q2 = 7.2 * n * (333.0 * f + 25455.8441227157 * sp.sqrt(0.000377121913580247 * f**2 * n**2 + 0.001148625 * f**2 - 0.385802469135802 * n**2 - 1)) / (125.0 * n**2 + 324.0)

# 计算在 n = 1 和 f = 35 时的 Q1 和 Q2
n_val = 1
f_val = 39

# Q1_val = Q1.subs({n: n_val, f: f_val})
Q2_val = Q2.subs({n: n_val, f: f_val})

# 输出结果
# print(Q1_val, Q2_val)
print('Q2_val',Q2_val)


# -*- coding: utf-8 -*-
import sympy as sp
import numpy as np
import pandas as pd

# 定义变量
Q, f, n = sp.symbols('Q f n')

# 定义原始表达式
Q2_expr = 7.2 * n * (333.0 * f + 25455.8441227157 * sp.sqrt(
    0.000377121913580247 * f ** 2 * n ** 2 + 0.001148625 * f ** 2 - 0.385802469135802 * n ** 2 - 1)) / (
                      125.0 * n ** 2 + 324.0)

# 生成样本数据点
n_values = [1, 2]
f_values = np.arange(35, 51, 1)

results = []

for n_val in n_values:
    Q2_values = [float(Q2_expr.subs({n: n_val, f: f_val}).evalf()) for f_val in f_values]

    # 输出实际值
    # print(f"n = {n_val} 的各样本实际值：")
    # for f_val, Q2_val in zip(f_values, Q2_values):
    #     print(f"f = {f_val}, 实际值 = {Q2_val}")

    # 生成数据表格
    data = {
        'n': [n_val] * len(f_values),
        'f': f_values,
        '实际值': Q2_values
    }
    df = pd.DataFrame(data)
    results.append(df)

# 合并所有结果并导出为CSV文件
final_df = pd.concat(results, ignore_index=True)
final_df.to_csv('actual_values.csv', index=False)
print("已将实际值导出为 'actual_values.csv' 文件")

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from matplotlib import font_manager as fm

# 设置中文字体路径，使用SimHei字体
font_path = 'C:/Windows/Fonts/simhei.ttf'  # 请确认此路径是否正确
font_prop = fm.FontProperties(fname=font_path)

# 数据
data1 = {
    'f': [35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50],
    '实际值': [470.6571507, 506.1957447, 539.817878, 571.96442, 602.9361511, 632.9485479, 662.1618453, 690.6987625, 718.6555587, 746.109245, 773.1224664, 799.7469098, 826.0257467, 851.9954237, 877.6870011, 903.1271711]
}

data2 = {
    'f': [35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50],
    '实际值': [578.9873116, 631.6254015, 680.696963, 727.1174461, 771.4801883, 814.1945687, 855.5563802, 895.7870712, 935.0571741, 973.5010626, 1011.226657, 1048.322037, 1084.860088, 1120.901841, 1156.49894, 1191.695485]
}

df1 = pd.DataFrame(data1)
df2 = pd.DataFrame(data2)

# 定义多项式函数
def polynomial(f, a, b, c, d, e):
    return a*f**4 + b*f**3 + c*f**2 + d*f + e

# 拟合曲线
x_data1 = df1['f']
y_data1 = df1['实际值']

params1, _ = curve_fit(polynomial, x_data1, y_data1)

x_data2 = df2['f']
y_data2 = df2['实际值']

params2, _ = curve_fit(polynomial, x_data2, y_data2)

# 生成拟合数据
x_fitted = np.linspace(min(x_data1), max(x_data1), 100)
y_fitted1 = polynomial(x_fitted, *params1)
y_fitted2 = polynomial(x_fitted, *params2)

# 输出拟合参数
a1, b1, c1, d1, e1 = params1
print(f'n=1时的拟合曲线公式: Q = {a1:.8e} * f^4 + {b1:.8e} * f^3 + {c1:.8e} * f^2 + {d1:.8e} * f + {e1:.8e}')

a2, b2, c2, d2, e2 = params2
print(f'n=2时的拟合曲线公式: Q = {a2:.8e} * f^4 + {b2:.8e} * f^3 + {c2:.8e} * f^2 + {d2:.8e} * f + {e2:.8e}')

# 计算真实值与拟合值的差值
y_fitted1_data = polynomial(x_data1, *params1)
y_fitted2_data = polynomial(x_data2, *params2)

df1['拟合值'] = y_fitted1_data
df1['差值'] = df1['实际值'] - df1['拟合值']

df2['拟合值'] = y_fitted2_data
df2['差值'] = df2['实际值'] - df2['拟合值']

print("n=1 实际值与拟合值的差值：")
print(df1)
print("\nn=2 实际值与拟合值的差值：")
print(df2)

# 绘制数据和拟合曲线
plt.figure(figsize=(10, 6))
plt.scatter(x_data1, y_data1, label='n=1 实际值', color='red')
plt.plot(x_fitted, y_fitted1, label='n=1 拟合曲线', color='blue')
plt.scatter(x_data2, y_data2, label='n=2 实际值', color='green')
plt.plot(x_fitted, y_fitted2, label='n=2 拟合曲线', color='purple')
plt.xlabel('f', fontproperties=font_prop)
plt.ylabel('实际值', fontproperties=font_prop)
plt.legend(prop=font_prop)
plt.title('f与实际值的拟合曲线', fontproperties=font_prop)
plt.grid(True)
plt.show()