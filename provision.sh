sudo sh << COMMAND
  # Install packages
  yum install -y \
    gcc-c++ \
    git \
    glibc-headers \
    libyaml-devel \
    openssl-devel \
    readline \
    readline-devel \
    zlib \
    zlib-devel \
  ;

  # Install rbenv
  git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
  echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile
  echo 'export PATH="\${RBENV_ROOT}/bin:\${PATH}"' >> /etc/profile
  echo 'eval "\$(rbenv init -)"' >> /etc/profile
  git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

  # Install ruby
  source /etc/profile
  rbenv install -v 2.7.0
  rbenv rehash
  rbenv global 2.7.0

  # Install DB dependent packages
  amazon-linux-extras install -y postgresql11
  yum install -y postgresql-devel

  # Install Node
  curl -sL https://rpm.nodesource.com/setup_12.x | bash
  yum install --enablerepo=nodesource -y nodejs
  npm install -g yarn
COMMAND
