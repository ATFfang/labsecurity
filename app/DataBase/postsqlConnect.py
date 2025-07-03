import psycopg2
import json


class Database:
    def __init__(self, name, username, password, host, port):
        self.name = name
        self.username = username
        self.password = password
        self.host = host
        self.port = port
        self.post_conn = None
        self.post_cursor = None

    def __str__(self):
        condition = "未连接"
        if self.post_conn is not None and self.post_cursor is not None:
            condition = "已连接"
        return (f"数据库：{self.name}，用户：{self.username}，"
                f"密码：{self.password[0]+'*' * (len(self.password)-2)+self.password[-1]}，"
                f"host：{self.host}，port={self.port}，"
                f"数据库状态：{condition}。")

    # 连接数据库
    def connect(self):
        self.post_conn = psycopg2.connect(database=self.name, user=self.username, password=self.password,
                                     host=self.host, port=self.port)
        self.post_cursor = self.post_conn.cursor()

        print("数据库连接成功")

    # 关闭数据库连接
    def close(self):
        self.post_cursor.close()
        self.post_conn.close()

    # 查询数据库内容
    def check(self):
        if self.post_cursor is None:
            print("请先执行connect()函数")
        else:
            self.post_cursor.execute("SELECT schema_name FROM information_schema.schemata;")
            schemas = [row[0] for row in self.post_cursor.fetchall()]

            self.post_cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';")
            tables = [row[0] for row in self.post_cursor.fetchall()]

            print("数据库包含schemas" + str(schemas))
            print("数据库包含tables" + str(tables))

    # 执行查询语句
    def select(self, sql):
        self.post_cursor.execute(sql)
        data = self.post_cursor.fetchall()  # 获取所有数据
        column_names = [desc[0] for desc in self.post_cursor.description]
        data_dict_list = [dict(zip(column_names, row)) for row in data]
        json_data = json.dumps(data_dict_list)
        return json_data


    # 执行更改数据库的查询语句
    def sql_execute(self, sql):
        self.post_cursor.execute(sql)
        self.post_conn.commit()
        # self.post_cursor.close()

    

