# Even Salary Model

Even's pay protection turns variable pay into a steady, reliable income. This guaranteed income is known as the member's Even salary. Your task is to design a system to approve eligible Even customers for pay protection and decide on their Even salary and credit limit. The system should withhold approval from the riskiest customers. These cases are manually reviewed by an advisor.

All Even members are assigned a form of "credit limit". This limit is defined as the number of boosts we are willing to extend to a member at any given time. As an example, a member that has had two low paychecks in a row, and has received two paycheck boosts (but has not paid anything back), has two boosts outstanding. Once that member repays one of their boosts in full, they will have only 1 outstanding, effectively "unlocking" access to a boost for a future low paycheck. A very low risk member might have a boost limit of as many as 4 boosts. A very high risk member might start out only able to access 1 boost.

 You are free to use whatever tools you choose to solve the problem including external data.

## How Even Operates

To refresh your memory, here's how Even operates:

- When you start with the product, we calculate an Even salary for you.
- When you start using Even, you have a zero balance.
- Whenever you make less than your Even salary, we lend you the difference. Each time this happens, it becomes an outstanding paycheck boost.
- Whenever you make more than your Even salary, we make a payment from your checking account toward paying off any outstanding boosts. As an example, if your Even salary is $500, you owe $50, and have a check for $600, we would pay $50 toward your boosts. If you owed $150 in that scenario, you would pay back $100.
- If a customer doesn’t receive a paycheck at all they don’t receive a boost.
- A customer who leaves their job or is fired with a negative balance must still pay that balance. They have up to six months, or until they get a new job, to start paying back the balance.

## Input

Your program should read input for a customer from STDIN. The first line of the input file is the customer’s employerID. The following lines have the format `<paycheck date>,<paycheck amount>` where the date of the paycheck is in the format `YYYY-MM-DD`. The paychecks are provided in chronological order and it’s safe to assume that no paychecks will be missing from the list and there are no gaps in employment.

### Sample Input

```
5e1242f9-f17f-4691-9593-047cf385d92c
2016-03-01,290
2016-03-15,220
2016-03-29,250
```

## Output

Your program should write its output to STDOUT. The output should be a single line containing an approval decision, the Even salary and credit limit (number of boosts) in that order, separated by commas. The approval decision should be `1` when a customer is approved and `0` when the approval decision is to be escalated to an advisor. When the approval decision is `0` the other fields should be empty.

### Sample Output

Customer approved:
```
1,120,2
```

Customer not approved:
```
0,,
```

## Dataset

You will receive historical paycheck data from a subset of Even members to help you create a model. Entries take the following form:

| customerID | date | amount | employerID |
|---   |---   |---    |---   |
| 3263ff3a-d9be-492d-a3aa-190d6e2d3813 | 2015-12-28 | 223 | 5e1242f9-f17f-4691-9593-047cf385d92c |
| 3263ff3a-d9be-492d-a3aa-190d6e2d3813 | 2016-01-11 | 687 | 5e1242f9-f17f-4691-9593-047cf385d92c |


Each row represents information about a customer’s paycheck. Amounts have been rounded to the nearest dollar and dates are accurate to the nearest week.

