class whmcs {
  mysqldb { $whmcsMySqlDbName:
    user     => $whmcsMySqlDbUsername,
    password => $whmcsMySqlDbPassword,
    require => Exec["set-mysql-password"]
  }
}