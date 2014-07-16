 class site::users {
      # Declaring a dependency: we require several shared groups from the site::groups class (see below).
      Class[site::groups] -> Class[site::users]

      # Setting resource defaults for user accounts:
      Pe_accounts::User {
        shell => '/bin/zsh',
      }
      pe_accounts::user {'optimus':
        comment => 'Optimus Prime',
        uid => '1109',
        gid => '1109',
        sshkeys => ['ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDC+hKPqoORhCEAgnDaVAv5Mpk7z1Dm6CBzp0RWPgeZKBaTnlsv2GgR31CfDr9scJARGlxImYOjOoy/AplUyq6QfuG8LkA8Z76b/MVMTXAF5AkSxk+ekXAjvSauiQxexpnu3zhEMMmB5qk7Ku0Tho0O1HMkUG74dramtSoTEuYH7ITpOTXVhJY5Bnh3ujbVznX58s6CWMVRQ/8ZlbAh2364ako+vJx4v+cgZVaUuyb8tqDFLmpOhY6UWm2O0s91xdDYlCUcBVt5OyxOrLQJCd4NhkcNTgl0LdfzzBpmczqu78L73K7OiLqW/+8dmZnLzVWEfGbjtkH/NYqiv9xooPV optimus@puppet-master'],
      }

    # /etc/puppetlabs/puppet/modules/site/manifests/groups.pp
    class site::groups {
      # Shared groups:

      Group { ensure => present, }
      group {'developer':
        gid => '3003',
      }
