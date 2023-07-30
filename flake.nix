{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs, ... }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";

    inherit (pkgs.lib.lists) filter foldl' elem map drop concatLists toList;
    inherit (pkgs.lib.strings) splitString;
    inherit (pkgs.lib.attrsets) attrValues mapAttrs;
  in {
    lib = {
      withComments = xs: cs: filter (x: foldl' (a: c: a && elem c (drop 2 (splitString " " x))) true (toList cs)) xs;
    };
    pubKeys = {
      keys = {
        freyja = {
          host = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCu2m4IsRA4wsuvkP8wOR6Gx+Ri3cvWOUzzN9sczatW4QDyKrCJscEf7KVMNU032dgNAy8Mf+DmafPqaa6mBv6P07EuB5cO334EnlodyBFNsUnEvgOWcGkf1qikXN7iIoxbSJVN4CVABxO08yKI1qMtU94l09QZT1kcI3q2GSqwhT8bOO66UUqj0I5IHHQYJ83uDMseIOpDT12d2nYjPwH+3pQit4cbEHEJ2QDPFmvuLqHG/TJIXc/GD0KHd+/cW36W+2kOtuyvfE9C+U4lJz17CxN9s2ry0yVBfKJEovt1hkIVfs2N20/RnC4IqPxWxSp2PRtAzn5u5eqvOe+U+SZsrniwEURM1160pCStzepl263GuFEl2h4KlOc1TTioqURsnSua5YtTVrj5TT/Ka4XhVPNQTukWjpflOdLLszvTYv2asv5UcKv+6EHevdKtwNSiDDZtuG9TnQ89bsfo/OE3+WQlExpSy7cp2AeH6zPbP+aboeocybeoedv7ptHm/Pz351JuIyHZqm9R2zH8FS4tFgvjbEJPu3ubvbjG7ubxyDZ0cbsk5PRcWD55xox9lPQHnhRcJ2QWTkylEp9bWEl3F4VZa9mDNRa4+6cpD6/1VEjuD6C9qm+Wq58DjG+X0OUNJFpB3oHWIaj31iWhor2a+mMqNwDZCfc3T69hi8KtwQ== rsa age"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOaFB9I6cS8iWlL7IRPaynuHzrWbLS/fnXSIQ2P7ml/m ed25519 age"
          ];
          users.chloe = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBhiyE9bWby5TFXruner51NhKMQ3BPU0c038J6Aw2rD9 ed25519 git platonic home age" ];
        };
        guinan = {
          host = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHsaQnMa8tRtdF6Ou4VYDXcv4fcyCnJnvFe1rRu4OkxXXDUxvN5XsZEtMPYOCcwysV6si7K6wlg1SrijmV9T7ZHzJyL6PFHXr8KrNfySD7gIceF5PWsEyQFSIw5nP8E9DmuaCDQQe2GlbV43RNmoXeZJLBN8/vis76MQ4dPzYkc3xpg0q1GGLdu3RyWsuapmU3rbFym138nVxWt8VVVNFWDJVLYV8lFLUsZuxsNM84Cc1Xm5r8rVJ1nqCSMGaChlpUrIwEvYeYqbwaP4xrUbRVs0h+rvUxwOBencVEISsemOw3NX2HFsY9SxiDb44uHRH+P5tv7622c+0iyUfsI+b2G1iykyMtIeRC265b9aD/1vUKnnUE9lrX0uk+Ysy3u4wXzD8E4NG3gB1LgL4OCRkSBZhAcF1QyZH4nmEF78fW3AjviWn+mbaOJu4mxzkO123t+LbS8PHadt6Iz2CDKPeLJcRNB/scXWCQj1O401+FEH1I2sL//Z0RDlf71Fk3nKnoHoKSa6Bb8YbcYpQnThglSznxnuJqp5rG4yGstFgoOIsSg9nHivjEHeNX+oTQl3HRsj1aZwQo55UORLaCZ2Fq8W5c1rL7IhMaI1fKPG0XaI60xDzTRtl5Ubm4WtNAhE+cKk2F60rhjSipv5OA/LOCL7I8mJ7GgYoefdlxieFV4Q== rsa age nccd"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFY+LZwVOUE9vl+umM1C/l7woqvB0oZGSRDse2PUV2YH ed25519 age nccd"
          ];
          users = {
            chloe = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL9Ykx7Qq53UqoFVZFMmCLiDU4qFzzGNjkyCg1bIbjQ/ ed25519 home age" ];
            guinan = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIDAwYXdxw2VEZSBpRvvi58pkXZaESTkDlg+z5nr2sw6 ed25519 home age" ];
          };
        };
        lwaxana = {
          host = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDqviAWKD5xAsR6BK6EcUR02kmoQyZfxbJebHXcMPKF1JA2sKYerhGf9Yhgmq+IDezR5YLGf1GEUE7NN5y2fgBNoIK6X4NpW3ttrC1pKSkq5swOvyEM4yU0W0VTOl1xut2XmfmBCeYgqSxiDze/W/Cgp+6azm2BgG/eJtAsEJzI/W7Op35YA0c1vegsXO2qewXdLqcqkFqok9PJdmh3RVlWxWtx9xcrb5CwrUqHHOiXV15WUvrIqb0ws3VE9rpq//23zaCdLmNkCgO+ISR6Gk3HZOAQp7BzXfPvNoRZvYxZ9ZgdopRHtE2OWVdN8WC2DU+tdwUZGGBDO6ao0LP3ElXWEBYtzaZUtkoL8aIRDrAC8hOWl/DS31kMDfsB2AkqHarK1DwJqyvae3N7Ac8vuGafbXWAyWHeDJMb3idpOKwH99kAMlQ4VoADvqM/evJ9d0q744u9Ymh8VE/ANe6WsesR5MvGWrpl4ljwSwKgwjB45tSx0Vz23c9w/E2IuM071AOpS9KU49b1anl42hGESfcZbfm06aOI/TJhV4IYUj4W7ZAdn8ajp0YidWQ2Czgix+a/Pkf6jukNr/f/L6/gE/J7/8BEJyI6MPh21zOjH3ME6fG96mc/0GcnJFmh9fUZvDifLSA2ME1FhcCHrMaNYL9SUtjTDSA2H+PIlxzJRV511w== rsa age nccd"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG/RyVYMCgNltID660aOYpcupKMaLbGRbKfi+VErt4B/ ed25519 age nccd"
          ];
          users.chloe = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgPiKbb1NfTbHNK8+XTYQ6CeAUlMcB+ukqyww1owU4s chloe@lwaxana ed25519 home age" ];
        };
        marla-aster = {
          host = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoVy6bHQTYxOi5H8MYAX7ccFH8jwWvDm4FCdOuucUJ/8f0bMMcuyJRGFsKl4ScMWup/1X42+RaqkWXYq8Chpq3bFqdZDPj4w8g1CwzensUrvOnhUsT50ALcYvtVj/xpcWowsn2wyrSWXVFnyquM6UjoAHwECX7X2vF6PdJRpVnyeRXZVlzJZNtzYDbnNJ4NMte8gmRqs1tSYdZ7dzQdAoCStuycAvdhl6VoUuKJ6N37HG7ams9pxXBu+oq9q6/QNxxSjUJAW9VqhUj8KHN39wEbh26DzPswfIxIxgRlW39wNTxVpa0/DAh4b+2Pc8GYzdmd7eJEw6cT4t+POPDh7ECFhDqGpog2ts74eTcP4zgE4M5o5pEn/bJy/tUzwHTElRVbLuTsVRYjh5TNlQn/nPSSYjhgXT40D0uS9zhnnw+cTHS1CM2Ad7MB8Yv9GTf5gcDuxTE0Ltju6cl73JoUFuuwUqgmoW2YrjoCrrDWMmFSJiuR5A/qlXAhu+PF80w3vJZe+ht5VYNDZEb0PR3tcjmFYqjk6UixZ8qLbiQubedbPnBsWLqox8bfAmwzhk5u2yKMhpb5yjIMRyxZKtI4UnL+jY47kIiKq8ae3vnwVH7h/TMrW18pQYAGFp5xCIK0kBTDFRo5ohAyKs5BhaA3SCZDeVD+PvvddK57XzwCtmMfw== rsa age nccd"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICWzxzTn6XrpwalI5KriObT4y1eRz7l9rMv8Ka4kX3ZX ed25519 age nccd"
          ];
          users.chloe = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJmBkkqd1KRsyDVozP+SV1Wz4Jq+u/YY4EmUSF/F9Qql chloe@marla-aster ed25519 home age" ];
        };
      };
      hosts = concatLists (attrValues (mapAttrs (_: v: v.host or [ ]) self.pubKeys.keys));
      users = concatLists (attrValues (mapAttrs (_: v: concatLists (attrValues v.users or [ ])) self.pubKeys.keys));
      all = self.pubKeys.hosts ++ self.pubKeys.users;
    };
  };
}
