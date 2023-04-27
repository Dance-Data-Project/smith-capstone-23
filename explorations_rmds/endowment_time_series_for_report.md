---
title: "Endowment Tme Series for Report"
author: "Quinn White"
date: "2023-04-26"
output: 
  pdf_document:
    latex_engine: xelatex
    toc: true
    keep_md: true
header-includes:
  - \usepackage{fontspec}
  - \setmainfont{Helvetica}
  
---



<style>
.math {
  font-size: small;
}
</style>

# Notes on Percent Change


We compute the relative change from one year to the next as

$$\text{Relative change} = \dfrac{\text{End Value} - \text{Start Value}}{ \text{Start Value}}.$$ The percent change is then simply $\text{Relative Change} \times 100$. 


For a relative change of value $R$, we can interpret it by considering the formula

$$\text{End Value} = (R+1) \times \text{Start Value}.$$

A couple of examples include:
* If the percent change is $-50\%$, the current year value is half of that in the previous year. 
* If the percent change is $100\%$, the current year value is twice that in the previous year.
* If the percent change is $-100\%$, the current year value is zero.




















## Annual Growth Rate

The annual growth rate is the percent change in a year. That is,

$$\text{growth rate} = \frac{\text{Beginning Value}- \text{End Value}}{\text{Beginning Value}}.$$ 
We can compute this for the S&P 500 for the same time interval. Here, we use mean value of the S&P 500 to the previous week compared to the beginning and end dates of each company's fiscal year. 



To account for withdrawals and contributions, we add back withdrawals and subtract contributions, so we calculate the annual growth rate as

$$\small{\text{Annual Growth Rate} = \frac{ ( \text{End Value} + \text{Other Expenditures} + \text{Grants and Scholarships} + \text{Administrative Expenses} - \text{Contributions} ) -\text{Beginning Value}}{\text{Beginning Value}}}$$ 
This adjustment is important because we want to see how much of the change from the beginning of year balance to the end of year balance is due to the investments, not, for example, a large contribution.


\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-1-1} \caption{\label{fig:annual-growth-endowment}Annual growth rate of a company's endowment when adjusting for contributions and withdrawals, compared to the annual growth S\&P 500 for the corresponding time period.}\label{fig:unnamed-chunk-1}
\end{figure}




## Compound Growth Rate

Letting $t$ denote the number of years considered, 
$$\tiny{\text{Compound Annual Growth Rate} = \left( \frac{\text{End Value}}{\text{Beginning Value}}\right)^{\frac{1}{t}}-1}$$

Now, we note that we can compute the withdrawals using other variables reported in the 990:
$$\small{\text{Withdrawals} = \text{Other Expenditures} +\text{Administrative Expenses} +\text{Administrative Expenses} + \text{Grants and Scholarships}}.$$


To adjust for contributions and expenditures, we define the Compound Annual Growth Rate as
$$\small{\left( \frac{\text{End Value} + \sum_{i=1}^{t-1} \text{Withdrawals} - \sum_{i=1}^{t-1} \text{Contributions}  }{\text{Beginning Value}} \right)^{\frac{1}{t}}-1}$$

<!-- $$tiny{\left( \frac{\text{End Value} + \sum_{i=1}^{t-1} \text{Other Expenditures} +  \sum_{i=1}^{t-1}\text{Grants and Scholarships} +  \sum_{i=1}^{t-1} \text{Administrative Expenses} - \sum_{i=1}^{t-1} \text{Contributions}  }{\text{Beginning Value}} \right)^{\frac{1}{t}}-1}$$
-->

We visualize the compound growth rates for all companies in Figure \ref{fig:compound-growth}. Notably, San Francisco Ballet, Joffrey Ballet, and 

\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-3-1} \caption{\label{fig:compound-growth}Compound annual growth rates for all organizations compared to the compound annual growth rate for the S\&P 500 for three time periods. Not all companies are present in each plot, since not all companies have data going back the same number of years. Of note, year to year differences in the compound annual growth rate of the S\&P 500 are due to differences in companies' fiscal years.}\label{fig:unnamed-chunk-3}
\end{figure}

We see immediately in Figure \ref{fig:compound-growth} that some companies have a compound growth rate is indistinguishable from zero. This includes:

- Oregon Ballet: reported no investment earnings/losses for any year
- Harlem Ballet: investment earnings/gains were extremely small ($\pm 13$ dollars)
- First State Ballet Theatre: reported no investment earnings/losses for any year
- Eugene Ballet: only reported investment earnings/losses for 2020 and 2021
- American Repertory Ballet: reported no investment earnings/losses for any year

We see in Figure \ref{fig:annual-growth-endowment} that each of these companies annual growth rates are essentially zero when accounting for contributions and withdrawals.










### Where Endowments are Held








\begin{table}

\caption{\label{tab:unnamed-chunk-7}Organizations with $100\%$ of their Endowments in One Category for All Years on File}
\centering
\begin{tabular}[t]{l>{\raggedleft\arraybackslash}p{4cm}}
\toprule
Organization Name & Number of Years on File\\
\midrule
\addlinespace[0.5em]
\multicolumn{2}{l}{\textbf{Board designated or quasi-endowment}}\\
\hline
\hspace{1em}The Tallahassee Ballet & 6\\
\hspace{1em}Ballet Quad Cities & 2\\
\hspace{1em}Canyon Concert Ballet & 1\\
\addlinespace[0.5em]
\multicolumn{2}{l}{\textbf{Permanent endowment}}\\
\hline
\hspace{1em}Pittsburgh Ballet Theatre & 7\\
\hspace{1em}Dance Theatre of Harlem, Madison Ballet & 6\\
\hspace{1em}BalletMet & 5\\
\hspace{1em}Aspen Santa Fe Ballet, Ballet West & 4\\
\hspace{1em}New Mexico Ballet Company & 3\\
\hspace{1em}Oregon Ballet Theatre & 2\\
\hspace{1em}American Repertory Ballet, Colorado Ballet, Orlando Ballet & 1\\
\addlinespace[0.5em]
\multicolumn{2}{l}{\textbf{Temporarily restricted endowment}}\\
\hline
\hspace{1em}First State Ballet Theatre & 6\\
\hspace{1em}Ballet Des Moines & 2\\
\bottomrule
\end{tabular}
\end{table}

\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-8-1} \caption{\label{fig:endowment-type}The percent of endowments held in temporarily restricted endowment, permanent endowment, or board designated or quasi-endowment. The median across all companies by fiscal year is shown in red.}\label{fig:unnamed-chunk-8}
\end{figure}




\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-10-1} \caption{\label{fig:prop-most-variable} Proportions of endowments in each designated category over time for the 5 companies with the most variability.}\label{fig:unnamed-chunk-10}
\end{figure}








# Rankings 


## Beginning of Year Balance versus Contributions 

### Rank Plot

\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-11-1} \caption{\label{fig:balancecont} Comparing the rankings of beginning of year balance of the endowment to the ranking of contributions recieved.}\label{fig:unnamed-chunk-11}
\end{figure}

### Bar Plot

\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-12-1} \caption{\label{fig:balancecontbar} Comparing the proportion of years where a company ranked higher, lower, or the same in beginning of year balance compared to contributions received. A higher rank means a rank closer to 1, where 1 is the top possible rank.}\label{fig:unnamed-chunk-12}
\end{figure}



## Beginning of Year Balance versus Other Expenditures


\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-13-1} 


\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/contributions barplot-1} \caption{\label{fig:balanceexpbar} Comparing the proportion of years where a company ranked higher, lower, or the same in beginning of year balance compared to expenditures.}\label{fig:contributions barplot}
\end{figure}


## How ranks change over time 

## Ranking of Endowment Beginning of Year Balance 


\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-14-1} \caption{\label{fig:rank-endowments}Rank of the endowment beginning of year balance over time. The 15 companies with the most variability in ranking, defined as the mean difference in rankings between fiscal years, are shown in color. Names of all companies are on the right.}\label{fig:unnamed-chunk-14}
\end{figure}



\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-15-1} \caption{\label{fig:rank-endowments-color-contribution}Rank of the endowment beginning of year balance over time, where the color indicates the ranking of the mean contributions received over all years on file for the company.}\label{fig:unnamed-chunk-15}
\end{figure}




\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-16-1} \caption{\label{fig:rankings-contributions}The rankings of contributions over time, by organization.}\label{fig:unnamed-chunk-16}
\end{figure}


# Reporting of Endowments

\begin{table}

\caption{\label{tab:unnamed-chunk-17}Number of Companies that Reported an Endowment}
\centering
\begin{tabular}[t]{>{\raggedright\arraybackslash}p{10em}>{\raggedleft\arraybackslash}p{10em}>{\raggedleft\arraybackslash}p{10em}}
\toprule
 & Reported an Endowment & Did Not Report an Endowment\\
\midrule
\addlinespace[0.5em]
\multicolumn{3}{l}{\textbf{By Year}}\\
\hline
\hspace{1em}2014 & 6 & 1\\
\hspace{1em}2015 & 70 & 35\\
\hspace{1em}2016 & 79 & 37\\
\hspace{1em}2017 & 83 & 42\\
\hspace{1em}2018 & 96 & 40\\
\hspace{1em}2019 & 106 & 40\\
\hspace{1em}2020 & 83 & 40\\
\hspace{1em}2021 & 21 & 6\\
\addlinespace[0.5em]
\multicolumn{3}{l}{\textbf{\makecell[l]{Reported an Endowment\\at Least Once}}}\\
\hline
\hspace{1em} & 122 & 47\\
\bottomrule
\end{tabular}
\end{table}



# Compensation 




 

# Top Employees Compensation Compared to Other Employee Compensation 

* For total employee compensation - `CYSalariesCompEmpBnftPaidAmt: Salaries, other compensation, employee benefits (Part IX, column (A), lines 5–10)`.
* For top employee compensation - Schedule J, looking at total compensation




Only included companies with more than 5 observations.


\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-20-1} \caption{\label{fig:frac-comp} percent of the total compensation paid to employees that was paid to officers, directors, trustees, or key employees, as reported in Part IX of the Form 990. Highlighted in the first panel are the 10 companies that had the greatest change in the percent paid to C-Suite employees from the earliest year on file to the latest. Only companies with more than 45 employees and that reported complete data for more than 5 years are included.}\label{fig:unnamed-chunk-20}
\end{figure}


\begin{figure}[H]
\includegraphics{endowment_time_series_for_report_files/figure-latex/unnamed-chunk-21-1} \caption{\label{fig:csuite-comp-bar}}\label{fig:unnamed-chunk-21}
\end{figure}


















