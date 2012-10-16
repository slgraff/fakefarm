# PROBLEM 3

balance = 0
annualInterestRate = 0.2

new_balance = balance
monthly_interest = ( annualInterestRate / 12 )
payment = 10
step = 0.01

lower_bound = balance / 12
upper_bound = ( balance * ( 1 + monthly_interest ) ** 12 ) / 12 )


# FORMULAS

# Month 1
# b1 = ( b0 - p0 ) * ( 1 + r/12 )

# Month 2
# b2 = ( b1 - p1 ) * ( 1 + r/12 )

# PROBLEM 2

# Write a program that calculates the minimum fixed monthly payment needed in order pay off a credit card balance within 12 months. By a fixed monthly payment, we mean a single number which does not change each month, but instead is a constant amount that will be paid each month.

### ---------------
### Version 4
### --------------

# balance = 4773
# annualInterestRate = 0.2
# payment = 10
# step = 10
# epsilon = 10
# new_balance = balance

# while new_balance > 0:
#   for month in range(0,12):
#     new_balance = (new_balance - payment) * (1 + annualInterestRate / 12)
#   if new_balance <= epsilon:
#     break
#   else:
#     new_balance = balance
#     payment += step

# print "Lowest Payment: " + str(payment)


# guess & check method using while and if

# given that I have a balance of 5000
# if I pay the same amount each month of 10
# then it will give me a zero balance by 12 months
# if not, then I will increase the amount to pay
# and try to retai

# annualInterestRate = 0.2

# balance = 4773
# new_balance = balance

# minPay = 10

# while balance > 0:
#   for month in range(1,13):
#     new_balance = (new_balance - minPay) * (1 + annualInterestRate / 12)
#     if new_balance <= 0:
#       break
#   if new_balance <= 0:
#     balance = new_balance # What is this doing? Is this reseting the original variable?
#   else:
#     new_balance = balance # Curious how you know to switch this back. What is the thought process to develop this program design?
#     minPay += 10

# print "Lowest Payment: " + str(minPay)

# -----------------------------------------------
# Version 3
# ---------------------

# month = 0
# balance = 5000
# step = 10
# annualInterestRate = 0.2

# my_payment = balance * (1 + annualInterestRate) / 12

# balance = balance - my_payment

# monthly_balance = balance / 12

# while my_payment < monthly_balance:
#   my_payment += step
#   month += 1
#   print "Month: " + str(month)
#   print "My payment " + str(my_payment)
#   print "Balance " + str(new_balance)
#   print ""


# -----------------------------------------------
# Version 2
# ---------------------

# month = 0
# balance = 5000
# step = 10
# annualInterestRate = 0.2
# my_payment = balance * (1 + annualInterestRate) / 12
# new_balance = balance

# while new_balance > 0:
#   new_balance = (new_balance - my_payment)
#   month += 1
#   print "Month: " + str(month)
#   print "My payment " + str(my_payment)
#   print "Balance " + str(new_balance)
#   print ""


# -----------------------------------------------
# Version 1
# ---------------------
# for month in range(1,13):
#   new_balance = new_balance - my_payment

#   if new_balance > 0:
#     my_payment += step
#     version += 1
#   print "-------------------------------------------"
#   print "version" + str(version)
#   print "my_payment " + str(my_payment)
#   new_balance = balance

#   for month in range(1,13):
#     new_balance = new_balance - my_payment
#     print "month: " + str(month)
#     print "Amount paid: " + str(my_payment)
#     print "Balance: " + str(new_balance)

# PROBLEM 1
# Write a program to calculate the credit card balance after one year if a person only pays the minimum monthly payment required by the credit card company each month.

# For each month, calculate statements on the monthly payment and remaining balance, and print to screen something of the format:
# Month: 1
# Minimum monthly payment: 96.0
# Remaining balance: 4784.0

# A summary of the required math is found below:

# Monthly interest rate= (Annual interest rate) / 12
# Minimum monthly payment = (Minimum monthly payment rate) x (Previous balance)
# Updated balance each month = (Previous balance - Minimum monthly payment) x (1 + Monthly interest rate)

# def oneYear(balance, annualInterestRate, monthlyPaymentRate):
#   new_balance = balance
#   my_payment = monthlyPaymentRate * new_balance
#   total_paid = my_payment
#   month = 0

#   while month < 12:
#     month += 1
#     new_balance  = (new_balance - my_payment) * (1 +  (annualInterestRate / 12))
#     total_paid += my_payment
#     print "Month: " + str(month)
#     print "Minimum monthly payment: " + str(round(my_payment,2))
#     print "Remaining balance: " + str(round(new_balance,2))

#     my_payment = monthlyPaymentRate * new_balance

#   print "Total paid: " + str(round(total_paid,2))
#   print "Remaining balance: " + str(round(new_balance,2))

# # Calling the method
# oneYear(4213,0.2,0.04)
# oneYear(4842, 0.2, 0.04)

