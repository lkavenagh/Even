input = read.csv(file = 'sampleinput.csv', skip = 1, header = F)
names(input) = c('date', 'amount')
custID = as.character(read.table(file = 'sampleinput.csv', nrows = 1)$V1[1])

dat = read.csv(file = 'paychecks.csv')
dat$customerID = as.character(dat$customerID)
dat$employerID = as.character(dat$employerID)

users = unique(dat$customerID)
employers = unique(dat$employerID)
dat[dat$customerID == users[51],]
dat[dat$employerID == '176ab54b-bb1a-4616-a3da-282fa90caa77',]

out = data.frame(customerID = c(), mean_pay = c(), sd_pay = c(), times_above = c(), times_below = c(), average_cycle_days = c())
for (user in users) {
  idx = dat$customerID == user
  payments = dat$amount[idx]
  dates = as.Date(dat$date[idx])
  if (sum(idx) > 1) {
    out = rbind(out, data.frame(
      customerID = user,
      mean_pay = mean(payments),
      sd_pay = sd(payments),
      times_above = sum(payments > mean(payments)),
      times_below = sum(payments < mean(payments)),
      average_cycle_days = mean(diff(dates)),
      cycle_variance = as.numeric(quantile(diff(dates), 0.9) - quantile(diff(dates), 0.1)) / as.numeric(quantile(diff(dates), 0.5))
    ))
  }
}