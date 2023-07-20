import os
import sys
import time
import psycopg2

def wait_for_postgres():
    max_attempts = 20
    attempt = 1
    while True:
        try:
            with psycopg2.connect(
                    dbname=os.environ.get('DATABASE_NAME'),
                    user=os.environ.get('DATABASE_USER'),
                    password=os.environ.get('DATABASE_PASSWORD'),
                    host=os.environ.get('DATABASE_HOST'),
                    port=os.environ.get('DATABASE_PORT')
            ) as conn:
                conn.autocommit = True
            print("Database connection established")
            print("------------------")
            return
        except psycopg2.OperationalError as e:
            print(f"Could not connect to database: {e}")
            print("------------------")
            attempt += 1
            if attempt > max_attempts:
                sys.exit("Maximum number of attempts reached")
                print("------------------")
            time.sleep(5)


if __name__ == '__main__':
    wait_for_postgres()
    print("Application starting! ... ")
    print("------------------")
