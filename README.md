route53-updater
===================================

# Overview
Route53をDDNS的に使用するためのタスクです。

## Install

```
# yum install python-devel python-pip
# pip install httplib2 boto ansible
```


## Usage
site.yml内のzone_name, record_nameを用途に合わせて変更して使用します。
(TODO:外部ファイルで定義するように変更する)

```
$ cat > ~/.boto <<EOT
$ [Credentials]
$ aws_access_key_id = XXXXXXXXX
$ aws_secret_access_key = XXXXXXXXXXXXXXXXX
$ EOT
$ cat > inventory <<EOT
$ 127.0.0.1
$ EOT
$ ansible-playbook -i inventory site.yml
```


## Author

[tri-star](https://github.com/tri-star)

