# =============================================================================
# sales_summary.R
# Author : Nadeeka (Student ID: 664430944)
# Course : BDA400 - Data Science Tools and Techniques
# Purpose: Generate a SYNTHETIC retail sales dataset, summarise revenue by
#          region and product category, and save a table and a chart.
#
# AI Assistance Declaration: I used Claude (Anthropic, Opus 5.5) for comment
# wording and layout suggestions. All code was run and checked by me in R 4.6.1.
# =============================================================================

library(dplyr)
library(ggplot2)

# ---- 1. Settings -------------------------------------------------------------
set.seed(400)                     # makes the synthetic data reproducible
n_orders  <- 500
data_dir  <- "data"
out_dir   <- "output"
dir.create(data_dir, showWarnings = FALSE)
dir.create(out_dir,  showWarnings = FALSE)

# ---- 2. Create synthetic data ------------------------------------------------
sales <- data.frame(
  order_id   = sprintf("ORD-%04d", 1:n_orders),
  order_date = sample(seq(as.Date("2026-01-01"), as.Date("2026-06-30"), by = "day"),
                      n_orders, replace = TRUE),
  region     = sample(c("East", "West", "North", "South"), n_orders, replace = TRUE),
  category   = sample(c("Furniture", "Office Supplies", "Technology"), n_orders,
                      replace = TRUE, prob = c(0.3, 0.45, 0.25)),
  units      = sample(1:10, n_orders, replace = TRUE),
  unit_price = round(runif(n_orders, min = 5, max = 250), 2)
)
sales$revenue <- round(sales$units * sales$unit_price, 2)

write.csv(sales, file.path(data_dir, "synthetic_sales.csv"), row.names = FALSE)

# ---- 3. Summarise ------------------------------------------------------------
region_summary <- sales %>%
  group_by(region) %>%
  summarise(
    orders        = n(),
    total_units   = sum(units),
    total_revenue = sum(revenue),
    avg_order     = round(mean(revenue), 2),
    .groups = "drop"
  ) %>%
  arrange(desc(total_revenue))

category_summary <- sales %>%
  group_by(region, category) %>%
  summarise(total_revenue = sum(revenue), .groups = "drop")

write.csv(region_summary, file.path(out_dir, "region_summary.csv"), row.names = FALSE)

# ---- 4. Visualise ------------------------------------------------------------
p <- ggplot(category_summary, aes(x = region, y = total_revenue, fill = category)) +
  geom_col(position = "dodge") +
  labs(
    title = "Revenue by Region and Category (synthetic data)",
    x = "Region", y = "Total revenue ($)", fill = "Category"
  ) +
  theme_minimal()

ggsave(file.path(out_dir, "revenue_by_region.png"), p, width = 8, height = 5, dpi = 120)

print(region_summary)
message("Done: files written to '", data_dir, "/' and '", out_dir, "/'.")
