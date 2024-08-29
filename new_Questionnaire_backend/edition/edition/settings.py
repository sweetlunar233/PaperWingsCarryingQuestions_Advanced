"""
Django settings for edition project.

Generated by 'django-admin startproject' using Django 5.1.

For more information on this file, see
https://docs.djangoproject.com/en/5.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.1/ref/settings/
"""

from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "django-insecure-9g90akho_@f97b4mbssdt1pe34@+ic3ldnk#hgjqhje2)1yfs_"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# ALLOWED_HOSTS = ['localhost', '127.0.0.1','82.156.88.4']
ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = [
    #"django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",

    'edition_project',

    'corsheaders',  #跨域add
    'rest_framework', 

    'drf_spectacular',  # 接口文档 swagger
]

# Consul配置信息
CONSUL_HOST = '127.0.0.1'
CONSUL_PORT = 8500

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    'corsheaders.middleware.CorsMiddleware',  # 添加这一行
    "django.middleware.common.CommonMiddleware",
    #"django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

# CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CORS_ALLOW_ALL_ORIGINS = True
# CORS_ALLOWED_ORIGINS = [
#     'http://82.156.88.4:31234',  # 允许Vue应用的域名访问
#     'http://82.156.88.4:31235',
#     'http://82.156.88.4:7000', 
#     'http://82.156.88.4:7001', 
#     'http://82.156.88.4:7002', 
#     'http://127.0.0.1:7000',
#     'http://127.0.0.1:7001',
#     'http://127.0.0.1:7002',
# ]

CORS_ALLOW_METHODS = [
    'GET',
    'POST',
    'OPTIONS',
]

CORS_ALLOW_HEADERS = [
    '*',
]

ROOT_URLCONF = "edition.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "edition.wsgi.application"


# Database
# https://docs.djangoproject.com/en/5.1/ref/settings/#databases

DATABASES = {
    # "default": {
    #     'ENGINE': 'django.db.backends.mysql',
    #     'HOST': 'bj-cynosdbmysql-grp-g9kxigho.sql.tencentcdb.com',  # 数据库主机
    #     'PORT': 23531,  # 数据库端口
    #     'USER': 'buaa21374125',  # 数据库用户名
    #     'PASSWORD': 'BUaa21374125',  # 数据库用户密码
    #     'NAME': 'edition_db'  # 数据库名
    # },

    #容器跑
    "default": {
        'ENGINE': 'django.db.backends.mysql',
        'HOST': 'my-edition-db-service',  # 数据库主机
        'PORT': 3306,  # 数据库端口
        'USER': 'root',  # 数据库用户名
        'PASSWORD': '123456',  # 数据库用户密码
        'NAME': 'edition_db'  # 数据库名
    },

    # #本地跑
    # "default": {
    #     'ENGINE': 'django.db.backends.mysql',
    #     'HOST': '127.0.0.1',  # 数据库主机
    #     'PORT': 3301,  # 数据库端口
    #     'USER': 'root',  # 数据库用户名
    #     'PASSWORD': '123456',  # 数据库用户密码
    #     'NAME': 'edition_db'  # 数据库名
    # }

    # 测试使用数据库
    'test': {
        # 'ENGINE': 'django.db.backends.mysql',
        # 'HOST': 'bj-cynosdbmysql-grp-g9kxigho.sql.tencentcdb.com',  # 数据库主机
        # 'PORT': 23531,  # 数据库端口
        # 'USER': 'buaa21374125',  # 数据库用户名
        # 'PASSWORD': 'BUaa21374125',  # 数据库用户密码
        # 'NAME': 'edition_db',  # 数据库名

        #容器跑
        'ENGINE': 'django.db.backends.mysql',
        'HOST': 'my-edition-db-service',  # 数据库主机
        'PORT': 3306,  # 数据库端口
        'USER': 'root',  # 数据库用户名
        'PASSWORD': '123456',  # 数据库用户密码
        'NAME': 'edition_db',  # 数据库名

        'TEST': {
            'NAME': 'edition_db',
            'MIRROR': 'default',  # 设置为'default'来避免Django试图创建或销毁数据库
        }
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.1/topics/i18n/

LANGUAGE_CODE = "en-us"

TIME_ZONE = "UTC"

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.1/howto/static-files/

STATIC_URL = "static/"

# Default primary key field type
# https://docs.djangoproject.com/en/5.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"
