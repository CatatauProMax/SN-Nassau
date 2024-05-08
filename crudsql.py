import mysql.connector

conexao = mysql.connector.connect(
    host="localhost",
    port="3306",
    user="root",
    password="root",
    database="lol"
)

cursor = conexao.cursor()

def criar_champs(champions, hp, hp_add, mp, ad, ar, mr, ms, ranged):
    sql = "INSERT INTO champs (champions, hp, hp_add, mp, ad, ar, mr, ms, ranged) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
    valores = (champions, hp, hp_add, mp, ad, ar, mr, ms, ranged)
    cursor.execute(sql, valores)
    conexao.commit()
    print("Champs criado com sucesso!")

def listar_champs(champis):
    sql = "SELECT * FROM champs WHERE champions LIKE %s"
    valores = (champis,)
    cursor.execute(sql, valores)
    champs = cursor.fetchall()
    for champ in champs:
        print(champ)

def atualizar_champs(id, champions, hp, hp_add, mp, ad, ar, mr, ms, ranged):
    sql = "UPDATE champs SET champions = %s, hp = %s, hp_add = %s, mp = %s, ad = %s, ar = %s, mr = %s, ms = %s, ranged = %s WHERE id = %s"
    valores = (champions, hp, hp_add, mp, ad, ar, mr, ms, ranged, id)
    cursor.execute(sql, valores)
    conexao.commit()
    print("Champs atualizado com sucesso!")

def excluir_champs(id):
    sql = "DELETE FROM champs WHERE id = %s"
    valores = (id,)
    cursor.execute(sql, valores)
    conexao.commit()
    print("Champs excluído com sucesso!")

# criar_champs("briar", 500, 123, 321, 27, 40, 31, 345, 551)
listar_champs("briar")
