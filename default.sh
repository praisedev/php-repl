mkdir Work
cd Work
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-cgi_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-curl_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-gd_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-gmp_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-json_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-mysql_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-opcache_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-readline_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-recode_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-sqlite3_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-tidy_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-xml_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-xmlrpc_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/php7.2/libphp7.2-embed_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/php7.2/php7.2-bcmath_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/php7.2/php7.2-bz2_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/php7.2/php7.2-fpm_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/php7.2/php7.2-imap_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/php7.2/php7.2-mbstring_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/php7.2/php7.2-phpdbg_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/php7.2/php7.2-zip_7.2.3-1ubuntu1_amd64.deb
for Module in $( ls php*.deb )
do
	dpkg -x $Module .
done
mkdir ../PHPModules/ # Made for PHP libraries
cp usr/lib/php/*/* ../PHPModules/
cd ../ # Changing work dir
mv PHPModules/mysqlnd.so PHPModules/A-mysqlnd.so # Only for change sequence (mysqlnd.so should be loaded before mysqli.so)
echo 'extension=pdo.so' > php.ini
for Module in $( ls PHPModules/* )
do
	echo "extension=$Module" >> php.ini
done
echo 'run = "php -c php.ini -S 0.0.0.0:8000 -t folder/"' > .replit
rm -R Work
