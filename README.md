# Play Store Data Analysis

Welcome to the Play Store Data Analysis repository! This project focuses on analyzing Play Store install data to assist new game development studios in selecting the most promising game categories based on player base size. By examining gaming data, we aim to provide actionable insights into the top game categories and their popularity, helping studios make informed decisions about their game development strategies.

## Table of Contents

1. [Introduction](#introduction)
2. [Queries and Analysis](#queries-and-analysis)
   - [1. Top 5 Game Categories by Player Base Size](#1-top-5-game-categories-by-player-base-size)
   - [2. Distribution of Player Base Across Game Categories](#2-distribution-of-player-base-across-game-categories)
   - [3. Average Ratings for Top Game Categories](#3-average-ratings-for-top-game-categories)
   - [4. Most Popular Games Within Each Top Category](#4-most-popular-games-within-each-top-category)
   - [5. Trend Analysis of Game Installs Over Time](#5-trend-analysis-of-game-installs-over-time)
3. [Conclusion](#conclusion)

## Introduction

This repository is dedicated to analyzing Play Store install data to identify key trends and insights for game development studios. The analysis focuses on the top game categories and their player base sizes to provide valuable guidance on which game genres are most likely to succeed in the current market.

## Queries and Analysis

### 1. Top 5 Game Categories by Player Base Size

```sql
SELECT category, SUM(installs) AS total_installs
FROM playstore_data.games
GROUP BY category
ORDER BY total_installs DESC
LIMIT 5;
