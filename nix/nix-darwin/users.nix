{ local, ... }:
{
  users.users.${local.userName} = {
    name = local.userName;
    home = local.homeDirectory;
  };
}
