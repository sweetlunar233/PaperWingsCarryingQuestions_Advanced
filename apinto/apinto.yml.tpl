# 数据文件放置目录
data_dir: /var/lib/apinto

# pid文件放置地址
pid_dir: /var/run/apinto/

# 日志放置目录
log_dir: /var/log/apinto

# socket放置目录
socket_dir: /tmp/apinto

# apinto运行配置地址
config: /etc/apinto/config.yml

# 扩展仓库目录
extends_dir: /var/lib/apinto/extenders/

# 错误日志文件名
error_log_name:  error.log

# 错误日志等级
error_log_level: error

# 错误日志过期时间，默认单位为天，d|天，h|小时
error_log_expire: 7d

# 错误日志切割周期，仅支持day、hour
error_log_period: day