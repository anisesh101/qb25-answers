library(tidyverse)
library(broom)

# Load data
my_tibble1 <- read.csv("~/qb25-answers/Week 5/aau1043_parental_age.csv")
my_tibble2 <- read.csv("~/qb25-answers/Week 5/aau1043_dnm.csv")

my_tibble1 <- as_tibble(my_tibble1)
my_tibble2 <- as_tibble(my_tibble2)

proband_count <- my_tibble2 %>%
  filter(Phase_combined %in% c("father", "mother")) %>%
  group_by(Proband_id) %>%
  summarize(
    Mother_DNM_Count = sum(Phase_combined == "mother"),
    Father_DNM_Count = sum(Phase_combined == "father"),
    .groups = "drop"
  )

combined_tibble <- left_join(my_tibble1, proband_count, by = "Proband_id")

#---------------------------------------------------------------------

#Exercise 2.1

#1) Create a scatter plot of the count of maternal DNMs vs. maternal age → save as ex2_a.png

ggplot(data = combined_tibble, 
       aes(x = Mother_DNM_Count, y = Mother_age)) + 
  geom_point(alpha = 0.6)
  ggsave("ex2_a.png")

#2) Create a scatter plot of the count of paternal DNMs vs. paternal age → save as ex2_b.png

ggplot(data = combined_tibble, 
       aes(x = Father_DNM_Count, y = Father_age)) + 
  geom_point(alpha = 0.6)
  ggsave("ex2_b.png")
  
#Exercise 2.2

# Fit a simple linear regression model relating maternal age to the number of maternal de novo mutations.

lin_reg_maternal <- lm(data = combined_tibble, formula = Mother_DNM_Count ~ Mother_age)
summary(lin_reg_maternal)

#Exercise 2.3

lin_reg_paternal <- lm(data = combined_tibble, formula = Father_DNM_Count ~ Father_age)
summary(lin_reg_paternal)


# Exercise 2.4

intercept <- coef(lin_reg_paternal)[1]
slope <- coef(lin_reg_paternal)[2]

predicted_dnms <- intercept + slope * 50.5
predicted_dnms

# 78.7 estimated DNMs for a 50.5 year old man.

# Exercise 2.5

selected_data <- combined_tibble %>%
  select(Mother_DNM_Count, Father_DNM_Count) %>%
  pivot_longer(cols = everything(), names_to = "Parent", values_to = "DNM_Count") %>%
  mutate(Parent = recode(Parent, 
                         "Mother_DNM_Count" = "Maternal", 
                         "Father_DNM_Count" = "Paternal"))

ggplot(selected_data, aes(x = DNM_Count, fill = Parent)) +
  geom_histogram(position = "identity", alpha = 0.5, bins = 30) +
  scale_fill_manual(values = c("Maternal" = "blue", "Paternal" = "red")) +
  labs(title = "Distribution of Maternal vs Paternal DNMs",
       x = "DNMs Count", y = "Frequency", fill = "Parent") +
  theme_minimal()
  ggsave("ex2_c.png")

# Exercise 2.6

t.test(combined_tibble$Mother_DNM_Count, combined_tibble$Father_DNM_Count, paired = TRUE)

#---------------------------------------------------------------


#Exercise 3.1

nsf_terminations <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-05-06/nsf_terminations.csv')

#Exercise 3.2

state_summary <- nsf_terminations %>%
  group_by(org_state) %>%
  summarize(
    n_grants = n(),
    total_funding = sum(usaspending_obligated, na.rm = TRUE)
  ) %>%
  arrange(desc(n_grants))


ggplot(head(state_summary, 10), aes(x = reorder(org_state, n_grants), y = n_grants)) +
  geom_col(fill = "blue") +
  coord_flip() +
  labs(title = "Top 10 States by Number of NSF Grants Terminated (2025)",
       x = "State",
       y = "Number of Grants") +
  theme_minimal()
ggsave("ex4_top_states_terminated.png")

# Exercise 3.3

lm_fit <- lm(total_funding ~ n_grants, data = state_summary)
summary(lm_fit)

ggplot(state_summary, aes(x = n_grants, y = total_funding)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, color = "blue") +
  labs(title = "Funding Terminated vs. Number of Grants Terminated by State",
       x = "Number of Grants Terminated",
       y = "Total Funding Terminated (USD)") +
  theme_minimal()
ggsave("ex4_lm_funding_vs_grants.png")