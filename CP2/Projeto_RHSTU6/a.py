import random
from faker import Faker
lines = []

tipo =["CELULAR", "RESIDENCIAL"]
status = ["I", "A"]
tipo_email = ["gmail", "hotmail", "outlook"]
for i in range(1, 136, 2):
    # ddd = random.randint(11, 99)
    # numero = "9" + str(random.randint(11111111, 99999999))
    fake = Faker()
    names = fake.unique.first_name()
    email = random.choice(tipo_email)
    for j in range(2):

        lines.append(f"INSERT INTO T_RHSTU_EMAIL_PACIENTE VALUES ({i}, {i+ j}, '{names.lower()}@{email}.com', '{email}', '{random.choice(status)}');\n")

with open('o.sql', 'w', encoding='utf-8') as f:
    for l in lines:
        f.write(l)

