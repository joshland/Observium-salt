observium:
  dbuser: observer 
  dbpass: Y0RvD_j@8V-3
  dbname: observium
  level:  10
  user:   obsadmin             # Admin is disabled by default
  pass:   MatterSplatter       # Password is required!
  users:  # observium.users creates these entities
    john:
      password: Ripper
      email: nothing@nowhere.com
      level: 10
    joshua:
      password: Jack
      email: nothing@nowhere.com
      level: 10
    cory:
      password: Unimpressed
      email: neverthere@nothere.com
      level: 1

#USER LEVELS:
#  0 - Disabled (This user disabled)
#  1 - Normal User (This user has read access to individual entities)
#  5 - Global Read (This user has global read access)
#  7 - Global Secure Read (This user has global read access with secured info)
#  8 - Global Secure Read / Limited Write (This user has secure global read access with scheduled maintenence read/write)
#  10 - Administrator (This user has full administrative access)
