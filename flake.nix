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
        ran = {
          host = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHsaQnMa8tRtdF6Ou4VYDXcv4fcyCnJnvFe1rRu4OkxXXDUxvN5XsZEtMPYOCcwysV6si7K6wlg1SrijmV9T7ZHzJyL6PFHXr8KrNfySD7gIceF5PWsEyQFSIw5nP8E9DmuaCDQQe2GlbV43RNmoXeZJLBN8/vis76MQ4dPzYkc3xpg0q1GGLdu3RyWsuapmU3rbFym138nVxWt8VVVNFWDJVLYV8lFLUsZuxsNM84Cc1Xm5r8rVJ1nqCSMGaChlpUrIwEvYeYqbwaP4xrUbRVs0h+rvUxwOBencVEISsemOw3NX2HFsY9SxiDb44uHRH+P5tv7622c+0iyUfsI+b2G1iykyMtIeRC265b9aD/1vUKnnUE9lrX0uk+Ysy3u4wXzD8E4NG3gB1LgL4OCRkSBZhAcF1QyZH4nmEF78fW3AjviWn+mbaOJu4mxzkO123t+LbS8PHadt6Iz2CDKPeLJcRNB/scXWCQj1O401+FEH1I2sL//Z0RDlf71Fk3nKnoHoKSa6Bb8YbcYpQnThglSznxnuJqp5rG4yGstFgoOIsSg9nHivjEHeNX+oTQl3HRsj1aZwQo55UORLaCZ2Fq8W5c1rL7IhMaI1fKPG0XaI60xDzTRtl5Ubm4WtNAhE+cKk2F60rhjSipv5OA/LOCL7I8mJ7GgYoefdlxieFV4Q== rsa age"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFY+LZwVOUE9vl+umM1C/l7woqvB0oZGSRDse2PUV2YH ed25519 age"
          ];
          users = {
            chloe = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL9Ykx7Qq53UqoFVZFMmCLiDU4qFzzGNjkyCg1bIbjQ/ ed25519 home age" ];
            mediacenter = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIDAwYXdxw2VEZSBpRvvi58pkXZaESTkDlg+z5nr2sw6 ed25519 home age" ];
          };
        };
      };
      hosts = concatLists (attrValues (mapAttrs (_: v: v.host or [ ]) self.pubKeys.keys));
      users = concatLists (attrValues (mapAttrs (_: v: concatLists (attrValues v.users or [ ])) self.pubKeys.keys));
      all = self.pubKeys.hosts ++ self.pubKeys.users;
    };
  };
}
