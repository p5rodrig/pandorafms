CREATE TABLE `tupdate_settings` ( `key` varchar(255) default '', `value` varchar(255) default '', PRIMARY KEY (`key`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `tupdate_settings` VALUES  ('current_update', '0'), ('customer_key', 'PANDORA-FREE'), ('keygen_path', '/usr/share/pandora/util/keygen'), ('update_server_host', 'www.artica.es'), ('update_server_port', '80'), ('update_server_path', '/pandoraupdate4/server.php'), ('updating_binary_path', 'Path where the updated binary files will be stored'), ('updating_code_path', 'Path where the updated code is stored'), ('dbname', ''), ('dbhost', ''), ('dbpass', ''), ('dbuser', ''), ('dbport', ''), ('proxy', ''), ('proxy_port', ''), ('proxy_user', ''), ('proxy_pass', '');
CREATE TABLE `tupdate_package` (  id int(11) unsigned NOT NULL auto_increment,  timestamp datetime NOT NULL,  description varchar(255) default '',  PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `tupdate` (  id int(11) unsigned NOT NULL auto_increment,  type enum('code', 'db_data', 'db_schema', 'binary'),  id_update_package int(11) unsigned NOT NULL default 0,  filename  varchar(250) default '',  checksum  varchar(250) default '',  previous_checksum  varchar(250) default '',  svn_version int(4) unsigned NOT NULL default 0,  data LONGTEXT default '',  data_rollback LONGTEXT default '',  description TEXT default '',  db_table_name varchar(140) default '',  db_field_name varchar(140) default '',  db_field_value varchar(1024) default '',  PRIMARY KEY  (`id`),  FOREIGN KEY (`id_update_package`) REFERENCES tupdate_package(`id`)   ON UPDATE CASCADE ON DELETE CASCADE ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `tupdate_journal` (  id int(11) unsigned NOT NULL auto_increment,  id_update int(11) unsigned NOT NULL default 0,  PRIMARY KEY  (`id`),  FOREIGN KEY (`id_update`) REFERENCES tupdate(`id`)   ON UPDATE CASCADE ON DELETE CASCADE ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
